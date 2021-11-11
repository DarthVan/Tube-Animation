package animator;

import motion.Actuate;
import motion.actuators.GenericActuator;
import script.Action;
import script.Script;
import script.Step;
import script.Tween;

/**
 * Executor
 * @author Sith
 */

class Animator {

	public var script(get, null) : Script;
	public var checkPoint(get, null) : Int;
	
	var _controller : AnimatorController;
	
	var _isStopped : Bool;
	var _replay : Bool;
	
	var _atimer : Dynamic;
	
	public function new() {
		init();
	}
	
	public function play() : Void {
		//trace('animator play()');
		
		var step : Step = script.next();
		
		if (step == null) {
			trace('Animator.play() : step is null! Reset to the first step...');
			
			reset(true);
			return;
		}
		
		runStep(step);
		
		_isStopped = false;
	}
	
	public function stop() : Void {
		//trace('animator stop()');
		
		if (_isStopped)
			return;
		
		_isStopped = true;
		
		// хз оставить так или по другому както чтоб при остановке на последней точке не отматывало не пред шаг
		if (script.isFirstStep() || script.isLastStep() || script.isCheckPoint())
			return;
			
		prev();
	}
	
	public function next() : Void {
		//trace('animator next()');
		
		Actuate.reset();
		var step : Step = script.nextCheckPointStep();
		if (step == null) {
			trace('Animator.next() : step is null!');
			return;
		}
		
		Main.current.ui.player.disablePBF();
		
		runStep(step, true);
	}
	
	public function prev() : Void {
		//trace('animator prev()');
		
		var step : Step = script.prevChekPointStep();
		if (step == null) {
			trace('Animator.prev() : step is null!');
			return;
		}
		
		Main.current.ui.player.disablePBF();
		
		runStep(step, true);
	}
	
	public function firstStep() : Void {
		//trace('animator firstStep()');
		
		var step : Step = script.reset();
		if (step == null) {
			trace('Animator.firstStep() : step is null!');
			return;
		}
		runStep(step);
	}
	
	public function reset(replay : Bool = false) : Void {
		resetAllTweens();
		
		_replay = replay;
		firstStep();
	}
	
	// ================================== PRIVATE ==================================
	
	function init() : Void {
		script = new Script();
		
		reset();
		
		_controller = new AnimatorController(this);
		_controller.enable();
	}
	
	function get_script() : Script {
		return script;
	}
	
	function get_checkPoint() : Int {
		return checkPoint;
	}
	
	function runStep(step : Step, tweenOverwrite : Bool = false) : Void {
		Main.current.soundPlayer.stopSound();
		Main.current.ui.progressbar.tweenToCheckPoint(step.info.index, step.info.duration);
		if (_atimer != null)
			Actuate.stop(_atimer);
		_atimer = Actuate.timer(step.info.duration + 0.25).onComplete(onStepComplete); // 1.25 - points tweening after bar updates
		
		for (i in 0...step.actions.length)
			if (step.actions[i].type == Action.START)
				runAction(step.actions[i]);
		for (i in 0...step.tweens.length)
			runTween(step.tweens[i], tweenOverwrite);
	}
	
	function runAction(action : Action) : Void {
		if (action == null || action.method == null)
			return;
		action.method(action.properties);
	}
	
	function runTween(tween : Tween, overwrite : Bool = false) : Void {
		if (tween == null || tween.target == null)
			return;
		
		if (tween.delay == 0.0)
			Actuate.tween(tween.target, tween.duration, tween.properties).ease(tween.ease);
		else
			Actuate.tween(tween.target, tween.duration, tween.properties, overwrite).ease(tween.ease).delay(tween.delay);
	}
	
	function onStepComplete() : Void {
		Main.current.ui.player.enablePBF();
		//resetAllTweens();
		
		var step : Step = script.currentStep;
		
		for (i in 0...step.actions.length)
			if (step.actions[i].type == Action.END)
				runAction(step.actions[i]);
		
		if (script.isFirstStep() && _replay) {
			play();
			_replay = false;
			return;
		}
		
		if (script.isLastStep())
			Main.current.model.isPlaying = false;
		
		if (!Main.current.model.isPlaying)
			return;
		
		if (!script.isCheckPoint()) {
			play();
		} else {
			if (Main.current.model.isLooped) {
				play();
			} else {
				Main.current.model.isPlaying = false; // todo: на промежуточных чекпоинтах не отматывать на пред шаг
			}
		}
		
	}
	
	function resetAllTweens() : Void {
		//Actuate.stop(Main.current.map.tube.tubeMask, null, false);
		
		var a : Array<Dynamic>;
		
		a = Main.current.map.labels.array;
		for (i in 0...a.length)
			Actuate.stop(a[i], null, true);
			
		a = Main.current.map.zones.array;
		for (i in 0...a.length)
			Actuate.stop(a[i], null, true);
			
		a = Main.current.map.points.array;
		for (i in 0...a.length)
			Actuate.stop(a[i], null, true);
			
		a = Main.current.map.marks.array;
		for (i in 0...a.length)
			Actuate.stop(a[i], null, true);
		
		a = Main.current.map.weather.array;
		for (i in 0...a.length)
			Actuate.stop(a[i], null, true);
	}
	
	// последний твин завершен
	function onTweenCompete() : Void {
		
		/*
		
		1. большие точки, подсвеченные, затухают на след кадре +
		2. Тенгиз и атырау подсыетить одновременно 2 +
		3. подсветить качалки +
		4. анимировать погоды +
		5. текст СКАДА +
		
		*/
		
	}
}