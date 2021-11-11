package map.points;

import fonts.Fonts;
import openfl.Assets;
import openfl.text.TextFormat;

/**
 * PointSource
 * @author Sith
 */

class PointOilSource extends PointMedium {
	
	var _url : String;
	
	public function new(id : String, url : String) {
		_url = url;
		super(id, '', '', 125);
	}
	
	override function init() : Void {
		super.init();
	}
	
	override function setDesign() : Void {
		_bitmap.bitmapData = Assets.getBitmapData(_url);
		_textField.defaultTextFormat = new TextFormat(Fonts.ARIAL, 12, 0x0A52A1, null, null, null, null, null, 'center');
	}
}