import Foundation

public class Easing {
   public static var back: Back.Type { return Back.self }
   public static var bounce: Bounce.Type { return Bounce.self }
   public static var circ: Circ.Type { return Circ.self }
   public static var cubic: Cubic.Type { return Cubic.self }
   public static var elastic: Elastic.Type { return Elastic.self }
   public static var expo: Expo.Type { return Expo.self }
   public static var linear: Linear.Type { return Linear.self }
   public static var quad: Quad.Type { return Quad.self }
   public static var quart: Quart.Type { return Quart.self }
   public static var quint: Quint.Type { return Quint.self }
   public static var sine: Sine.Type { return Sine.self }
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
