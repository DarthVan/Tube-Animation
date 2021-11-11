package ui.player;

import model.ModelEvent;

/**
 * PayerController
 * @author Sith
 */

class PayerController {
	
	var _player : Player;
	
	public function new(player : Player) {
		_player = player;
	}
	
	public function enable() : Void {
		
		Main.current.model.addEventListener(ModelEvent.PLAY_STOP_CHANGE, onPlayStopChange);
		Main.current.model.addEventListener(ModelEvent.LOOP_CHANGE, onLoopChange);
		Main.current.model.addEventListener(ModelEvent.SOUND_CHANGE, onSoundChange);
		
		onPlayStopChange(null);
		onLoopChange(null);
		onSoundChange(null);
		
		_player.addEventListener(PlayerEvent.BACKWARD, onBackward);
		_player.addEventListener(PlayerEvent.FORWARD, onForward);
		_player.addEventListener(PlayerEvent.PLAY, onPlay);
		_player.addEventListener(PlayerEvent.STOP, onStop);
		_player.addEventListener(PlayerEvent.LOOP, onLoop);
		_player.addEventListener(PlayerEvent.NO_LOOP, onNoLoop);
		_player.addEventListener(PlayerEvent.SOUND_ON, onSoundOn);
		_player.addEventListener(PlayerEvent.SOUND_OFF, onSoundOff);
		
	}
	
	public function disable() : Void {
		
		Main.current.model.removeEventListener(ModelEvent.PLAY_STOP_CHANGE, onPlayStopChange);
		Main.current.model.removeEventListener(ModelEvent.LOOP_CHANGE, onLoopChange);
		Main.current.model.removeEventListener(ModelEvent.SOUND_CHANGE, onSoundChange);
		
		_player.removeEventListener(PlayerEvent.BACKWARD, onBackward);
		_player.removeEventListener(PlayerEvent.FORWARD, onForward);
		_player.removeEventListener(PlayerEvent.PLAY, onPlay);
		_player.removeEventListener(PlayerEvent.STOP, onStop);
		_player.removeEventListener(PlayerEvent.LOOP, onLoop);
		_player.removeEventListener(PlayerEvent.NO_LOOP, onNoLoop);
		_player.removeEventListener(PlayerEvent.SOUND_ON, onSoundOn);
		_player.removeEventListener(PlayerEvent.SOUND_OFF, onSoundOff);
		
	}
	
	function onPlayStopChange(e : ModelEvent) : Void {
		if (Main.current.model.isPlaying)
			_player.showStop();
		else
			_player.showPlay();
	}
	
	function onLoopChange(e : ModelEvent) : Void {
		if (Main.current.model.isLooped)
			_player.hideLoop();
		else
			_player.showLoop();
	}
	
	function onSoundChange(e : ModelEvent) : Void {
		if (Main.current.model.isSoundOn)
			_player.showSoundsOn();
		else
			_player.showSoundsOff();
	}
	
	function onBackward(e : PlayerEvent) : Void {
		Main.current.model.isPlaying = false;
		Main.current.model.playerCommand = PlayerCommands.BACKWARD;
	}
	
	function onForward(e : PlayerEvent) : Void {
		Main.current.model.isPlaying = false;
		Main.current.model.playerCommand = PlayerCommands.FORWARD;
	}
	
	function onPlay(e : PlayerEvent) : Void {
		Main.current.model.isPlaying = true;
	}
	
	function onStop(e : PlayerEvent) : Void {
		Main.current.model.isPlaying = false;
	}
	
	function onLoop(e : PlayerEvent) : Void {
		Main.current.model.isLooped = true;
	}
	
	function onNoLoop(e : PlayerEvent) : Void {
		Main.current.model.isLooped = false;
	}
	
	function onSoundOn(e : PlayerEvent) : Void {
		Main.current.model.isSoundOn = false;
		Main.current.soundPlayer.mute = true;
	}
	
	function onSoundOff(e : PlayerEvent) : Void {
		Main.current.model.isSoundOn = true;
		Main.current.soundPlayer.mute = false;
	}
}