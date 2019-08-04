import Foundation

extension RoundedRect {
   public static func + (a: RoundedRect, b: RoundedRect) -> RoundedRect { return .init(rect: a.rect + b.rect, fillet: a.fillet + b.fillet) }
   public static func - (a: RoundedRect, b: RoundedRect) -> RoundedRect { return .init(rect: a.rect - b.rect, fillet: a.fillet - b.fillet) }
   public static func * (a: RoundedRect, b: RoundedRect) -> RoundedRect { return .init(rect: a.rect * b.rect, fillet: a.fillet * b.fillet) }
}
