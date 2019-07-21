import Foundation
/**
 * Sine SINUSOIDAL EASING: sin(t)
 */
class Sine {
   /*
    * easeIn
    */
    static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c * cos(t/d * π2) + c + b
    }
    /*
    * easeOut
    */
    static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c * sin(t/d * π2) + b
    }
    /*
    * easeInOut
    */
    static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c/2 * (cos(π*t/d) - 1) + b
    }
    /*
    * easeOutIn
    */
    static func easeOutIn (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        if t < d / 2 {
            return easeOut(t * 2,  b,  c / 2,  d)
        } else {
            return easeIn((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}
