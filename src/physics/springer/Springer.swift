import Foundation
/**
 * - Fixme: ⚠️️ API like: spring(view, delay: 0.5, spring: 800, friction: 10, mass: 10) {}
 * ## Examples:
 * let animator = Springer<CGPoint> { print("val: " + "\($0)") }
 * animator.targetValue = CGPoint(x: 100, y: 100)
 * animator.start()
 */
public class Springer<T: Advancable>: Easer<T> { // ⚠️️ Beta, untested ⚠️️
   var config: Config // Config values, fixme: Make this Spring struct
   public init(_ state: AnimState<T> = T.defaults, _ config: Config = T.defaultSpring, _ onFrame: @escaping FrameTickSignature) {
      self.config = config
      super.init(state, config.spring, onFrame)
   }
   /**
    * updatePosition
    * - Remark: this method cant be moved to extension because its inside a generic class
    */
   override func updatePosition() {
      let d = (targetValue - value)
      let a = d * config.spring
      velocity = { velocity + a }()
      velocity = { velocity * config.friction }() // ⚠️️ This is a temp hack, should implement *= in type etc
      value = { value + velocity }()
      if assertStop {
         state.value = state.targetValue//set the final value
         stop()
      }
   }
}
