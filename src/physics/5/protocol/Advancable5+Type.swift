/**
 * CGFloat
 */
extension CGFloat: Advancable5 {
    static var defaults: AnimState5<CGFloat>  = AnimState5<CGFloat>(0, 0, 0, 0, 0)
    func isNear( value: CGFloat, epsilon: CGFloat) -> Bool {
        return self.isNear(value, epsilon)
    }
}
/**
 * CGPoint
 */
extension CGPoint: Advancable5 {
    static var defaults: AnimState5<CGPoint>  = AnimState5<CGPoint>(.zero, .zero, .zero, .zero, .zero)
    func isNear(value: CGPoint, epsilon: CGPoint) -> Bool {
        return self.isNear(value, epsilon.x)
    }
}
/**
 * CGSize
 */
extension CGSize: Advancable5 {
    static var defaults: AnimState5<CGSize>  = AnimState5<CGSize>(.zero, .zero, .zero, .zero, .zero)
    func isNear( value: CGSize,  epsilon: CGSize) -> Bool {
        return self.isNear(value, epsilon.width)
    }
}
/**
 * CGRect
 */
extension CGRect: Advancable5 {
    static var defaults: AnimState5<CGRect> = AnimState5<CGRect>(.zero, .zero, .zero, .zero, CGRect(origin: .init(x: 10e-5, y: 10e-5), size: .init(width: 10e-5, height: 10e-5)))
    func isNear( value:  CGRect,  epsilon: CGRect) -> Bool {
        return self.size.isNear(value.size, epsilon.size.width) && self.origin.isNear(value.origin, epsilon.origin.x)
    }
}
