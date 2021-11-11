package sound;
import openfl.Assets;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

/**
 * SoundPlayer
 * @author Sith
 */

class SoundPlayer {
	
	@:isVar public var mute(get, set) : Bool;
	@:isVar public var musicVolume(get, set) : Float;
	
	var _sound : Sound;
	var _channel : SoundChannel;
	
	var _loop : Sound;
	var _loopChannel : SoundChannel;
	
	public function new() {
		
	}
	
	public function playSound(data : Dynamic) : Void {
		//trace('play sound : ' + data.url);
		
		_sound = Assets.getSound(data.url);
		_channel = _sound.play(0.0);
	}
	
	public function stopSound() : Void {
		//trace('stop sound');
		
		if (_channel != null) {
			_channel.stop();
			_channel = null;
		}
		
		//if (_sound == null)
		//	return;
			
		//_sound.close();
		_sound = null;
	}
	
	public function playMusic(url : String = '', loopFrom : Int = 0, loopTo : Int = 0) : Void {
		_loop = Assets.getSound('assets/sounds/loop.mp3');
		
		_loopChannel = _loop.play(0.0, 999, new SoundTransform(0.2));
	}
	
	public function stopMusic() : Void {
		if (_loopChannel != null) {
			_loopChannel.stop();
			_loopChannel = null;
		}
		_loop = null;
	}
	
	function get_mute() : Bool {
		return mute;
	}
	
	function set_mute(value : Bool) : Bool {
		//trace('set mute :' + value);
		if (_channel != null)
			_channel.soundTransform = new SoundTransform(value == true ? 0.0 : 1.0);
		if (_loopChannel != null)
			_loopChannel.soundTransform = new SoundTransform(value == true ? 0.0 : 0.2);
		return mute = value;
	}
	
	function get_musicVolume() : Float {
		return musicVolume;
	}
	
	function set_musicVolume(value : Float) : Float {
		return musicVolume = value;
	}
	
}