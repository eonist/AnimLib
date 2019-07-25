import Foundation
/**
 * Back
 */
public class Back {
   /**
    * easeIn
    */
    public static func easeIn(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
        var s: CGFloat?
        if s == nil { s = 1.701_58 }
        var t = t
        t /= d
        return c * t * t * ((s! + 1 ) * t - s!) + b
    }
    /*
    * easeOut
    */
    public static func easeOut(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
        var s: CGFloat?
        if s == nil { s = 1.701_58 }
        var t = t
        t = t / d - 1
        return c * (t * t * ((s! + 1) * t + s!) + 1) + b
    }
    /*
    * easeInOut
    */
    public static func easeInOut(_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
        var s: CGFloat?
        if s == nil { s = 1.701_58 }
        s = s! * 1.525
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * (t * t * ((s! + 1) * t - s!)) + b
        } else {
            t -= 2
            return c / 2 * (t * t * ((s! + 1) * t + s!) + 2) + b
        }
    }
}
