import Foundation

extension CGRect {
   public static func + (a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin + b.origin, size: a.size + b.size) }
   public static func - (a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin - b.origin, size: a.size - b.size) }
   public static func * (a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin * b.origin, size: a.size * b.size) }
}
