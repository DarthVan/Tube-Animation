package script;

/**
 * Action
 * @author Sith
 */

class Action {

	public var method(get, null) : Dynamic->Void;
	public var properties(get, null) : Dynamic;
	public var type(get, null) : String;
	
	public static inline var START : String = 'start';
	public static inline var END : String = 'end';
	
	public function new(method : Dynamic->Void, properties : Dynamic, type : String) {
		this.method = method;
		this.properties = properties;
		this.type = type;
	}
	
	function get_method() : Dynamic->Void {
		return method;
	}
	
	function get_properties() : Dynamic {
		return properties;
	}
	
	function get_type() : String {
		return type;
	}
}