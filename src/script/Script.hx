package script;

import openfl.Assets;
import openfl.errors.Error;

/**
 * Script
 * @author Sith
 */

class Script {
	
	public var steps(get, null) : Array<Step>;
	public var currentStep(get, null) : Step;
	public var currentStepIndex(get, null) : Int;
	public var lastStepIndex(get, null) : Int;
	public function new() {
		init();
	}
	
	function init() : Void {
		var parser : Parser = new Parser();
		steps = parser.parse(Assets.getText('assets/data/animation.json'));
		reset();
	}
	
	public function reset() : Step {
		lastStepIndex = currentStepIndex = 0;
		if (steps == null || steps.length == 0) {
			throw new Error('Script: reset(): step array is null or empty!');
			return null;
		}
		return currentStep = steps[currentStepIndex];
	}
	
	public function next() : Step {
		lastStepIndex = currentStepIndex;
		currentStepIndex++;
		if (steps == null || steps.length == 0) {
			throw new Error('Script: next(): step array is null or empty!');
			return null;
		}
		
		if (currentStepIndex >= steps.length) {
			trace ('Script: next(): not enough steps!');
			return null;
		}
		
		currentStep = steps[currentStepIndex];
		return currentStep;
	}
	
	public function nextCheckPointStep() : Step {
		if (steps == null || steps.length == 0) {
			throw new Error('Script: nextCheckPointStep(): step array is null or empty!');
			return null;
		}
		
		lastStepIndex = currentStepIndex;
		currentStepIndex++;
		//trace('currentStepIndex = ' + currentStepIndex); //0
		while (currentStepIndex < steps.length) {
			if (steps[currentStepIndex].info.checkPoint) {
				//trace ('found step with id: ' + steps[currentStepIndex].id + '; setpIndex = ' + currentStepIndex);
				return currentStep = steps[currentStepIndex];
			}
			currentStepIndex++;
		}
		
		currentStepIndex = steps.length - 1;
		return steps[currentStepIndex];
	}
	
	public function prev() : Step {
		lastStepIndex = currentStepIndex;
		currentStepIndex--;
		if (steps == null || steps.length == 0) {
			throw new Error('Script: prev(): step array is null or empty!');
			return null;
		}
		
		if (currentStepIndex < 0) {
			currentStepIndex = 0;
			trace ('Script: prev(): this is first step!');
		}
		
		currentStep = steps[currentStepIndex];
		return currentStep;
	}
	
	public function prevChekPointStep() : Step {
		if (steps == null || steps.length == 0) {
			throw new Error('Script: prevChekPointStep(): step array is null or empty!');
			return null;
		}
		
		lastStepIndex = currentStepIndex;
		currentStepIndex--;
		while (currentStepIndex >= 0) {
			if (steps[currentStepIndex].info.checkPoint)
				return currentStep = steps[currentStepIndex];
			currentStepIndex--;
		}
		
		currentStepIndex = 0;
		return steps[currentStepIndex];
	}
	
	public function isFirstStep() : Bool {
		return currentStepIndex == 0 ? true : false;
	}
	
	public function isLastStep() : Bool {
		return currentStepIndex == steps.length - 1 ? true : false;
	}
	
	public function isCheckPoint() : Bool {
		return currentStep.info.checkPoint;
	}
	
	function get_currentStep() : Step {
		return currentStep;
	}
	
	function get_currentStepIndex() : Int {
		return currentStepIndex;
	}
	
	function get_lastStepIndex() : Int {
		return lastStepIndex;
	}
	
	function get_steps() : Array<Step> {
		return steps;
	}
}