import Foundation
/**
 * Sine SINUSOIDAL EASING: sin(t)
 */
public class Sine {
   /*
    * easeIn
    */
   public  static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
      return -c * cos(t/d * CGFloat(Double.pi) / 2) + c + b
   }
   /*
    * easeOut
    */
   public static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
      return c * sin(t / d * CGFloat(Double.pi) / 2) + b
   }
   /*
    * easeInOut
    */
   public static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
      return -c/2 * (cos(CGFloat(Double.pi) * t / d) - 1) + b
   }
   /*
    * easeOutIn
    */
   public static func easeOutIn (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
      if t < d / 2 {
         return easeOut(t * 2,  b,  c / 2,  d)
      } else {
         return easeIn((t * 2) - d,  b + c / 2,  c / 2,  d)
      }
   }
}

