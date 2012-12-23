package com.wighawag.report;

import haxe.macro.Expr;

import haxe.PosInfos;

class Report
{

	public static var DEBUG = "debug";
	public static var ERROR = "error";
	public static var WARNING = "warn";
	public static var INFO = "info";
	public static var LOG = "log";

    @:macro static public function aDebugInfo(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
    {
        return report(DEBUG, channel, message, exprs);
    }

	@:macro static public function anError(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
	{
        return report(ERROR, channel, message, exprs);
	}

    @:macro static public function aWarning(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
	{
        return report(WARNING, channel, message, exprs);
	}

    @:macro static public function anInfo(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
	{
        return report(INFO, channel, message, exprs);
	}

    @:macro static public function any(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
    {
        return report(LOG, channel, message, exprs);
    }

    #if macro
    static private function report(severity : String, channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
    {
        var context = haxe.macro.Context;
        var pos = context.currentPos();


        var params = new Array<Expr>();
        params.push({expr : EConst(CString(severity)), pos : pos});


        if (exprs != null){
            params.push(message); // TODO WHY DO WE need to swap message and channel to get them in the correct order ?
            params.push(channel);
            params = params.concat(exprs);
        }
        else
        {
            params.push(channel);
            params.push(message);
        }
        return {expr : ECall({expr : EConst(CIdent('trace')), pos : pos},params), pos : pos};
    }

    #end

}