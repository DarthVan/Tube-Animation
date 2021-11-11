package model;
import openfl.events.EventDispatcher;
import ui.player.PlayerCommands;

/**
 * Model
 * @author Sith
 */

class Model extends EventDispatcher {
	
	@:isVar public var isPlaying(get, set) : Bool;
	@:isVar public var isLooped(get, set) : Bool;
	@:isVar public var isSoundOn(get, set) : Bool;
	
	public var playerCommand(null, set) : String;
	
	public function new() {
		super();
		
		init();
	}
	
	function init() : Void {
		isPlaying = false;
		isLooped = false;
		isSoundOn = true;
		
		playerCommand = PlayerCommands.NONE;
	}
	
	function get_isPlaying() : Bool {
		return isPlaying;
	}
	
	function set_isPlaying(value : Bool) : Bool {
		isPlaying = value;
		dispatchEvent(new ModelEvent(ModelEvent.PLAY_STOP_CHANGE));
		return isPlaying;
	}
	
	function get_isLooped() : Bool {
		return isLooped;
	}
	
	function set_isLooped(value : Bool) : Bool {
		isLooped = value;
		dispatchEvent(new ModelEvent(ModelEvent.LOOP_CHANGE));
		return isLooped;
	}
	
	function get_isSoundOn() : Bool {
		return isSoundOn;
	}
	
	function set_isSoundOn(value : Bool) : Bool {
		isSoundOn = value;
		dispatchEvent(new ModelEvent(ModelEvent.SOUND_CHANGE));
		return isSoundOn;
	}
	
	function set_playerCommand(value : String) : String {
		playerCommand = value;
		dispatchEvent(new ModelEvent(ModelEvent.PLAYER_COMMAND, playerCommand));
		return playerCommand = PlayerCommands.NONE;
	}
	
}