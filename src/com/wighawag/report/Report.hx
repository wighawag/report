package com.wighawag.report;
import com.wighawag.report.event.Error;
import com.wighawag.report.event.Info;
import com.wighawag.report.event.Warning;
import primevc.core.dispatcher.Signal1;


class Report 
{
	
	private static var instance : Report = new Report();
	
	public static var info  : Signal1<Info> = new Signal1<Info>();
	public static var warning  : Signal1<Warning> = new Signal1<Warning>();
	public static var error  : Signal1<Error> = new Signal1<Error>();

	inline static public function anError(_error : Error) : Void 
	{
		error.send(_error);
	}
	
	inline static public function anInfo(_info : Info) : Void 
	{
		info.send(_info);
	}
	
	inline static public function aWarning(_warning : Warning) : Void 
	{
		warning.send(_warning);
	}
	
	private function new() : Void
	{
		
	}
	
}