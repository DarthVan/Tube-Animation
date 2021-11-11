package script;

import motion.easing.IEasing;
import motion.easing.Linear;

/**
 * Tween
 * @author Sith
 */

class Tween {
	
	public var target(get, null) : Dynamic;
	public var duration(get, null) : Float;
	public var properties(get, null) : Dynamic;
	public var delay(get, null) : Float;
	public var ease(get, null) : IEasing; // Sine, Linear ...
	
	public function new(target : Dynamic, duration : Float, properties : Dynamic, ? delay : Float, ? ease : IEasing) {
		this.target = target;
		if (duration == 0.0)
			duration = 0.001;
		this.duration = duration;
		this.properties = properties;
		if (delay == null)
			delay = 0.0;
		this.delay = delay;
		if (ease == null)
			ease = Linear.easeNone;
		this.ease = ease;
	}
	
	function get_target() : Dynamic {
		return target;
	}
	
	function get_duration() : Float {
		return duration;
	}
	
	function get_properties() : Dynamic {
		return properties;
	}
	
	function get_delay() : Float {
		return delay;
	}
	
	function get_ease() : IEasing {
		return ease;
	}
}