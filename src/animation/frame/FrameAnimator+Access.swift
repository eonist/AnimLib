import Foundation
/**
 * Access
 */
extension FrameAnimator {
    /**
     * Assert if an animator is in the array of animators (aka is animating) 
     * Fixme: ⚠️️ Name this hasStopped
     */
   public var stopped: Bool {
      return animProxy.animators.first { $0 === self } == nil
   }
}
