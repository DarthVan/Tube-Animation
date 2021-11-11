package map.weather;

import openfl.display.Sprite;

/**
 * Weather
 * @author Sith
 */

class Weather extends Sprite {
	
	public var array(get, null) : Array<MapObject>;
	
	public function new() {
		super();
		
		init();
	}
	
	public function getWeatherById(id : String) : MapObject {
		for (i in 0...array.length)
			if (array[i].id == id)
				return array[i];
		return null;
	}
	
	function init() : Void {
		array = new Array<MapObject>();
		
		var weatherObject : MapObject;
		
		weatherObject = new Sun(Targets.SUN);
		weatherObject.x = 1082;
		weatherObject.y = 168;
		addChild(weatherObject);
		array.push(weatherObject);
		
		weatherObject = new Clouds(Targets.CLOUD);
		weatherObject.x = 705;
		weatherObject.y = 275;
		addChild(weatherObject);
		array.push(weatherObject);
		
		weatherObject = new Storm(Targets.THUNDERSTORM);
		weatherObject.x = 215;
		weatherObject.y = 325;
		addChild(weatherObject);
		array.push(weatherObject);
	}
	
	function get_array() : Array<MapObject> {
		return array;
	}
}