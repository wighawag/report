package com.wighawag.report;

import com.wighawag.report.ReportUtil;
import haxe.PosInfos;

class DefaultLogger {

    public static function trace(severity : Dynamic, ?posInfos : PosInfos) : Void
    {
        var message = ReportUtil.getMessage(severity, posInfos);

        #if flash
			flash.Lib.trace(message);
		#else
	        untyped __trace(message, posInfos);
        #end
    }



}
