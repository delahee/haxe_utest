package unit.issues;

typedef Test = haxe.unit.TestCase;

class Issue4238 extends Test {

	public function new() 
	{
		super();
	}
	
	
	public function test() {
		inline function eq<T>(val:T,cst:T,?pos:haxe.PosInfos) {
			return assertEquals(val, cst,pos);
		}
		trace("go");
		#if (js || flash || cpp || neko||python||php||java||cs)
		var a : Array<Null<Int>> = null;
		
		#if !(flash)
		a = [5, 6];
		var res : Null<Int> = a[0];
		var b  : Bool = a.removeAt(0);
		eq( true, b );
		eq( 5, res );
		eq( 1, a.length);
		
		a = [];
		var b  : Bool = a.removeAt(0);
		eq( false, b );
		
		a = [1];
		var b  : Bool = a.removeAt(-1);
		eq( true, b );
		
		a = [1];
		var b  : Bool = a.removeAt(2);
		eq( false, b );
		
		a = [1];
		var b  : Bool = a.removeAt(-2);
		eq( false, b );
		#else
		a = [5, 6];
		var res : Null<Int> = a[0];
		a.removeAt(0);
		eq( 5, res );
		eq( 1, a.length);
		
		a = [];
		var b = a.removeAt(0);
		eq( null, b );
		
		a = [1];
		var b = a.removeAt(-1);
		eq( true, b!=null );
		
		a = [1];
		var b  = a.removeAt(2);
		eq( null, b );
		
		a = [1];
		var b  = a.removeAt( -2);
		#end
		
		a = [5, 6];
		var res = a[1];
		a.removeAt(1);
		eq(6, res );
		eq(1, a.length);
		
		trace(".");
		a = [5, 6];
		var res = a[1];
		a.removeAt(1);
		eq( 6, res);
		a = [5, 6];
		var res = a[a.length - 1];
		a.removeAt( -1 );
		eq( 6, res);
		a = [5, 6];
		var res = a[0];
		a.removeAt(0);
		eq( 5, res);
		
		a = [5, 6];
		var res = a[a.length - 1];
		a.removeAt(-1);
		eq( 6, res);
		
		a = [5, 6];
		var res = a[a.length - 2];
		a.removeAt(-2);
		eq( 5, res );
		
		#end
		
		//TODO
		//python
		//java
		//php
		//cs
	}
}