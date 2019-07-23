import Foundation
/**
 * Access
 */
extension FrameAnimator2 {
    /**
     * Assert if an animator is in the array of animators (aka is animating) 
     * Fixme: ⚠️️ Name this hasStopped
     */
   var stopped: Bool {
      return animProxy.animators.first { $0 === self } == nil
   }
}
