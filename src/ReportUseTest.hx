package ;
import com.wighawag.report.event.Error;
import com.wighawag.report.Report;
//import primevc.utils.Bind;

using primevc.utils.Bind;

class ReportUseTest{
	
	static public function main() : Void
	{
		handleError.on(Report.error,null);
		
		Report.anError('test');
	}
	
	static private function handleError(error : Dynamic) : Void
	{
		trace(error);
	}

	
	
}