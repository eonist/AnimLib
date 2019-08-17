import Cocoa

extension String {
   /**
    * convenience
    */
   fileprivate func conformsTo(pattern: String) -> Bool {
      let pattern = NSPredicate(format: "SELF MATCHES %@", pattern)
      return pattern.evaluate(with: self)
   }
   /**
    * ## Examples:
    * "#00ff00".color
    */
   var color: NSColor? { return NSColor.fromHexString(hex: self) }
}
/**
 * NSColor parser
 */
extension NSColor {
   /**
    * from hex number
    */
   static func fromHex(hex: Int, alpha: Float) -> NSColor {
      let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
      let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
      let blue = CGFloat((hex & 0xFF)) / 255.0
      return NSColor(calibratedRed: red, green: green, blue: blue, alpha: 1.0)
   }
   /**
    * From hex string
    * ## Example:
    * NSColor.fromHexString("#00ff00")
    */
   static func fromHexString(hex: String, alpha: Float = 1) -> NSColor? {
      var cleanedString = "" // Handle two types of literals: 0x and # prefixed
      if hex.hasPrefix("0x") {
         cleanedString = String(hex.suffix(from: hex.index(hex.startIndex, offsetBy: 2)))
      } else if hex.hasPrefix("#") {
         cleanedString = String(hex.suffix(from: hex.index(hex.startIndex, offsetBy: 1)))
      }
      let validHexPattern = "[a-fA-F0-9]+" // Ensure it only contains valid hex characters 0
      if cleanedString.conformsTo(pattern: validHexPattern) {
         var theInt: UInt32 = 0
         let scanner = Scanner(string: cleanedString)
         scanner.scanHexInt32(&theInt)
         let red = CGFloat((theInt & 0xFF0000) >> 16) / 255.0
         let green = CGFloat((theInt & 0xFF00) >> 8) / 255.0
         let blue = CGFloat((theInt & 0xFF)) / 255.0
         return .init(calibratedRed: red, green: green, blue: blue, alpha: 1.0)
      } else {
         return .none
      }
   }
}
