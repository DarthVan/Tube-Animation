package map;

import fonts.Fonts;
import map.labels.Labels;
import map.labels.SCADA;
import map.marks.Marks;
import map.points.Points;
import map.tube.Tube;
import map.weather.Weather;
import map.zones.Zones;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * Animation main class
 * @author Sith
 */

class Map extends Sprite {
	
	public var tube(get, null) : Tube;
	public var zones(get, null) : Zones;
	public var labels(get, null) : Labels;
	public var marks(get, null) : Marks;
	public var points(get, null) : Points;
	public var weather(get, null) : Weather;
	public var scada(get, null) : SCADA;
	
	var _bg : Bitmap;
	
	public function new() {
		super();
		
		init();
	}
	
	public function getObjectById(id : String) : Dynamic {
		var obj : Dynamic;
		
		if (id == Targets.TUBE_MASK)
			return tube.tubeMask;
			
		if (id == Targets.SCADA)
			return scada;
		
		obj = points.getPointById(id);
		if (obj != null)
			return obj;
			
		obj = labels.getLabelById(id);
		if (obj != null)
			return obj;
			
		obj = marks.getMarkById(id);
		if (obj != null)
			return obj;
			
		obj = zones.getZoneById(id);
		if (obj != null)
			return obj;
			
		obj = weather.getWeatherById(id);
		if (obj != null)
			return obj;
			
		return null;
	}
	
	function init() : Void {
		
		_bg = new Bitmap(Assets.getBitmapData('assets/bitmap/bg/main_map.png'));
		addChild(_bg);
		
		tube = new Tube();
		tube.x = 206;
		tube.y = 345;
		addChild(tube);
		
		zones = new Zones();
		addChild(zones);
		
		labels = new Labels();
		addChild(labels);
		
		marks = new Marks();
		addChild(marks);
		
		points = new Points();
		addChild(points);
		
		weather = new Weather();
		addChild(weather);
		
		scada = new SCADA(Targets.SCADA, Fonts.HELIOS, 'СКАДА', 160);
		scada.x = 709;
		scada.y = 450;
		addChild(scada);
	}
	
	function get_tube() : Tube {
		return tube;
	}
	
	function get_zones() : Zones {
		return zones;
	}
	
	function get_labels() : Labels {
		return labels;
	}
	
	function get_marks() : Marks {
		return marks;
	}
	
	function get_points() : Points {
		return points;
	}
	
	function get_scada() : SCADA {
		return scada;
	}
	
	function get_weather() : Weather {
		return weather;
	}
}