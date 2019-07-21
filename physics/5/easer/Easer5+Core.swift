/**
 * Core
 */
extension Easer5 {
   /**
    * onFrameTick
    */
   override func onFrameTick() {
      self.updatePosition()
//        self.updatePos()
      self.onFrame(value)
   }
   /**
    * updatePosition
    */
   @objc func updatePosition() {
      velocity = (targetValue - value) * easing
      value = value + velocity
      if assertStop {
           value = targetValue // set the final value
           stop() // stop the animation
           onComplete()
           onComplete = { } // resets onComplete closure, onComplete can only happen one time
      }
   }
   /**
    * The value will never be absolute, so we use epsilon to determine if its close enough
    */
   var assertStop:Bool {
      return state.velocity.isNear(value: stopVelocity, epsilon: epsilon)
   }
}
