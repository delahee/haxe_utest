
class Main  {
	
	static function main() 
	{
		var runner = new haxe.unit.TestRunner();
        runner.add(new unit.issues.Issue4238());
        var success = runner.run();

        #if sys
        Sys.exit(success ? 0 : 1);
        #end
	}
	
}