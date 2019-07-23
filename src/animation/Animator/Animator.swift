import Foundation
/**
 * - Note: Remember this needs to support many different animators and also simultan animations, so it cant be too intertwined
 * - Fixme: ⚠️️ If you need to stop the entire anim chain you need to store each successive anim in an array and stop the one that is running, you can create utilitity methods that does this for you
 * - Fixme: ⚠️️ API like: animate(view, duration: 1, curve: .bezier(1, 0.4, 1, 0.5)) {$0.x = finalValue}
 */
public class Animator: FrameAnimator {
   /**
    * - Abstract, this is needed in order to know when the animation is complete
    * - Remark: You need to set this to zero if you want to reset the animation
    */
   public var currentFrameCount: CGFloat = 0
   public var completed: Completed = {} // Completion call-back
   public var onFrame: FrameTick
   public var initValues: InitValues
   var easing: EasingEquation
   /**
    * - Parameter initValues: The initial values of the animation (dur:0.5, from:0, to:1)
    * - Parameter easing: Variable for holding the easing method
    * - Parameter onFrame: This call-back variable is called on each frame-tick
    * ## Examples:
    * Animator((0.5, 0, 1), .easeInOut) { progress in view.frame.origin.x += 100 * progress }.start() // Animates a frame 100px in 0.5 seconds with an easeInOut easing curve
    * let animator: Animator = .init()
    * animator.onFrame = { progress in view.frame.size }
    * animator.completed = { Swift.print("Animation completed ✅") }
    * animator.start()
    * - Fixme: ⚠️ Make a struct for the initValues instead, because: autoComplete
    * - Fixme: ⚠️️ Rename initvalues to config ?
    * - Fixme: ⚠️️ Add convenience init that uses param names
    */
   public init(_ initValues: Animator.InitValues = Animator.initValues, _ easing:@escaping EasingEquation = Easing.linear.ease, _ onFrame: @escaping FrameTick = { _ in }) { // Fixme: make default frametick
      self.initValues = initValues
      self.onFrame = onFrame
      self.easing = easing
      super.init(AnimProxy.shared)
   }
}
