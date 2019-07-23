import Foundation
/**
 * - Fixme: ⚠️️ API like: spring(view, delay: 0.5, spring: 800, friction: 10, mass: 10) {}
 */
class Springer5<T: Advancable5>: Easer5<T> { // ⚠️️ Beta, untested ⚠️️
   typealias Config = (spring: T, friction: T) // Signatures
   var config: Config // Config values
   init(_ state: AnimState5<T>, _ config: Config, _ onFrame: @escaping FrameTickSignature) {
      self.config = config
      super.init(state, config.spring, onFrame)
   }
   /**
    * updatePosition
    */
   override func updatePosition() {
      let d = (targetValue - value)
      let a = d * config.spring
      velocity = velocity + a
      velocity = velocity * config.friction
      value =  value + velocity
      if assertStop {
         state.value = state.targetValue//set the final value
         stop()
      }
   }
}

/*Convenient default init values*/

enum DefaultSpring { // find a better place for these
   static var initSpringerConfig: Springer5<CGFloat>.Config = (0.02, 0.90)
   static var initPointSpringerConfig: Springer5<CGPoint>.Config = (CGPoint(x:0.02,y:0.02),CGPoint(x:0.90,y:0.90))
}
