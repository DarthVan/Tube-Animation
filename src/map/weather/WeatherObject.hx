package map.weather;

import map.MapObject;
import openfl.Assets;
import openfl.display.Bitmap;

/**
 * WeatherObject
 * @author Sith
 */

class WeatherObject extends MapObject {

	var _bitmap : Bitmap;
	var _url : String;
	
	public function new(id : String, url : String) {
		_url = url;
		super(id);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap = new Bitmap(Assets.getBitmapData(_url), null, true);
		_bitmap.x -= _bitmap.width / 2;
		_bitmap.y -= _bitmap.height / 2;
		addChild(_bitmap);
	}
}