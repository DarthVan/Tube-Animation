package ui.progressbar;

import motion.Actuate;
import motion.easing.Elastic;
import motion.easing.Linear;
import openfl.display.Graphics;
import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * BarPoint
 * @author Sith
 */

class BarPoint extends Sprite {
	
	public var index(get, null) : Int;
	public var activated(get, null) : Bool;
	
	var _circleRed : Shape;
	
	public function new(index : Int) {
		super();
		
		this.index = index;
		init();
	}
	
	public function activate() : Void {
		if (index == 0 || activated)
			return;
			
		Actuate.tween(_circleRed, 1.25, {width: ProgressBar.RADIUS * 2, height: ProgressBar.RADIUS * 2}).ease(Elastic.easeOut).onComplete(onActivated);
		
		activated = true;
	}
	
	public function deactivate() : Void {
		if (index == 0 || !activated)
			return;
			
		Actuate.tween(_circleRed, 0.25, {width: 0, height: 0}).ease(Linear.easeNone).onComplete(onDeactivated);
		
		activated = false;
	}
	
	function init() : Void {
		
		if (index == 0) {
			graphics.beginFill(ProgressBar.COLOR2);
			graphics.drawCircle(0, 0, ProgressBar.RADIUS);
			graphics.endFill();
			graphics.beginFill(ProgressBar.COLOR1);
			graphics.drawCircle(0, 0, ProgressBar.RADIUS - 2);
			graphics.endFill();
			return;
		}
		
		var g : Graphics;
		_circleRed = new Shape();
		g = _circleRed.graphics;
		g.beginFill(ProgressBar.COLOR2);
		g.drawCircle(0, 0, ProgressBar.RADIUS);
		g.endFill();
		addChild(_circleRed);
		
		onDeactivated();
	}
	
	function get_index() : Int {
		return index;
	}
	
	function get_activated() : Bool {
		return activated;
	}
	
	function onActivated() : Void {
		_circleRed.width = _circleRed.height = ProgressBar.RADIUS * 2;
		//activated = true;
	}
	
	function onDeactivated() : Void {
		_circleRed.width = _circleRed.height = 0.0;
		//activated = false;
	}
}