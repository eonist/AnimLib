import Cocoa

enum WinRect {
   static let size: CGSize = .init(width: 300, height: 600) // IPhone 7: (750 x 1334) (375 x 667) ≈ (200x355)
   static let point: CGPoint = .init(x: 0, y: 0)
}
/**
 * Stores the names of the images in assets.xcassets
 * Rational: Since apple broke how image literals work in xcode 10, we are now back to using stringly typed image assets 🤷
 * ## Examples:
 * var img = UIImage(named: ImageAsset.eye)
 * img = img?.resize(to: CGSize(width: 45/2, height: 45/2))
 */
enum ImageAsset: String {
   case eye, calculator, bolt
}
/**
 * ## Examples:
 * Colors.initial(.first).rawValue.color
 * Colors.text(.idle).rawValue.color
 * Colors.other(.background).rawValue.color
 */
enum Colors {
   enum Initial {
      static let first = "#66CDAD"
      static let second = "#EB4D62"
      static let third = "#4E98F5"
   }
   enum Text {
      static let idle = "#555555"
      static let down = "#FFFFFF"
   }
   static let click = "#555555" // "DDDDDD" // grey
   static let background = "#FFFFFF"
   static let dismiss = "#999999"
}
