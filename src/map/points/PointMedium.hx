package map.points;

import fonts.Fonts;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.filters.GlowFilter;
import openfl.text.TextFormat;

/**
 * PointMedium
 * @author Sith
 */

class PointMedium extends BasicPoint {
	
	public var textAlpha(get, set) : Float;
	
	var _arrowPic : Bitmap;
	var _maxWidth : Int;
	
	static inline var ARROW_OFFSET : Int = 10;
	
	public function new(id : String, text : String, arrow : String = '▼', maxWidth : Int = 125) {
		_arrow = arrow;
		_maxWidth = maxWidth;
		
		super(id, text, arrow);
	}
	
	override function init() : Void {
		super.init();
		
		_bitmap.x -= _bitmap.width / 2;
		_bitmap.y -= _bitmap.height / 2;
		
		_arrowPic = new Bitmap(Assets.getBitmapData('assets/bitmap/points/arrow.png'), null, true);
		addChild(_arrowPic);
		
		if (_arrow == '')
			_arrowPic.visible = false;
			
		if (_text == '')
			_textField.visible = false;
			
		_textField.text = _text;
		_textField.width = _maxWidth;
		_textField.height = _textField.textHeight + 5;
		
		textAlpha = 1.0;
		
		switch (_arrow) {
			default:
				
			case '▼' :
				_arrowPic.x -= _arrowPic.width / 2;
				_arrowPic.y = -_bitmap.height / 2 - ARROW_OFFSET;
				
				_textField.x -= _textField.width / 2;
				_textField.y = _arrowPic.y - _textField.height;
			case '▲' :
				_arrowPic.scaleY = -1;
				_arrowPic.x -= _arrowPic.width / 2;
				_arrowPic.y = _bitmap.height / 2 + ARROW_OFFSET;
				
				_textField.x -= _textField.width / 2;
				_textField.y = _arrowPic.y + 2;
			case '►' :
				_arrowPic.rotation = -90;
				_arrowPic.x = -_bitmap.width / 2 - ARROW_OFFSET;
				_arrowPic.y += _arrowPic.height / 2;
				
				_textField.x = _arrowPic.x - _textField.width;
				_textField.y -= _textField.height / 2;
			case '◄' :
				_arrowPic.rotation = 90;
				_arrowPic.x = _bitmap.width / 2 + ARROW_OFFSET;
				_arrowPic.y -= _arrowPic.height / 2;
				
				_textField.x = _arrowPic.x;
				_textField.y -= _textField.height / 2;
		}
		
		_textField.x = Std.int(_textField.x);
		_textField.y = Std.int(_textField.y);
		
		_bitmap.x = Std.int(_bitmap.x);
		_bitmap.y = Std.int(_bitmap.y);
		
		_textField.filters = [new GlowFilter(0xFFFFFF, 10, 4, 4, 1, 1)];
	}
	
	override function setDesign() : Void {
		_bitmap.bitmapData = Assets.getBitmapData('assets/bitmap/points/medium.png');
		_textField.defaultTextFormat = new TextFormat(Fonts.ARIAL, 12, 0x0A52A1, null, null, null, null, null, 'center');
	}
	
	@:keep function get_textAlpha() : Float {
		return _textField.alpha;
	}
	
	@:keep function set_textAlpha(value : Float) : Float {
		return _textField.alpha = _arrowPic.alpha = value;
	}
}