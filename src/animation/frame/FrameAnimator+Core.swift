import Foundation
/**
 * Core
 */
extension FrameAnimator {
   /**
    * This is called from the AnimProxy.onFrameOnMainThread method
    */
   @objc func onFrameTick() { // Fixme: ⚠️️ should be marked overridable, and move this to extension and use @objc etc
      fatalError("Must be overwritten in subclass")
   }
}
