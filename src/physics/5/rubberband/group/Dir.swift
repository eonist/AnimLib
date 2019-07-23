import Foundation

public enum Dir {
   case hor, ver
}
/**
 * - Note: Alternate Idea: let value:CGFloat = CGSize()[.hor]
 * ## Examples:
 * let value:CGFloat = Dir.hor.val(CGSize())
 */
extension Dir {
   func val(_ size: CGSize) -> CGFloat {
      switch self {
      case .hor:
         return size.width
      case .ver:
         return size.height
      }
   }
   func val(_ point: CGPoint) -> CGFloat {
      switch self {
      case .hor:
         return point.x
      case .ver:
         return point.y
      }
   }
}
