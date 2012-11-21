package com.wighawag.report;

import haxe.PosInfos;

class DefaultLogger {

    public static function trace(severity : Dynamic, ?posInfos : PosInfos) : Void
    {
        var channel = "";
        var extraParams = "";
        if (posInfos.customParams != null && posInfos.customParams.length > 0){
            channel = " {" + posInfos.customParams[0] + "}";

            for (i in 1...posInfos.customParams.length){
                var extraComma = ", ";
                if (i==1){
                    extraComma = " : ";
                }
                extraParams += extraComma + posInfos.customParams[i];
            }

        }

        var message : String = severity  + channel + extraParams;

        #if flash
			flash.Lib.trace(message);
		#elseif cpp
		    cpp.Lib.println(message);
		#else
            //trace(value, posInfos);
        #end
    }

}
