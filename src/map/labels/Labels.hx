package map.labels;

import fonts.Fonts;
import openfl.display.Sprite;

/**
 * Labels
 * @author Sith
 */

class Labels extends Sprite {
	
	public var array(get, null) : Array<Label>;
	
	public function new() {
		super();
		
		init();
	}
	
	public function getLabelById(id : String) : Label {
		for (i in 0...array.length)
			if (array[i].id == id)
				return array[i];
		return null;
	}
	
	function init() : Void {
		array = new Array<Label>();
		
		var label : Label;
		
		// todo: move this to json
		
		// 1. Нефтепроводная система КТК
		label = new Label(Targets.MAP_TITLE, Fonts.HELIOS, 'НЕФТЕПРОВОДНАЯ СИСТЕМА КТК', 36);
		label.x = 330;
		label.y = 70;
		label.addShadow(10);
		addChild(label);
		array.push(label);
		
		// 2. РОССИЯ
		label = new Label(Targets.RUSSIA, Fonts.HELIOS, 'РОССИЯ', 36, 0x9A834C);
		label.x = 570;
		label.y = 200;
		addChild(label);
		array.push(label);
		
		// 3. Казахстан
		label = new Label(Targets.KAZAHSTAN, Fonts.HELIOS, 'КАЗАХСТАН', 36, 0x9A834C);
		label.x = 1044;
		label.y = 268;
		addChild(label);
		array.push(label);
		
		// 4. Западный регион
		label = new Label(Targets.WEST_REGION, Fonts.ARIAL, 'Западный\nрегион', 25, 0x0A52A1, true);
		label.x = 313;
		label.y = 216;
		addChild(label);
		array.push(label);
		
		// 5. Центральный регион
		label = new Label(Targets.CENTER_REGION, Fonts.ARIAL, 'Центральный\nрегион', 25, 0x0A52A1, true);
		label.x = 797;
		label.y = 187;
		addChild(label);
		array.push(label);
		
		// 6. Восточный регион
		label = new Label(Targets.EAST_REGION, Fonts.ARIAL, 'Восточный\nрегион', 25, 0x0A52A1, true);
		label.x = 1222;
		label.y = 244;
		addChild(label);
		array.push(label);
		
		// 7. Морской терминал
		label = new Label(Targets.SEA_TERMINAL, Fonts.ARIAL, 'Морской\nтерминал', 25, 0x0A52A1, true);
		label.x = 162;
		label.y = 251;
		label.addGlow(15, 0xFFFFFF, 0.9);
		addChild(label);
		array.push(label);
		
		// 8. 1496,5 КМ
		label = new Label(Targets.DISTANCE_A, Fonts.HELIOS, '1504 КМ', 40, 0x000000);
		label.x = 745;
		label.y = 260;
		addChild(label);
		array.push(label);
		
		// 9. 1044,5 КМ
		label = new Label(Targets.DISTANCE_B, Fonts.HELIOS, '1052 КМ', 36, 0x0A52A1);
		label.x = 490;
		label.y = 335;
		addChild(label);
		array.push(label);
		
		// 10. 452 КМ
		label = new Label(Targets.DISTANCE_C, Fonts.HELIOS, '452 КМ', 36, 0x0A52A1);
		label.x = 1085;
		label.y = 335;
		addChild(label);
		array.push(label);
		
		// Kalmyki Republic
		label = new Label(Targets.KALMYKI_REPUBLIC, Fonts.ARIAL, 'Республика Калмыкия', 14, 0x333333);
		label.x = 727;
		label.y = 330;
		label.showAsMultilined(120);
		addChild(label);
		array.push(label);
		
		// Stavropolski Krai
		label = new Label(Targets.STAVROPOLSKI_KRAI, Fonts.ARIAL, 'Ставропольский край', 14, 0x333333);
		label.x = 577;
		label.y = 490;
		addChild(label);
		array.push(label);
		
		// Astrahanskaya obl
		label = new Label(Targets.ASTRAHANSKAYA_OBL, Fonts.ARIAL, 'Астраханская обл', 14, 0x333333);
		label.x = 885;
		label.y = 450;
		addChild(label);
		array.push(label);
		
		// Atirauskaya obl
		label = new Label(Targets.ATIRAUSKAYA_OBL, Fonts.ARIAL, 'Атырауская обл', 14, 0x333333);
		label.x = 1260;
		label.y = 360;
		addChild(label);
		array.push(label);
		
		// Krasnodarski krai
		label = new Label(Targets.KRASNODARSKI_KRAI, Fonts.ARIAL, 'Краснодарский край', 14, 0x333333);
		label.x = 395;
		label.y = 480;
		addChild(label);
		array.push(label);
		
		// Ural River
		label = new Label(Targets.URAL_RIVER, Fonts.ARIAL, 'р. Урал', 14, 0x0096C2);
		label.x = 1180;
		label.y = 385;
		addChild(label);
		array.push(label);
		
		// Volga River
		label = new Label(Targets.VOLGA_RIVER, Fonts.ARIAL, 'р. Волга', 14, 0x0096C2);
		label.x = 835;
		label.y = 415;
		addChild(label);
		array.push(label);
		
		// Kuban River
		label = new Label(Targets.KUBAN_RIVER, Fonts.ARIAL, 'р. Кубань', 14, 0x0096C2);
		label.x = 335;
		label.y = 390;
		addChild(label);
		array.push(label);
	}
	
	function get_array() : Array<Label> {
		return array;
	}
}