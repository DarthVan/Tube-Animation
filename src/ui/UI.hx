package ui;

import openfl.display.Sprite;
import ui.player.Player;
import ui.progressbar.ProgressBar;

/**
 * UI
 * @author Sith
 */

class UI extends Sprite {
	
	public var player(get, null) : Player;
	public var progressbar(get, null) : ProgressBar;
	
	public function new() {
		super();
		
		init();
	}
	
	function init() : Void {
		player = new Player();
		player.x = 78;
		player.y = 795;
		addChild(player);
		
		progressbar = new ProgressBar();
		progressbar.x = 366;
		progressbar.y = 824;
		addChild(progressbar);
	}
	
	function get_player() : Player {
		return player;
	}
	
	function get_progressbar() : ProgressBar {
		return progressbar;
	}
	
}