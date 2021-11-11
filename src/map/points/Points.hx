package map.points;

import openfl.display.Sprite;

/**
 * Points
 * @author Sith
 */

class Points extends Sprite {
	
	public var array(get, null) : Array<BasicPoint>;
	
	public function new() {
		super();
		
		init();
	}
	
	public function getPointById(id : String) : BasicPoint {
		for (i in 0...array.length)
			if (array[i].id == id)
				return array[i];
		return null;
	}
	
	function init() : Void {
		array = new Array<BasicPoint>();
		
		var point : BasicPoint;
		
		// oil sources
		
		point = new PointOilSource(Targets.OIL_SOURCE_1, 'assets/bitmap/points/source1.png');
		point.x = 1316;
		point.y = 479;
		addChild(point);
		array.push(point);
		
		point = new PointOilSource(Targets.OIL_SOURCE_2, 'assets/bitmap/points/source2.png');
		point.x = 1095;
		point.y = 366;
		addChild(point);
		array.push(point);
		
		// black
		
		point = new PointBlack(Targets.P452, '452');
		point.x = 942;
		point.y = 396;
		addChild(point);
		array.push(point);
		
		point = new PointBlack(Targets.P674, '674', '►');
		point.x = 791;
		point.y = 414;
		addChild(point);
		array.push(point);
		
		point = new PointBlack(Targets.P949, '949');
		point.x = 628;
		point.y = 428;
		addChild(point);
		array.push(point);
		
		point = new PointBlack(Targets.P1201, '1201');
		point.x = 440;
		point.y = 380;
		addChild(point);
		array.push(point);
		
		point = new PointBlack(Targets.P1497, '1497');
		point.x = 214;
		point.y = 399;
		addChild(point);
		array.push(point);
		
		// medium
		
		point = new PointMedium(Targets.A_NPS_3A, 'НПС Исатай', '▲');
		point.x = 1082;
		point.y = 403;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.A_NPS_4, 'НПС Курмангазы', '▼');
		point.x = 1012;
		point.y = 416;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.A_NPS_4A, 'А-НПС-4А', '▼');
		point.x = 917;
		point.y = 376;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.A_NPS_5A, 'А-НПС-5А', '►', 70);
		point.x = 794;
		point.y = 402;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.NPS_2, 'НПС-2', '▼', 50);
		point.x = 715;
		point.y = 453;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.NPS_3, 'НПС-3', '▼');
		point.x = 669;
		point.y = 440;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.NPS_4, 'НПС-4', '▼');
		point.x = 573;
		point.y = 413;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.NPS_5, 'НПС-5', '▼');
		point.x = 499;
		point.y = 392;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.NPS_7, 'НПС-7', '▼');
		point.x = 312;
		point.y = 363;
		addChild(point);
		array.push(point);
		
		point = new PointMedium(Targets.NPS_8, 'НПС-8', '▼');
		point.x = 230;
		point.y = 392;
		addChild(point);
		array.push(point);
		
		// large
		
		point = new PointLarge(Targets.NPS_TENGIZ, 'НПС Тенгиз', '►', 80);
		point.x = 1284;
		point.y = 490;
		addChild(point);
		array.push(point);
		
		point = new PointLarge(Targets.NPS_ATIRAU, 'НПС Атырау', '▼', 80);
		point.x = 1132;
		point.y = 400;
		addChild(point);
		array.push(point);
		
		point = new PointLarge(Targets.NPS_ASTRAHANSKAYA, 'НПС Астраханская', '▼', 90);
		point.x = 822;
		point.y = 356;
		addChild(point);
		array.push(point);
		
		point = new PointLarge(Targets.NPS_KOMSOMOLSKAYA, 'НПС Комсомольская (НПС-1)', '▲', 95);
		point.x = 766;
		point.y = 466;
		addChild(point);
		array.push(point);
		
		point = new PointLarge(Targets.NPS_KROPOTKINSKAYA, 'НПС Кропоткинская (НПС-6)', '▼', 90);
		point.x = 398;
		point.y = 372;
		addChild(point);
		array.push(point);
		
		point = new PointLarge(Targets.NPS_SEA_TERMINAL, 'Морской терминал (МТ)', '◄', 150);
		point.x = 204;
		point.y = 412;
		addChild(point);
		array.push(point);
		
		point = new PointVPU(Targets.VPU1, '   ВПУ-1', '▲', 70);
		point.x = 166;
		point.y = 481;
		addChild(point);
		array.push(point);
		
		point = new PointVPU(Targets.VPU2, 'ВПУ-2   ', '▼', 70);
		point.x = 124;
		point.y = 442;
		addChild(point);
		array.push(point);
		
		point = new PointVPU(Targets.VPU3, 'ВПУ-3   ', '▼', 70);
		point.x = 92;
		point.y = 485;
		addChild(point);
		array.push(point);
		
	}
	
	function get_array() : Array<BasicPoint> {
		return array;
	}
}