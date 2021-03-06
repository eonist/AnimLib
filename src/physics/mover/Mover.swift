import Foundation

public class Mover: FrameAnimator {
   public var value: CGFloat = 0
   var velocity: CGFloat
   var callBack: FrameTick
   /**
    * - Parameters:
    *   - value: the value that should be applied to the target
    *   - velocity: The amount increased on each frame-tick of the animation
    *   - callback: the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure
    */
   init(_ animatable: AnimProxyKind, _ callBack:@escaping FrameTick, _ value: CGFloat, _ velocity: CGFloat = 0) {
      self.value = value
      self.velocity = velocity
      self.callBack = callBack
      super.init(animatable)
   }
}
