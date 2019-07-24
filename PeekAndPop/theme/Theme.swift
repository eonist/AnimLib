import UIKit
import ColorSugar

class Theme {
	let svgIconNames: [String] = ["calculator", "bolt", "eye"]
}
/**
 * ## Examples:
 * let color = Colors.color(.initial(.first))
 * let color = Colors.color(.text(.idle))
 */
enum Colors {
	enum Initial: String {
	  case first = "66CDAD"
	  case second = "EB4D62"
	  case third = "4E98F5"
	}
	 case initial(Initial)
	 case expanded = "000000"
	 case click = "555555"
	 case background = "DDDDDD"
	 enum Text: String {
	 	case idle = "555555"
	 	case down = "FFFFFF"
	 }
    case text(Text)
}
extension Colors {
	static var color: UIColor {
		return UIColor.hex(self.rawValue)
	}
}
