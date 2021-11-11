package map.points;

import fonts.Fonts;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.text.TextFormat;

/**
 * PointBlack
 * @author Sith
 */

class PointBlack extends BasicPoint {

	public function new(id : String, text : String, arrow : String = '▼') {
		super(id, text, arrow);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap.x -= _bitmap.width / 2;
		_bitmap.y -= _bitmap.height / 2;
		
		_textField.text = _text;
		_textField.width = _textField.textWidth + 5;
		_textField.height = _textField.textHeight + 5;
		
		switch (_arrow) {
			default:
				
			case '▼' :
				_textField.x -= _textField.width / 2;
				_textField.y -= 20;
			case '►':
				_textField.x -= (_textField.width + 5);
				_textField.y -= _textField.height / 2;
		}
		
		_textField.x = Std.int(_textField.x);
		_textField.y = Std.int(_textField.y);
	}
	
	override function setDesign() : Void {
		_bitmap.bitmapData = Assets.getBitmapData('assets/bitmap/points/black.png');
		_textField.defaultTextFormat = new TextFormat(Fonts.ARIAL, 12, 0x333333, null, null, null, null, null, 'center');
	}
}