package map.points;

import fonts.Fonts;
import openfl.Assets;
import openfl.text.TextFormat;

/**
 * PointVPU
 * @author Sith
 */

class PointVPU extends PointMedium {

	public function new(id : String, text : String, arrow : String = '▼', maxWidth : Int = 125) {
		super(id, text, arrow, maxWidth);
	}
	
	override function init() : Void {
		super.init();
	}
	
	override function setDesign() : Void {
		_bitmap.bitmapData = Assets.getBitmapData('assets/bitmap/points/vpu.png');
		_textField.defaultTextFormat = new TextFormat(Fonts.ARIAL, 12, 0x0A52A1, null, null, null, null, null, 'center');
	}
}