/**
 * Core
 */
extension Easer5 {
   /**
    * - Abstract: This is called on every frame tick (60 FPS)
    */
   override func onFrameTick() {
      self.updatePosition()
      self.onFrame(value)
   }
   /**
    * - Abstract In charge of updating the velocity and value of the animation instance (also calls onCOmplete)
    */
   @objc func updatePosition() {
      velocity = (targetValue - value) * easing
      value = value + velocity
      if assertStop {
           value = targetValue // set the final value
           stop() // stop the animation
           onComplete() // call onComplete to notify callback that this animation instance completed
           onComplete = { } // resets onComplete closure, onComplete can only happen one time
      }
   }
   /**
    * The value will never be absolute, so we use epsilon to determine if its close enough
    * - Fixme: ⚠️️ Rename to hasStopped
    */
   var assertStop: Bool {
      return state.velocity.isNear(value: stopVelocity, epsilon: epsilon)
   }
}
