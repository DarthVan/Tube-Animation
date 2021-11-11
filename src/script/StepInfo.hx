package script;

/**
 * StepInfo
 * @author Sith
 */

class StepInfo {
	
	public var index(get, null) : Int;
	public var duration(get, null) : Float;
	public var checkPoint(get, null) : Bool; // stop after tweens finished or continue
	public var description(get, null) : String;
	
	public function new(index : Int, duration : Float, checkPoint : Bool = false, description : String = '') {
		this.index = index;
		this.duration = duration;
		this.checkPoint = checkPoint;
		this.description = description;
	}
	
	function get_index() : Int {
		return index;
	}
	
	function get_duration() : Float {
		return duration;
	}
	
	function get_checkPoint() : Bool {
		return checkPoint;
	}
	
	function get_description() : String {
		return description;
	}
}