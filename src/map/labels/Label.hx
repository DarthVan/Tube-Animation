package map.labels;

import openfl.filters.DropShadowFilter;
import openfl.filters.GlowFilter;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * Label
 * @author Sith
 */

class Label extends MapObject {
	
	public var textField(get, null) : TextField;
	
	var _text : String;
	var _size : Int;
	var _color : UInt;
	var _font : String;
	var _bold : Bool;
	
	public function new(id : String, font : String, text : String, size : Int = 24, color : UInt = 0xFFFFFF, bold : Bool = false) {
		_font = font;
		_text = text;
		_size = size;
		_color = color;
		_bold = bold;
		
		super(id);
	}
	
	public function addGlow(blur : Float, color : UInt, alpha : Float = 0.5) : Void {
		filters = [new GlowFilter(color, alpha, blur, blur, 2, 2)];
	}
	
	public function addShadow(blur : Float) : Void {
		filters = [new DropShadowFilter(4, 90, 0x000000, 0.5, blur, blur, 1, 1)];
	}
	
	public function removeFilters() : Void {
		filters = [];
	}
	
	public function showAsMultilined(maxWidth : Int = 200) : Void {
		textField.multiline = true;
		textField.wordWrap = true;
		
		textField.width = maxWidth;
		textField.height = textField.textHeight + 10;
		
		textField.x = -textField.width / 2;
		textField.y = -textField.height / 2;
	}
	
	public function showAsSinglelined() : Void {
		textField.multiline = false;
		textField.wordWrap = false;
		
		textField.width = textField.textWidth + 10;
		textField.height = textField.textHeight + 10;
		
		textField.x = -textField.width / 2;
		textField.y = -textField.height / 2;
	}
	
	override function init() : Void {
		super.init();
		
		var textFormat : TextFormat = new TextFormat(_font, _size, _color, _bold);
		textFormat.align = TextFormatAlign.CENTER;
		
		textField = new TextField();
		textField.defaultTextFormat = textFormat;
		textField.multiline = false;
		textField.wordWrap = false;
		textField.selectable = false;
		textField.mouseWheelEnabled = false;
		textField.text = _text;
		textField.width = textField.textWidth + 10;
		textField.height = textField.textHeight + 10;
		
		textField.x -= textField.width / 2;
		textField.y -= textField.height / 2;
		
		addChild(textField);
		
		mouseEnabled = mouseChildren = false;
	}
	
	function get_textField() : TextField {
		return textField;
	}
}