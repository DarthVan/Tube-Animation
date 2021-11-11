package ui.player;

/**
 * PlayerCommands
 * @author Sith
 */

@:enum abstract PlayerCommands(String) to String {

	var FORWARD = 'forward';
	var BACKWARD = 'backward';
	var NONE = 'none';
	
}