/****
* Wighawag License:
* - free to use for commercial and non commercial application
* - provided the modification done to it are given back to the community
* - use at your own risk
* 
****/

package wighawag.report;

import wighawag.report.ReportUtil;
import haxe.PosInfos;

class DefaultLogger {

    public static function trace(severity : Dynamic, ?posInfos : PosInfos) : Void
    {
        var message = ReportUtil.getMessage(severity, posInfos);

        #if flash
			flash.Lib.trace(message);
		#elseif js
            js.Lib.trace(message);
        #else
	        untyped __trace(message, posInfos);
        #end
    }



}
