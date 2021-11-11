package ui;

/**
 * Actions types
 * @author Sith
 */

@:enum abstract Actions(String) to String {

	var SET_PLAYER_STATE = 'setPlayerState';
	var SET_PROGRESS = 'setProgress';
	var SOUNDS_ON = 'soundsOn';
	var SOUNDS_OFF = 'soundsOff';
	var LOCK_UI = 'lockUi';
	var UNLOCK_UI = 'unlockUi';
	var PLAY_SOUND = 'playSound';
	//var STOP_SOUND = 'stopSound';
	
}