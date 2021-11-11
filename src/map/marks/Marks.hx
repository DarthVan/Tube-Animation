package map.marks;

import openfl.display.Sprite;

/**
 * Marks
 * @author Sith
 */

class Marks extends Sprite {
	
	public var array(get, null) : Array<Mark>;
	
	public function new() {
		super();
		
		init();
	}
	
	public function getMarkById(id : String) : Mark {
		for (i in 0...array.length)
			if (array[i].id == id)
				return array[i];
		return null;
	}
	
	function init() : Void {
		array = new Array<Mark>();
		
		var mark : Mark;
		
		mark = new Mark(Targets.DISTANCE_LINE, 'assets/bitmap/marks/long_arrow.png');
		mark.x = 750;
		mark.y = 290;
		addChild(mark);
		array.push(mark);
		
		mark = new GSU(Targets.GTSU, 'assets/bitmap/marks/vector_gtsu.png', 'ГЦУ');
		mark.x = 197;
		mark.y = 370;
		addChild(mark);
		array.push(mark);
		
		mark = new RSU(Targets.RTSU, 'assets/bitmap/marks/vector_rtsu.png', 'PЦУ');
		mark.x = 458;
		mark.y = 350;
		addChild(mark);
		array.push(mark);
	}
	
	function get_array() : Array<Mark> {
		return array;
	}
}