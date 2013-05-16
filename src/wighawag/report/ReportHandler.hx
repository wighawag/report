/****
* Wighawag License:
* - free to use for commercial and non commercial application
* - provided the modification done to it are given back to the community
* - use at your own risk
* 
****/

package wighawag.report;


import haxe.PosInfos;
interface ReportHandler {

    function onCriticalError(criticalError : Dynamic, ?pos : PosInfos) : Void;
    function onError(error : Dynamic, ?pos : PosInfos) : Void;
    function onWarning(warning : Dynamic, ?pos : PosInfos) : Void;
    function onInfo(info : Dynamic, ?pos : PosInfos) : Void;
}
