package map.marks;

import fonts.Fonts;
import openfl.filters.GlowFilter;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * RSU
 * @author Sith
 */

class RSU extends Mark {
	
	var _textField : TextField;
	var _text : String;
	
	public function new(id : String, url : String, text : String) {
		_text = text;
		super(id, url);
	}
	
	override function init() : Void {
		super.init();
		
		_textField = new TextField();
		_textField.selectable = false;
		_textField.mouseWheelEnabled = false;
		_textField.multiline = true;
		_textField.wordWrap = true;
		addChild(_textField);
		
		_textField.defaultTextFormat = new TextFormat(Fonts.ARIAL, 16, 0x0A52A1, null, null, null, null, null, 'center');
		_textField.text = _text;
		_textField.width = 100;
		_textField.height = _textField.textHeight + 5;
		
		_textField.x = -10;
		_textField.y = -37;
		
		_textField.x = Std.int(_textField.x);
		_textField.y = Std.int(_textField.y);
		
		_textField.filters = [new GlowFilter(0xFFFFFF, 10, 4, 4, 1, 2)];
	}
}