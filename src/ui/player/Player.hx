package ui.player;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author Sith
 */

class Player extends Sprite {
	
	var _bg : Bitmap;
	
	var _backward : PlayerButton;
	var _forward : PlayerButton;
	var _play : PlayerButton;
	var _stop : PlayerButton;
	var _loop : PlayerButton;
	var _noLoop : PlayerButton;
	var _soundOn : PlayerButton;
	var _soundOff : PlayerButton;
	
	var _controller : PayerController;
	
	public function new() {
		super();
		
		init();
	}
	
	public function showPlay() : Void {
		_play.visible = true;
		_stop.visible = false;
	}
	
	public function showStop() : Void {
		_play.visible = false;
		_stop.visible = true;
	}
	
	public function showLoop() : Void {
		_loop.visible = true;
		_noLoop.visible = false;
	}
	
	public function hideLoop() : Void {
		_loop.visible = false;
		_noLoop.visible = true;
	}
	
	public function showSoundsOn() : Void {
		_soundOn.visible = true;
		_soundOff.visible = false;
	}
	
	public function showSoundsOff() : Void {
		_soundOn.visible = false;
		_soundOff.visible = true;
	}
	
	public function enablePBF() : Void {
		_backward.mouseEnabled = true;
		_backward.enable();
		
		_forward.mouseEnabled = true;
		_forward.enable();
		
		_play.mouseEnabled = true;
		_play.enable();
	}
	
	public function disablePBF() : Void {
		_backward.mouseEnabled = false;
		_backward.disable();
		
		_forward.mouseEnabled = false;
		_forward.disable();
		
		_play.mouseEnabled = true;
		_play.disable();
	}
	
	function init() : Void {
		
		_bg = new Bitmap(Assets.getBitmapData('assets/bitmap/player/shape.png'));
		addChild(_bg);
		
		_backward = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/backward.png'), PlayerEvent.BACKWARD);
		_backward.x = 40;
		_backward.y = 20;
		addChild(_backward);
		
		_play = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/play.png'), PlayerEvent.PLAY);
		_play.x = 78;
		_play.y = 20;
		addChild(_play);
		
		_stop = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/stop.png'), PlayerEvent.STOP);
		_stop.x = 75;
		_stop.y = 20;
		addChild(_stop);
		
		_forward = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/forward.png'), PlayerEvent.FORWARD);
		_forward.x = 112;
		_forward.y = 20;
		addChild(_forward);
		
		_loop = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/loop.png'), PlayerEvent.LOOP);
		_loop.x = 144;
		_loop.y = 19;
		addChild(_loop);
		
		_noLoop = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/no_loop.png'), PlayerEvent.NO_LOOP);
		_noLoop.x = 144;
		_noLoop.y = 19;
		addChild(_noLoop);
		
		_soundOn = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/sound_on.png'), PlayerEvent.SOUND_ON);
		_soundOn.x = 180;
		_soundOn.y = 20;
		addChild(_soundOn);
		
		_soundOff = new PlayerButton(Assets.getBitmapData('assets/bitmap/player/sound_off.png'), PlayerEvent.SOUND_OFF);
		_soundOff.x = 180;
		_soundOff.y = 20;
		addChild(_soundOff);
		
		_controller = new PayerController(this);
		_controller.enable();
	}
}