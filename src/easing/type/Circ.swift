import Foundation
/**
 * Circular
 */
public class Circ {
   /*
    * easeIn
    */
    public static func easeIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d
        return (-c * (sqrt( 1 - pow(t, 2)) - 1) + b)
    }
    /*
    * easeOut
    */
    public static func easeOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d - 1
        return (c * sqrt(1 - pow(t, 2)) + b)
    }
    /*
    * easeInOut
    */
    public static func easeInOut(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t / d * 2
        if t < 1 {
            return -c / 2 * (sqrt( 1 - t * t) - 1) + b
        } else {
            t = t - 2
            return c / 2 * (sqrt( 1 - t * t) + 1) + b
        }
    }
    /*
    * easeOutIn
    */
    public static func easeOutIn(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        if t < d / 2 {
            return easeOut(t * 2,  b,  c / 2,  d)
        } else {
            return easeIn(( t * 2 ) - d, b + c / 2,  c / 2,  d)
        }
    }
}
