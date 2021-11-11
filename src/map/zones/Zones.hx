package map.zones;

import openfl.display.Sprite;

/**
 * ...
 * @author Sith
 */

class Zones extends Sprite {
	
	public var array(get, null) : Array<Zone>;
	
	public function new() {
		super();
		
		init();
	}
	
	public function getZoneById(id : String) : Zone {
		for (i in 0...array.length)
			if (array[i].id == id)
				return array[i];
		return null;
	}
	
	function init() : Void {
		array = new Array<Zone>();
		
		var zone : Zone;
		
		zone = new Zone(Targets.ZONE1, 'assets/bitmap/zones/1.png');
		zone.x = 942;
		zone.y = 277;
		addChild(zone);
		array.push(zone);
		
		zone = new Zone(Targets.ZONE2, 'assets/bitmap/zones/2.png');
		zone.x = 440;
		zone.y = 220;
		addChild(zone);
		array.push(zone);
		
		zone = new Zone(Targets.ZONE3, 'assets/bitmap/zones/3.png');
		zone.x = 214;
		zone.y = 248;
		addChild(zone);
		array.push(zone);
		
		zone = new Zone(Targets.ZONE4, 'assets/bitmap/zones/4.png');
		zone.x = 141;
		zone.y = 279;
		addChild(zone);
		array.push(zone);
	}
	
	function get_array() : Array<Zone> {
		return array;
	}
}