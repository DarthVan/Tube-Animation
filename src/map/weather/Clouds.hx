package map.weather;

import map.MapObject;
import openfl.display.Sprite;
import openfl.events.Event;

import openfl.Assets;
import openfl.display.Bitmap;

/**
 * MapObject
 * @author Sith
 */

class Clouds extends MapObject {

	var _bitmap1 : Bitmap;
	var _bitmap2 : Bitmap;
	var _bitmap2Cont : Sprite;
	
	var _offsetX : Float;
	var _offsetY : Float;
	
	public function new(id : String) {
		super(id);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap1 = new Bitmap(Assets.getBitmapData('assets/bitmap/weather/overcast.png'), null, true);
		_bitmap1.x = _offsetX = -_bitmap1.width / 2;
		_bitmap1.y = _offsetY = -_bitmap1.height / 2;
		addChild(_bitmap1);
		
		_bitmap2Cont = new Sprite();
		addChild(_bitmap2Cont);
		
		_bitmap2 = new Bitmap(_bitmap1.bitmapData, null, true);
		_bitmap2.x = _offsetX;
		_bitmap2.y = _offsetY;
		_bitmap2Cont.addChild(_bitmap2);
		_bitmap2Cont.x = 25;
		_bitmap2Cont.y = 10;
		_bitmap2Cont.rotation += 75;
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e : Event) : Void {
		var time : Float = Date.now().getTime();
		
		_bitmap1.x = Math.sin(time / 2000) * 20 + _offsetX;
		_bitmap1.y = Math.sin(time / 1000) * 10 + _offsetY;
		
		_bitmap2Cont.x = Math.sin(time / 2500) * 5 + 25;
		_bitmap2Cont.y = Math.sin(time / 2500) * 5 + 10;
		
		_bitmap2Cont.rotation += .02;
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