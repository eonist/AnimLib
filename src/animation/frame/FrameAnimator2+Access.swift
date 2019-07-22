import Foundation
/**
 * Access
 */
extension FrameAnimator2 {
    /**
     * Assert if an animator is active or not, you can also check if the Animator is nil to check if is active or not
     * Fixme: ⚠️️ Name this hasStopped
     */
   var stopped: Bool {
      return animProxy.animators.first { $0 === self } == nil
   }
}
