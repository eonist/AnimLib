import Foundation

extension CGFloat {
   func isNear(_ value: CGFloat, _ epsilon: CGFloat = 10e-12) -> Bool {
      return Swift.abs(self - value) <= epsilon
   }
   /**
    * - Note: ⚠️️ This is an alternative: let duration = String(format: "%.01f", 3.32323242)//3.3
    * - Note: a problem with CGFloat is that all CGFloat values have a trailing decimalpoint. (Even if you return 10, then end value will be 10.0) a way around this is to convert to a string, then your probably better of using the method mentioned above
    * - Parameter places: decimalPlaces
    * ## Examples:
    * CGFloat(4.1234).toFixed(3) // 4.124
    * CGFloat(-4.0).toFixed(3) // -4
    */
   func toFixed(_ places: Int) -> CGFloat {
      let divisor = pow(10, CGFloat(places))
      return (self * divisor).rounded(.up) / divisor
   }
}
