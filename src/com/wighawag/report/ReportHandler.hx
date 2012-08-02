package com.wighawag.report;


import haxe.PosInfos;
interface ReportHandler {

    function onCriticalError(criticalError : Dynamic, ?pos : PosInfos) : Void;
    function onError(error : Dynamic, ?pos : PosInfos) : Void;
    function onWarning(warning : Dynamic, ?pos : PosInfos) : Void;
    function onInfo(info : Dynamic, ?pos : PosInfos) : Void;
}
