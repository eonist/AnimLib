import Cocoa
/**
 * - Abstract: FrameAnimator serves as the Core Animator in this Animation library
 * - Fixme: ⚠️️⚠️️⚠️️ Make a local stopped flag, so you don't have to itrate animProxy.animations so many times
 * - Remark: We use NSObject in order to use @objc overriding in conjunction with extensions
 */
public class FrameAnimator2: NSObject, FrameAnimatable2 { // Fixme: ⚠️️ Rename to FrameAnimator
   var animProxy: AnimProxyKind2 // Reference to where the displayLink resides
   /**
    * - Parameter animatable: A reference to the AnimProxy singelton instance
    * - Fixme: ⚠️️ It's possible that we can just setup the sigelton as a lazy var, and not have to pass it in as a param
    */
   init(_ animatable: AnimProxyKind2 = AnimProxy2.shared) {
      self.animProxy = animatable
   }
}
