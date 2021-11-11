package map.points;

import map.MapObject;
import openfl.display.Bitmap;
import openfl.text.TextField;

/**
 * BasicPoint
 * @author Sith
 */

class BasicPoint extends MapObject {
	
	var _bitmap : Bitmap;
	var _textField : TextField;
	var _text : String;
	var _arrow : String; // ► ◄ ▲ ▼
	
	public function new(id : String, text : String, arrow : String = '▼') {
		_text = text;
		_arrow = arrow;
		
		super(id);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap = new Bitmap();
		_bitmap.smoothing = true;
		addChild(_bitmap);
		
		_textField = new TextField();
		_textField.selectable = false;
		_textField.mouseWheelEnabled = false;
		_textField.multiline = true;
		_textField.wordWrap = true;
		addChild(_textField);
		
		setDesign();
	}
	
	function setDesign() : Void {
		
	}
}