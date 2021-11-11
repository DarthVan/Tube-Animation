package script;

import haxe.Json;
import map.Targets;
import motion.easing.Elastic;
import motion.easing.IEasing;
import motion.easing.Linear;
import motion.easing.Sine;
import ui.Actions;

/**
 * Script Parser
 * @author Sith
 */

class Parser {

	public function new() {
		
	}
	
	public function parse(string : String) : Array<Step> {
		
		var j : Dynamic = Json.parse(string);
		
		var steps : Array<Step> = new Array<Step>();
		var a : Array<Dynamic> = j.steps;
		
		for (i in 0...a.length) {
			var oi : Dynamic = a[i];
			
			var si : Dynamic = oi.info;
			var info : StepInfo = new StepInfo(Std.parseInt(si.position), Std.parseFloat(si.duration), si.checkPoint == 'true' ? true : false, si.description);
			
			var tweens : Array<Tween> = [];
			var actions : Array<Action> = [];
			
			var t : Array<Dynamic> = oi.tweens;
			if (t != null) {
				for (j in 0...t.length) {
					var oj : Dynamic = t[j];
					var tween : Tween = new Tween(searchForTarget(oj.target), Std.parseFloat(oj.duration), oj.properties, Std.parseFloat(oj.delay), searchForEasing(oj.ease));
					
					if (tween.target != null)
						tweens.push(tween);
				}
			}
			
			var a : Array<Dynamic> = oi.actions;
			if (a != null) {
				for (j in 0...a.length) {
					var oj : Dynamic = a[j];
					var action : Action = new Action(searchForAction(oj.action), oj.properties, oj.type);
					
					if (action.method != null)
						actions.push(action);
				}
			}
			
			var step : Step = new Step(Std.int(oi.id), info, tweens, actions);
			steps.push(step);
			
			/*trace('total tweens: ' + tweens.length);
			trace('total actions: ' + actions.length);
			trace('is check point: ' + step.checkPoint);
			trace('-----------------------------');*/
		}
		
		return steps;
	}
	
	function searchForTarget(string : String) : Dynamic {
		return Main.current.map.getObjectById(string);
	}
	
	function searchForAction(string : String) : Dynamic {
		
		switch (string) {
			default:
				
			case Actions.SET_PLAYER_STATE:
			
			case Actions.SET_PROGRESS:
				return Main.current.ui.progressbar.tweenToCheckPoint;
			case Actions.SOUNDS_ON:
				
			case Actions.SOUNDS_OFF:
				
			case Actions.LOCK_UI:
				
			case Actions.UNLOCK_UI:
				
			case Actions.PLAY_SOUND:
				return Main.current.soundPlayer.playSound;
		}
		
		return null;
	}
	
	function searchForEasing(string : String) : IEasing {
		
		switch (string) {
			default:
				
			case 'Linear' : return Linear.easeNone;
			
			case 'ElasticIn' : return Elastic.easeIn;
			case 'ElasticInOut' : return Elastic.easeInOut;
			case 'ElasticOut' : return Elastic.easeOut;
			
			case 'SineIn' : return Sine.easeIn;
			case 'SineInOut' : return Sine.easeInOut;
			case 'SineOut' : return Sine.easeOut;
			
		}
		
		return Linear.easeNone;
	}
}