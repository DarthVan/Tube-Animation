package model;

import openfl.events.Event;

/**
 * ModelEvent
 * @author Sith
 */

class ModelEvent extends Event {

	public static inline var PLAY_STOP_CHANGE : String = 'play_stop_change_event';
	public static inline var LOOP_CHANGE : String = 'loop_change_event';
	public static inline var SOUND_CHANGE : String = 'sound_change_event';
	public static inline var PLAYER_COMMAND : String = 'player_command_event';
	
	public var data(get, null) : Dynamic;
	
	public function new(type : String, data : Dynamic = null, bubbles : Bool = false, cancelable : Bool = false) {
		super(type, bubbles, cancelable);
		this.data = data;
	}
	
	function get_data() : Dynamic {
		return data;
	}
}