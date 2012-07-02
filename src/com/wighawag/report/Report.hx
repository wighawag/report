package com.wighawag.report;
import primevc.core.dispatcher.Signal1;


class Report 
{
	
	private static var instance : Report = new Report();
	
	public static var info  : Signal1<Dynamic> = new Signal1<Dynamic>();
	public static var warning  : Signal1<Dynamic> = new Signal1<Dynamic>();
	public static var error  : Signal1<Dynamic> = new Signal1<Dynamic>();

	inline static public function anError(_error : Dynamic) : Void
	{
		error.send(_error);
	}
	
	inline static public function anInfo(_info : Dynamic) : Void
	{
		info.send(_info);
	}
	
	inline static public function aWarning(_warning : Dynamic) : Void
	{
		warning.send(_warning);
	}
	
	private function new() : Void
	{
		
	}
	
}