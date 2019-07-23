import Foundation
/**
 * - Abstract: This class is in charge of moving things around when doing physics based animation
 * - Note: The Advancable protocol makes this class able to manipulate multiple values at once
 * - Note: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * - Note: This is the Base class
 * - Fixme: ⚠️️ Maybe make a base class for Easer and Springer that they both can extend? that way you could change between them on a whim
 * - Fixme: ⚠️️ Rename to Advancer ?
 * - Fixme: ⚠️️ Consider making a convenient init with named params
 */
class Easer5<T: Advancable5>: FrameAnimator2, PhysicsAnimKind5 {
   var easing: T // This can be customized by setting the value but not via init
   var state: AnimState5<T>
   var onFrame: FrameTickSignature // Fixme: ⚠️️ rename to onFrameTick, onFrameCallback, frameTick?
   var onComplete: OnComplete = {} // add external onComplete closures when needed
   //var updatePos:(() -> Void) = { _ in } // might have to make this lazy
   init(_ state: AnimState5<T>, _ easing: T, _ onFrame:@escaping FrameTickSignature) {
      self.state = state
      self.easing = easing
      self.onFrame = onFrame
      super.init()
      //self.updatePos = updatePosition
   }
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
   func updatePosition() {
      velocity = (targetValue - value) * easing
      value = value + velocity
      if assertStop {
         value = targetValue // set the final value
         stop() // stop the animation
         onComplete() // call onComplete to notify callback that this animation instance completed
         onComplete = { } // resets onComplete closure, onComplete can only happen one time
      }
   }
}

