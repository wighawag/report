package com.wighawag.report;

import haxe.macro.Expr;
import msignal.Signal;

import haxe.PosInfos;

class Report
{
    @:macro static public function aDebugInfo(channel : String, message : String, ?exprs : Array<Expr>) : Expr
    {
        return report("debug", channel, message, exprs);
    }

	@:macro static public function anError(channel : String, message : String, ?exprs : Array<Expr>) : Expr
	{
        return report("error", channel, message, exprs);
	}

    @:macro static public function aWarning(channel : String, message : String, ?exprs : Array<Expr>) : Expr
	{
        return report("warn", channel, message, exprs);
	}

    @:macro static public function anInfo(channel : String, message : String, ?exprs : Array<Expr>) : Expr
	{
        return report("info", channel, message, exprs);
	}

    @:macro static public function any(channel : String, message : String, ?exprs : Array<Expr>) : Expr
    {
        return report("log", channel, message, exprs);
    }

    #if macro
    static private function report(severity : String, channel : String, message : String, ?exprs : Array<Expr>) : Expr
    {
        var context = haxe.macro.Context;
        var pos = context.currentPos();


        // TODO WHYE ARE THEY SHOWN IN DIFFERENT ORDER ?
        /*
        var traceExpr = context.parse("trace('error','" + channel + "','" + message + "')", pos);
        trace(traceExpr.expr);
        switch (traceExpr.expr){
            case ECall(e,params):
                for (e in exprs){
                    params.push(e);
                }

            default : trace("trace should be a call");
        }
        return traceExpr;
        */


        var params = new Array<Expr>();
        params.push({expr : EConst(CString(severity)), pos : pos});
        params.push({expr : EConst(CString(message)), pos : pos}); // TODO WHY DO WE need to swap message and channel to get them in the correct order ?
        params.push({expr : EConst(CString(channel)), pos : pos});
        if (exprs != null){
            params = params.concat(exprs);
        }
        return {expr : ECall({expr : EConst(CIdent('trace')), pos : pos},params), pos : pos};


    }

    #end

}