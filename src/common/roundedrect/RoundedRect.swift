import Foundation
/**
 * Decorator over CGRect
 * - Fixme: ⚠️️ create an init method with one param, that are used for all params
 */
public struct RoundedRect {
   public var rect: CGRect
   public var fillet: CGFloat
   public init(rect: CGRect = .zero, fillet: CGFloat = .zero) {
      self.rect = rect
      self.fillet = fillet
   }
}
extension RoundedRect {
   public var origin: CGPoint { get { return rect.origin } set { rect.origin = newValue } }
   public var size: CGSize { get { return rect.size } set { rect.size = newValue } }
   public static var zero: RoundedRect = .init(rect: .zero, fillet: .zero)
}
