package ui.player;

import openfl.events.Event;

/**
 * PlayerEvent
 * @author Sith
 */

class PlayerEvent extends Event {

	public static inline var BACKWARD : String = 'backward_event';
	public static inline var FORWARD : String = 'forward_event';
	public static inline var PLAY : String = 'play_event';
	public static inline var STOP : String = 'stop_event';
	public static inline var LOOP : String = 'loop_event';
	public static inline var NO_LOOP : String = 'no_loop_event';
	public static inline var SOUND_ON : String = 'sound_on_event';
	public static inline var SOUND_OFF : String = 'sound_off_event';
	
	public function new(type : String, bubbles : Bool = false, cancelable : Bool = false) {
		super(type, bubbles, cancelable);
	}
	
}