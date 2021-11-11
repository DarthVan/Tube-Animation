package ui.player;

import motion.Actuate;
import motion.easing.Elastic;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * PlayerButton
 * @author Sith
 */

class PlayerButton extends Sprite {

	var _bitmapData : BitmapData;
	var _icon : Bitmap;
	var _eventType : String;
	
	static inline var QUAD_SIZE : Int = 28;
	
	public function new(bitmapData : BitmapData, eventType : String) {
		super();
		
		_bitmapData = bitmapData;
		_eventType = eventType;
		
		init();
	}
	
	public function enable() : Void {
		addEventListener(MouseEvent.CLICK, onClick);
	}
	
	public function disable() : Void {
		removeEventListener(MouseEvent.CLICK, onClick);
	}
	
	function init() : Void {
		
		_icon = new Bitmap(_bitmapData);
		addChild(_icon);
		
		buttonMode = true;
		
		graphics.beginFill(0xFF0000, 0.0);
		graphics.drawRect(-2, -2, QUAD_SIZE, QUAD_SIZE);
		graphics.endFill();
		
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	
	function onClick(e : MouseEvent) : Void {
		Main.current.ui.player.dispatchEvent(new PlayerEvent(_eventType));
		Actuate.tween(_icon, 0.5, {y: 0}).ease(Elastic.easeOut);
	}
	
	function onMouseOver(e : MouseEvent) : Void {
		Actuate.tween(_icon, 0.5, {y: -2}).ease(Elastic.easeOut);
	}
	
	function onMouseOut(e : MouseEvent) : Void {
		Actuate.tween(_icon, 0.5, {y: 0}).ease(Elastic.easeOut);
	}
	
	function onMouseDown(e : MouseEvent) : Void {
		Actuate.tween(_icon, 0.5, {y: 2}).ease(Elastic.easeOut);
	}
}