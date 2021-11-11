package map.marks;

import openfl.Assets;
import openfl.display.Bitmap;

/**
 * Mark
 * @author Sith
 */

class Mark extends MapObject {
	
	var _bitmap : Bitmap;
	var _url : String;
	
	public function new(id : String, url : String) {
		_url = url;
		super(id);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap = new Bitmap(Assets.getBitmapData(_url));
		_bitmap.x -= _bitmap.width / 2;
		_bitmap.y -= _bitmap.height / 2;
		addChild(_bitmap);
		
		_bitmap.x = Std.int(_bitmap.x);
		_bitmap.y = Std.int(_bitmap.y);
	}
}