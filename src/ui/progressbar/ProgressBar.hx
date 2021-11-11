package ui.progressbar;

import motion.Actuate;
import openfl.display.Sprite;

/**
 * ...
 * @author Sith
 */

class ProgressBar extends Sprite {
	
	var _bar : Bar;
	var _points : Array<BarPoint>;
	var _lastIndex : Int;
	
	public static inline var TOTAL_CHECK_POINTS : Int = 10;
	
	public static inline var COLOR1 : UInt = 0xFFFFFF;
	public static inline var COLOR2 : UInt = 0xEB3639;
	
	public static inline var WIDTH : Int = 954;
	public static inline var HEIGHT : Int = 4;
	public static inline var RADIUS : Int = 8;
	
	public function new() {
		super();
		
		init();
	}
	
	public function tweenToCheckPoint(index : Int, duration : Float) : Void {
		//var index : Int = Std.parseInt(properties.position);
		//var duration : Float = Std.parseFloat(properties.duration);
		
		if (index < 0 || index > TOTAL_CHECK_POINTS - 1) {
			//trace ('ProgressBar: wrong index to update!');
			return;
		}
		
		if (index == _lastIndex) {
			//trace ('ProgressBar: index no changed! index = ' + index + '; lastIndex = ' + _lastIndex);
			return;
		}
		
		_bar.fillBarByIndex(index, duration, TOTAL_CHECK_POINTS);
		_lastIndex = index;
	}
	
	public function setCheckPoint(properties : Dynamic) : Void {
		var index : Int = Std.parseInt(properties.position);
		_bar.fillBarByIndex(index, 0.0, TOTAL_CHECK_POINTS);
	}
	
	function init() : Void {
		_lastIndex = 0;
		
		_points = new Array<BarPoint>();
		
		_bar = new Bar(onBarUpdate);
		addChild(_bar);
		
		for (i in 0...TOTAL_CHECK_POINTS) {
			var barPoint : BarPoint = new BarPoint(i);
			barPoint.x = (WIDTH * i) / (TOTAL_CHECK_POINTS - 1);
			addChild(barPoint);
			_points.push(barPoint);
		}
	}
	
	function onBarUpdate(value : Float) : Void {
		for (i in 0..._points.length) {
			if (value + 1 >= (WIDTH * i) / (TOTAL_CHECK_POINTS - 1))
				_points[i].activate();
			else
				_points[i].deactivate();
		}
		
	}
}