package ;
import com.wighawag.report.ReportHandler;
import com.wighawag.report.event.Error;
import com.wighawag.report.Report;

class ReportUseTest{
	
	static public function main() : Void
	{
        haxe.Log.trace = myTrace;

		Report.anError('testChannel', "sdds");

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

        #end
    }
	
}
