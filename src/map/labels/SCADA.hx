package map.labels;

import openfl.display.Shape;
import openfl.display.Sprite;

/**
 * SCADA
 * @author Sith
 */

class SCADA extends Label {
	
	public var fogAlpha(get, set) : Float;
	public var textScale(get, set) : Float;
	
	var _fog : Shape;
	var _textContainer : Sprite;
	
	public function new(id : String, font : String, text : String, size : Int = 120, color : UInt = 0x0A52A1, bold : Bool = false) {
		super(id, font, text, size, color, bold);
	}
	
	override function init() : Void {
		super.init();
		
		_fog = new Shape();
		_fog.graphics.beginFill(0xFFFFFF, 0.5);
		_fog.graphics.drawRect(-709, -450, 1418, 900);
		_fog.graphics.endFill();
		addChild(_fog);
		
		_textContainer = new Sprite();
		_textContainer.addChild(textField);
		addChild(_textContainer);
	}
	
	@:keep function get_fogAlpha() : Float {
		return _fog.alpha;
	}
	
	@:keep function set_fogAlpha(value : Float) : Float {
		return _fog.alpha = value;
	}
	
	@:keep function get_textScale() : Float {
		return _textContainer.scaleX;
	}
	
	@:keep function set_textScale(value : Float) : Float {
		return _textContainer.scaleX = _textContainer.scaleY = value;
	}
	
}