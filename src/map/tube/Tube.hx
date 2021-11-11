package map.tube;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * Tube
 * @author Sith
 */

class Tube extends Sprite {
	
	public var tubeMask(get, null) : TubeMask;
	
	var _bg : Bitmap;	
	
	public function new() {
		super();
		
		init();
	}
	
	public function reset() : Void {
		tubeMask.x = 1058;
		tubeMask.y = 22;
	}
	
	function init() : Void {
		_bg = new Bitmap(Assets.getBitmapData('assets/bitmap/tube/filled_tube.png'));
		addChild(_bg);
		
		tubeMask = new TubeMask();
		addChild(tubeMask);
		
		_bg.mask = tubeMask;
		
		reset();
	}
	
	function get_tubeMask() : TubeMask {
		return tubeMask;
	}
}