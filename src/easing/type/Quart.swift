import Foundation
/**
 * Quartic
 */
public class Quart {
   /*
    * easeIn
    */
   public static func easeIn(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat{
      var t = t
      t /= d
      return c * t * t * t * t + b
   }
   /*
    * easeOut
    */
   public static func easeOut(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
      var t = t
      t = (t / d) - 1//<--the brackets are important
      return -c * (t * t * t * t - 1) + b
   }
   /*
    * easeInOut
    */
   public static func easeInOut(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
      var t = t
      t = t / (d / 2)//<--the brackets are important
      if t < 1 { return c / 2 * t * t * t * t + b }
      t -= 2
      return -c / 2 * (t * t * t * t - 2) + b
   }
   /*
    * easeOutIn
    */
   public static func easeOutIn (_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
      if t < d / 2 {
         return easeOut(t * 2, b, c / 2, d)
      } else {
         return easeIn((t * 2) - d, b + c / 2, c / 2, d)
      }
   }
}
