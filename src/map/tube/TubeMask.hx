package map.tube;

import openfl.display.Shape;

/**
 * ...
 * @author Sith
 */

class TubeMask extends Shape {
	
	static inline var COLOR : UInt = 0xFF0000;
	static inline var ALPHA : Float = 0.5;
	
	public function new() {
		super();
		
		init();
	}
	
	function init() : Void {
		
		graphics.beginFill(COLOR, ALPHA);
		graphics.drawRect(25, 0, 1100, 300);
		graphics.drawRoundRectComplex(0, 125, 25, 50, 25, 0, 25, 0);
		//graphics.drawCircle(25, 150, 25);
		graphics.endFill();
		
	}
	
}