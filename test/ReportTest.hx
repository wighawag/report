package;

import haxe.Log;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

class ReportTest 
{
    private static function testTrace(severity: Dynamic, ?posInfos : haxe.PosInfos) : Void{
        var message = wighawag.report.ReportUtil.getMessage(severity, posInfos);
        if(onMessage != null){
            onMessage(message);
        }
    }

    private static var onMessage : String -> Void;

	public function new() 
	{
		
	}
	
	@BeforeClass
	public function beforeClass():Void
	{
	    Log.trace = testTrace;
	}
	
	@AfterClass
	public function afterClass():Void
	{
	}
	
	@Before
	public function setup():Void
	{
	}
	
	@After
	public function tearDown():Void
	{
	    onMessage = null;
	}
	
	
	@AsyncTest
	public function errorsAreReported(factory:AsyncFactory):Void
	{
	    function onErrorReported():Void{
            Assert.isFalse(false);
        }
		var handler = factory.createHandler(this, onErrorReported, 300);
        onMessage = function(message : String):Void{
            if(message.indexOf("an error occured")!= -1){
                handler();
            }else{
                Assert.isTrue(false);
            }
        }
		Report.anError("testChannel","an error occured");
	}
	
	private function onTestAsyncExampleComplete():Void
	{
		Assert.isFalse(false);
	}
	
	
	/**
	* test that only runs when compiled with the -D testDebug flag
	*/
	@TestDebug
	public function testExampleThatOnlyRunsWithDebugFlag():Void
	{
		Assert.isTrue(true);
	}

}
