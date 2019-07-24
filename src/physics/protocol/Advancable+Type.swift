/**
 * CGFloat
 */
extension CGFloat: Advancable {
   public static var defaults: AnimState<CGFloat>  = AnimState<CGFloat>(0, 0, 0, 0, 10e-5)
   public static var defaultEasing: CGFloat = 0.2
   public func isNear( value: CGFloat, epsilon: CGFloat) -> Bool {
      return self.isNear(value, epsilon)
   }
}
/**
 * CGPoint
 */
extension CGPoint: Advancable {
   public static var defaults: AnimState<CGPoint>  = AnimState<CGPoint>(.zero, .zero, .zero, .zero, .init(x: 10e-5, y: 10e-5))
   public static var defaultEasing: CGPoint = .init(x: 0.2, y: 0.2)
   public func isNear(value: CGPoint, epsilon: CGPoint) -> Bool {
      return self.isNear(value, epsilon.x)
   }
}
//static var value:CGFloat { return (0.2) }
//static var point:CGPoint { return  }
//static var rect:CGRect { return  }
/**
 * CGSize
 */
extension CGSize: Advancable {
   public static var defaults: AnimState<CGSize>  = AnimState<CGSize>(.zero, .zero, .zero, .zero, .init(width: 10e-5, height: 10e-5))
   public static var defaultEasing: CGSize = .init(width: 0.2, height: 0.2)
   public func isNear( value: CGSize, epsilon: CGSize) -> Bool {
      return self.isNear(value, epsilon.width)
   }
}
/**
 * CGRect
 */
extension CGRect: Advancable {
   public static var defaults: AnimState<CGRect> = AnimState<CGRect>(.zero, .zero, .zero, .zero, CGRect(origin: .init(x: 10e-5, y: 10e-5), size: .init(width: 10e-5, height: 10e-5)))
   public static var defaultEasing: CGRect = .init(origin: .init(x: 0.2, y: 0.2), size: .init(width: 0.2, height: 0.2))
   public func isNear( value: CGRect, epsilon: CGRect) -> Bool {
      return self.size.isNear(value.size, epsilon.size.width) && self.origin.isNear(value.origin, epsilon.origin.x)
   }
}
