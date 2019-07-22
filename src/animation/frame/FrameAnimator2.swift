import Cocoa
/**
 * - Abstract: FrameAnimator serves as the Core Animator in this Animation library
 * - Fixme: ⚠️️⚠️️⚠️️ Make a local stopped flag, so you don't have to itrate animProxy.animations so many times
 * - Remark: We use NSObject in order to use @objc overriding in conjunction with extensions
 */
class FrameAnimator2: NSObject, FrameAnimatable2 { // Fixme: ⚠️️ Rename to FrameAnimator
    var animProxy: AnimProxyKind2 // Reference to where the displayLink resides
    /**
     * - Parameter animatable: A reference to the AnimProxy singelton instance
     */
    init(_ animatable: AnimProxyKind2 = AnimProxy2.shared) {
        self.animProxy = animatable
    }
}
