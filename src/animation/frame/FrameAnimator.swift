import Foundation
/**
 * - Abstract: FrameAnimator serves as the Core Animator in this Animation library
 * - Fixme: ⚠️️⚠️️⚠️️ Make a local stopped flag, so you don't have to itrate animProxy.animations so many times
 * - Remark: We use NSObject in order to use @objc overriding in conjunction with extensions
 */
public class FrameAnimator: NSObject, FrameAnimatable { // Fixme: ⚠️️ Rename to FrameAnimator
   public var animProxy: AnimProxyKind // Reference to where the displayLink resides
   /**
    * - Parameter animatable: A reference to the AnimProxy singelton instance
    * - Fixme: ⚠️️ It's possible that we can just setup the sigelton as a lazy var, and not have to pass it in as a param
    */
   public init(_ animatable: AnimProxyKind = AnimProxy.shared) {
      self.animProxy = animatable
   }
}
