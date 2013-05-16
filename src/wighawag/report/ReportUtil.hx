/****
* Wighawag License:
* - free to use for commercial and non commercial application
* - provided the modification done to it are given back to the community
* - use at your own risk
* 
****/

package wighawag.report;

import haxe.PosInfos;

class ReportUtil {

	inline public static function getMessage(severity : Dynamic, ?posInfos : PosInfos) : String{
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

		return severity  + channel + extraParams;
	}

}
