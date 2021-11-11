package animator;

import model.ModelEvent;
import ui.player.PlayerCommands;

/**
 * AnimatorController
 * @author Sith
 */

class AnimatorController {

	var _animator : Animator;
	
	public function new(animator : Animator) {
		_animator = animator;
	}
	
	public function enable() : Void {
		
		Main.current.model.addEventListener(ModelEvent.PLAY_STOP_CHANGE, onPlayStopChange);
		Main.current.model.addEventListener(ModelEvent.LOOP_CHANGE, onLoopChange);
		Main.current.model.addEventListener(ModelEvent.SOUND_CHANGE, onSoundChange);
		Main.current.model.addEventListener(ModelEvent.PLAYER_COMMAND, onPlayerCommand);
		
	}
	
	public function disable() : Void {
		
		Main.current.model.removeEventListener(ModelEvent.PLAY_STOP_CHANGE, onPlayStopChange);
		Main.current.model.removeEventListener(ModelEvent.LOOP_CHANGE, onLoopChange);
		Main.current.model.removeEventListener(ModelEvent.SOUND_CHANGE, onSoundChange);
		Main.current.model.removeEventListener(ModelEvent.PLAYER_COMMAND, onPlayerCommand);
		
	}
	
	function onPlayStopChange(e : ModelEvent) : Void {
		
		if (Main.current.model.isPlaying)
			_animator.play();
		else
			_animator.stop();
		
	}
	
	function onLoopChange(e : ModelEvent) : Void {
		// no required
	}
	
	function onSoundChange(e : ModelEvent) : Void {
		// no required
	}
	
	function onPlayerCommand(e : ModelEvent) : Void {
		switch (Std.string(e.data)) {
			default:
				return;
			case PlayerCommands.NONE:
				return;
			case PlayerCommands.FORWARD:
				_animator.next();
			case PlayerCommands.BACKWARD:
				_animator.prev();
		}
	}
}