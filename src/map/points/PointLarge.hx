package map.points;

import fonts.Fonts;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextFormat;

/**
 * PointLarge
 * @author Sith
 */

class PointLarge extends PointMedium {
	
	public var glow(get, set) : Float;
	
	var _bitmap2 : Bitmap;
	
	public function new(id : String, text : String, arrow : String = '▼', maxWidth : Int = 125) {
		super(id, text, arrow, maxWidth);
	}
	
	override function init() : Void {
		super.init();
	}
	
	override function setDesign() : Void {
		_bitmap.bitmapData = Assets.getBitmapData('assets/bitmap/points/large.png');
		_textField.defaultTextFormat = new TextFormat(Fonts.ARIAL, 12, 0xEB3639, null, null, null, null, null, 'center');
		
		_bitmap2 = new Bitmap(Assets.getBitmapData('assets/bitmap/points/large_filled.png'));
		_bitmap2.x -= _bitmap2.width / 2;
		_bitmap2.y -= _bitmap2.height / 2;
		addChild(_bitmap2);
	}
	
	@:keep function get_glow() : Float {
		return _bitmap2.alpha;
	}
	
	@:keep function set_glow(value : Float) : Float {
		return _bitmap2.alpha = value;
	}
}