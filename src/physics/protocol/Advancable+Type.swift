/**
 * CGFloat
 */
extension CGFloat: Advancable {
    static var defaults: AnimState<CGFloat>  = AnimState<CGFloat>(0, 0, 0, 0, 0)
    func isNear( value: CGFloat, epsilon: CGFloat) -> Bool {
        return self.isNear(value, epsilon)
    }
}
/**
 * CGPoint
 */
extension CGPoint: Advancable {
    static var defaults: AnimState<CGPoint>  = AnimState<CGPoint>(.zero, .zero, .zero, .zero, .zero)
    func isNear(value: CGPoint, epsilon: CGPoint) -> Bool {
        return self.isNear(value, epsilon.x)
    }
}
/**
 * CGSize
 */
extension CGSize: Advancable {
    static var defaults: AnimState<CGSize>  = AnimState<CGSize>(.zero, .zero, .zero, .zero, .zero)
    func isNear( value: CGSize,  epsilon: CGSize) -> Bool {
        return self.isNear(value, epsilon.width)
    }
}
/**
 * CGRect
 */
extension CGRect: Advancable {
    static var defaults: AnimState<CGRect> = AnimState<CGRect>(.zero, .zero, .zero, .zero, CGRect(origin: .init(x: 10e-5, y: 10e-5), size: .init(width: 10e-5, height: 10e-5)))
    func isNear( value:  CGRect,  epsilon: CGRect) -> Bool {
        return self.size.isNear(value.size, epsilon.size.width) && self.origin.isNear(value.origin, epsilon.origin.x)
    }
}
