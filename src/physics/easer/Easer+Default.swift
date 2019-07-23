/**
 * Default
 */
extension Easer {
   enum DefaultEasing { // find a better place for these
      static var value:CGFloat { return (0.2) }
      static var point:CGPoint { return CGPoint(x: 0.2, y: 0.2) }
      static var rect:CGRect { return CGRect(origin: .init(x: 0.2, y: 0.2), size: .init(width: 0.2, height: 0.2)) }
   }
}
