package ;
import com.wighawag.report.ReportHandler;
import com.wighawag.report.event.Error;
import com.wighawag.report.Report;

#if flash
class ReportUseTest extends flash.display.Sprite{
#else
class ReportUseTest{
#end

    #if flash
        public function new() {super();}
    #end
	
	static public function main() : Void
	{
        haxe.Log.trace = myTrace;

		Report.anError('testChannel', "sdds");

        var sd : Int =  1;
        Report.aDebugInfo('testChannel', "sdds", [sd]);
        Report.aWarning('testChannel', "sdds", [sd]);

        Report.any("testChannel", "message", ["dsd", 4, 67]);
	}

    private static function myTrace( v : Dynamic, ?inf : haxe.PosInfos ) {
        #if cpp
            if (inf.customParams != null)
            {
                cpp.Lib.println(v + inf.customParams);
            }
            else
            {
                cpp.Lib.println(v);
            }
        #elseif flash
            flash.Lib.trace(v + inf.customParams);
        #end

    }
	
}
