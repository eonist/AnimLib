import Cocoa
/**
 * - Abstract: FrameAnimator serves as the Core Animator in this Animation library
 * - Fixme: ⚠️️⚠️️⚠️️ Make a local stopped flag, so you dont have to itrate animProxy.animations so many times
 * - Note: We use EventSender for in-frequent events such as onComplete or onStop and we use a regular callback method as its very frequent
 */
class FrameAnimator2: FrameAnimatable2 { // Fixme: ⚠️️ Rename to FrameAnimator
    var animProxy: AnimProxyKind2 // Reference to where the displayLink resides
    /**
     * - Parameter animatable: A reference to the AnimProxy singelton instance
     */
    init(_ animatable: AnimProxyKind2 = AnimProxy2.shared) {
        self.animProxy = animatable
    }
}
