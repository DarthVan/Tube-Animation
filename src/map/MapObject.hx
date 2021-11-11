package map;

import openfl.display.Sprite;

/**
 * MapObject
 * @author Sith
 */

class MapObject extends Sprite {

	public var id(get, null) : String;
	public var scale(get, set) : Float;
	
	public function new(id : String) {
		super();
		this.id = id;
		init();
	}
	
	function init() : Void {
		mouseEnabled = mouseChildren = false;
	}
	
	function get_id() : String {
		return id;
	}
	
	@:keep function get_scale() : Float {
		return scaleX;
	}
	
	@:keep function set_scale(value : Float) : Float {
		return scaleX = scaleY = value;
	}
}