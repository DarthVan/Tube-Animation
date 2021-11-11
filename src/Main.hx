package;

import animator.Animator;
import fonts.Fonts;
import map.Map;
import model.Model;
import openfl.display.Sprite;
import sound.SoundPlayer;
import ui.UI;

/**
 * ...
 * @author Sith
 */

class Main extends Sprite {
	
	public var model(get, null) : Model;
	public var map(get, null) : Map;
	public var ui(get, null) : UI;
	public var animator(get, null) : Animator;
	public var soundPlayer(get, null) : SoundPlayer;
	
	public static var current(get, null) : Main;
	
	public function new() {
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		init();
	}

	static function get_current() : Main {
		return current;
	}
	
	function init() : Void {
		current = this;
		
		Fonts.init();
		
		model = new Model();
		
		map = new Map();
		addChild(map);
		
		ui = new UI();
		addChild(ui);
		
		soundPlayer = new SoundPlayer();
		soundPlayer.playMusic();
		
		animator = new Animator();
	}
	
	function get_model() : Model {
		return model;
	}
	
	function get_map() : Map {
		return map;
	}
	
	function get_ui() : UI {
		return ui;
	}

	function get_animator() : Animator {
		return animator;
	}
	
	function get_soundPlayer() : SoundPlayer {
		return soundPlayer;
	}
}
