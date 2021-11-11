package ui.progressbar;

import motion.Actuate;
import motion.easing.Elastic;
import motion.easing.Sine;
import openfl.display.Graphics;
import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * ...
 * @author Sith
 */

class Bar extends Sprite {

	var _mask : Shape;
	var _lineWhite : Shape;
	var _lineRed : Shape;
	
	var _onUpdate : Float->Void;
	
	public function new(? onUpdate : Float->Void) {
		super();
		
		_onUpdate = onUpdate;
		init();
	}
	
	function init() : Void {
		var g : Graphics;
		
		_lineWhite = new Shape();
		g = _lineWhite.graphics;
		g.beginFill(ProgressBar.COLOR1, 1);
		g.drawRoundRect(0, -ProgressBar.HEIGHT / 2, ProgressBar.WIDTH, ProgressBar.HEIGHT, ProgressBar.HEIGHT / 2, ProgressBar.HEIGHT / 2);
		g.endFill();
		addChild(_lineWhite);
		
		_lineRed = new Shape();
		g = _lineRed.graphics;
		g.beginFill(ProgressBar.COLOR2, 1);
		g.drawRoundRect(0, -ProgressBar.HEIGHT / 2, ProgressBar.WIDTH, ProgressBar.HEIGHT, ProgressBar.HEIGHT / 2, ProgressBar.HEIGHT / 2);
		g.endFill();
		addChild(_lineRed);
		
		_mask = new Shape();
		g = _mask.graphics;
		g.beginFill(0x0000FF, 0.5);
		g.drawRoundRect(0, -ProgressBar.HEIGHT / 2, ProgressBar.WIDTH, ProgressBar.HEIGHT, ProgressBar.HEIGHT / 2, ProgressBar.HEIGHT / 2);
		g.endFill();
		addChild(_mask);
		
		_lineRed.mask = _mask;
		
		for (i in 0...ProgressBar.TOTAL_CHECK_POINTS) {
			graphics.beginFill(ProgressBar.COLOR1);
			graphics.drawCircle((ProgressBar.WIDTH * i) / (ProgressBar.TOTAL_CHECK_POINTS - 1), 0, ProgressBar.RADIUS - 1);
			graphics.endFill();
		}
		
		fillBarByIndex(0, 0, ProgressBar.TOTAL_CHECK_POINTS);
	}
	
	/*public function fillBarByValue(value : Float, duration : Float) : Void {
		value = ProgressBar.WIDTH * value - ProgressBar.WIDTH;
		if (duration > 0)
			Actuate.tween(_mask, duration, {x:value}).ease(Sine.easeInOut).onUpdate(onMaskMove).onComplete(onMaskMove);
		else
			noTweenFill(value);
	}*/
	
	public function fillBarByIndex(index : Int, duration : Float, totalIndexes : Int) : Void {
		var value : Float = ((ProgressBar.WIDTH * index) / (totalIndexes - 1)) - ProgressBar.WIDTH;
		if (duration > 0)
			Actuate.tween(_mask, duration, {x:value}).ease(Sine.easeInOut).onUpdate(onMaskMove).onComplete(onMaskMove);
		else
			noTweenFill(value);
	}
	
	function noTweenFill(value : Float) : Void {
		_mask.x = value;
		onMaskMove();
	}
	
	function onMaskMove() : Void {
		if (_onUpdate != null)
			_onUpdate(_mask.x + ProgressBar.WIDTH);
	}
}