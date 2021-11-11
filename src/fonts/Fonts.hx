package fonts;

import openfl.Assets;
import openfl.text.Font;

/**
 * Fonts
 * @author Sith
 */

class Fonts {
	
	public static var ARIAL(default, null) : String;
	public static var HELIOS(default, null) : String;
	
	public function new() {
		
	}
	
	public static function init() : Void {
		ARIAL = Assets.getFont("assets/fonts/Arial.ttf").fontName;
		HELIOS = Assets.getFont("assets/fonts/HeliosCond Bold.ttf").fontName;
		
		//trace(ARIAL, HELIOS);
	}
}

@:font("assets/fonts/Arial.ttf")
private class FontClassName1 extends Font {}

@:font("assets/fonts/HeliosCond Bold.ttf")
private class FontClassName2 extends Font {}