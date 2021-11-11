package map.weather;

import map.MapObject;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * MapObject
 * @author Sith
 */

class Sun extends MapObject {
	
	var _bitmap1 : Bitmap;
	var _bitmap2 : Bitmap;
	var _bitmap1Cont : Sprite;
	var _bitmap2Cont : Sprite;
	
	var _offsetX : Float;
	var _offsetY : Float;
	
	public function new(id : String) {
		super(id);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap1Cont = new Sprite();
		addChild(_bitmap1Cont);
		_bitmap2Cont = new Sprite();
		addChild(_bitmap2Cont);
		
		_bitmap1 = new Bitmap(Assets.getBitmapData('assets/bitmap/weather/sun3.png'), null, true);
		_bitmap1.x = _offsetX = -_bitmap1.width / 2;
		_bitmap1.y = _offsetY = -_bitmap1.height / 2;
		_bitmap1.alpha = 1.0;
		_bitmap1Cont.addChild(_bitmap1);
		
		_bitmap2 = new Bitmap(_bitmap1.bitmapData, null, true);
		_bitmap2.x = _offsetX;
		_bitmap2.y = _offsetY;
		_bitmap2.alpha = .7;
		_bitmap2Cont.addChild(_bitmap2);
		_bitmap2Cont.rotation += 75;
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e : Event) : Void {
		_bitmap1Cont.rotation += .05;
		_bitmap2Cont.rotation -= .1;
	}
	
	@:keep override function get_scale() : Float {
		return scaleX;
	}
	
	@:keep override function set_scale(value : Float) : Float {
		if (value < 0.2)
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		else
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		
		return scaleX = scaleY = value;
	}
}