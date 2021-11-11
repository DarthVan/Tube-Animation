package map.zones;

import map.MapObject;
import openfl.Assets;
import openfl.display.Bitmap;

/**
 * MapObject
 * @author Sith
 */

class Zone extends MapObject {
	
	var _bitmap : Bitmap;
	var _url : String;
	
	public function new(id : String, url : String) {
		_url = url;
		super(id);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap = new Bitmap(Assets.getBitmapData(_url));
		addChild(_bitmap);
	}
}