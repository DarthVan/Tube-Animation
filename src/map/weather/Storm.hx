package map.weather;

import map.MapObject;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * Storm
 * @author Sith
 */

class Storm extends MapObject {
	
	var _bitmap1 : Bitmap;
	var _bitmap2 : Bitmap;
	var _rain : Array<Bitmap>;
	
	var _bitmap1Cont : Sprite;
	var _bitmap2Cont : Sprite;
	var _rainCont : Sprite;
	
	var _offsetX : Float;
	var _offsetY : Float;
	
	public function new(id : String) {
		super(id);	
	}
	
	override function init() : Void {
		super.init();
		
		_rain = new Array<Bitmap>();
		
		_rainCont = new Sprite();
		addChild(_rainCont);
		
		var dampleBD : BitmapData = Assets.getBitmapData('assets/bitmap/weather/raining_sample.png');
		for (i in 0...10) {
			var sample : Bitmap = new Bitmap(dampleBD, null, true);
			sample.x = -i * 4 + Math.random() * 50;
			sample.y = i * 8;
			_rainCont.addChild(sample);
			_rain.push(sample);
		}
		_rainCont.x -= _rainCont.width / 2 - 25;
		_rainCont.y -= _rainCont.height / 2 - 50;
		
		_bitmap1Cont = new Sprite();
		addChild(_bitmap1Cont);
		_bitmap2Cont = new Sprite();
		addChild(_bitmap2Cont);
		
		_bitmap1 = new Bitmap(Assets.getBitmapData('assets/bitmap/weather/cloud_dark.png'), null, true);
		_bitmap1.x = _offsetX = -_bitmap1.width / 2;
		_bitmap1.y = _offsetY = -_bitmap1.height / 2;
		_bitmap1Cont.addChild(_bitmap1);
		
		_bitmap2 = new Bitmap(_bitmap1.bitmapData, null, true);
		_bitmap2.x = _offsetX;
		_bitmap2.y = _offsetY;
		_bitmap2Cont.addChild(_bitmap2);
		_bitmap2Cont.x = 25;
		_bitmap2Cont.y = 10;
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e : Event) : Void {
		var time : Float = Date.now().getTime();
		
		_bitmap1.x = Math.sin(time / 2000) * 25 + _offsetX;
		_bitmap1.y = Math.sin(time / 1000) * 10 + _offsetY;
		
		_bitmap2Cont.x = Math.sin(time / 2500) * 5 + 40;
		_bitmap2Cont.y = Math.sin(time / 2500) * 5 + 10;
		
		for (i in 0...10) {
			var sample : Bitmap = _rain[i];
			sample.x -= 1;
			sample.y += 2;
			sample.alpha -= 0.01;
			if (sample.y > 90) {
				sample.x = Math.random() * 50;
				sample.y = 0;
				sample.alpha = 1.0;
			}
		}
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