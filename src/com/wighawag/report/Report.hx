package com.wighawag.report;

import haxe.macro.Expr;
import msignal.Signal;

import haxe.PosInfos;

class Report
{
    @:macro static public function aDebugInfo(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
    {
        return report("debug", channel, message, exprs);
    }

	@:macro static public function anError(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
	{
        return report("error", channel, message, exprs);
	}

    @:macro static public function aWarning(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
	{
        return report("warn", channel, message, exprs);
	}

    @:macro static public function anInfo(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
	{
        return report("info", channel, message, exprs);
	}

    @:macro static public function any(channel : Expr, message : Expr, ?exprs : Array<Expr>) : Expr
    {
        return report("log", channel, message, exprs);
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