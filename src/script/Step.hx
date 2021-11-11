package script;

/**
 * Animation Step
 * @author Sith
 */

class Step {

	public var id(get, null) : Int;
	public var info(get, null) : StepInfo;
	public var tweens(get, null) : Array<Tween>;
	public var actions(get, null) : Array<Action>;

	public function new(id : Int, info : StepInfo, tweens : Array<Tween>, actions : Array<Action>) {
		this.id = id;
		this.info = info;
		this.tweens = tweens;
		this.actions = actions;
	}
	
	function get_id() : Int {
		return id;
	}

	function get_tweens() : Array<Tween> {
		return tweens;
	}
	
	function get_actions() : Array<Action> {
		return actions;
	}
	
	function get_info() : StepInfo {
		return info;
	}
	
	
}