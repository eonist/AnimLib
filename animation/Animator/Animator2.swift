import Foundation
/**
 * - Note: Remember this needs to support many different animators and also simultan animations, so it cant be too intertwined
 * - Fixme: ⚠️️ make FrameAnimator2 that does not extend EventSender
 * - Fixme: ⚠️️ LoopAnimator2
 * - Fixme: ⚠️️ If you need to stop the entire anim chain you need to store each successive anim in an array and stop the one that is running, you can create utilitity methods that does this for you
 * - Fixme: ⚠️️ API like: spring(view, delay: 0.5, spring: 800, friction: 10, mass: 10) {}
 * - Fixme: ⚠️️ API like: animate(view, duration: 1, curve: .bezier(1, 0.4, 1, 0.5)) {$0.x = finalValue}
 */
class Animator2: FrameAnimator2 {
    var currentFrameCount: CGFloat = 0 // curFrameCount, this is needed in order to know when the animation is complete
    var onFrame: FrameTick
    var initValues: InitValues
    var easing: EasingEquation
    var completed: Completed = {} // Completion call-back
    //Fixme: ⚠️ ️Make a struct for the initValues instead, because: autoComplete
    /**
     * - Parameter initValues: The initial values of the animation (dur, from, to)
     * - Parameter easing: Variable for holding the easing method
     * - Parameter onFrame: This call-back variable is called on each frame-tick
     */
    init(initValues: Animator2.InitValues = Animator2.initValues, easing:@escaping EasingEquation = Easing.linear.ease, onFrame: @escaping FrameTick = {_ in }) { // Fixme: make default frametick
        self.initValues = initValues
        self.onFrame = onFrame
        self.easing = easing
        super.init(AnimProxy2.shared)
    }
    /**
     * Fires on every frame tick
     */
    override func onFrameTick() {
        let val: CGFloat = easing(currentFrameCount, from, to - from, framesToEnd) // Applies the current easing equation to the current progress
        onFrame(val) // Call the callBack onFrame method
        if currentFrameCount == framesToEnd {
            stop() // Stop the animation
            completed() // _ = completed(Animator.initValues, {_ in})//the animation completed, call the completed closure
        }
        self.currentFrameCount += 1 // increment current frame count
    }
    /**
     * - Note: we need onComplete in addition to complete because complete can't return self, so chaining won't work
     */
    func onComplete(closure: @escaping Completed) -> Self {
        completed = closure // assign the closure
        return self // we return self for chaining purpouses
    }
}
/**
 * Type
 */
extension Animator2 {
    typealias Completed = () -> Void
    /**
     * Signature for initValues
     * - Parameter dur: the seconds you want the animation to last
     * - Parameter from: from which value you want the animation to start from
     * - Parameter to: the end value you want to modulate to
     */
    typealias InitValues = (dur: CGFloat, from: CGFloat, to: CGFloat)
}
