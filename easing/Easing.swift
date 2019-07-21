import Cocoa

public class Easing {
    static var back :Back.Type { return Back.self }
    static var bounce :Bounce.Type { return Bounce.self }
    static var circ :Circ.Type { return Circ.self }
    static var cubic :Cubic.Type { return Cubic.self }
    static var elastic :Elastic.Type { return Elastic.self }
    static var expo :Expo.Type { return Expo.self }
    static var linear :Linear.Type { return Linear.self }
    static var quad :Quad.Type { return Quad.self }
    static var quart :Quart.Type { return Quart.self }
    static var quint :Quint.Type { return Quint.self }
    static var sine :Sine.Type { return Sine.self }
}
/**
 * - NOTE: If you decrease the decimal variable you increase the friction effect
 */
/*
static func easeOut(value : CGFloat, _ from:CGFloat, _ to:CGFloat) -> CGFloat {
    let distToGoal:CGFloat = NumberParser.relativeDifference(value, to)
    let val:CGFloat = 0.2 * distToGoal
    return val
}
*/
