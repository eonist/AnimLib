import Foundation
/**
 * Core
 */
extension LoopAnimator {
   /**
    * Fires on every frame tick
    */
   override func onFrameTick() {
      let val: CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
      onFrame(val) // call the FrameTick method
      if currentFrameCount >= framesToEnd {
           self.currentFrameCount = 0 // Reset
           if curRepeatCount >= repeatCount { // The loop ended
               curRepeatCount = 0 // Reset
               stop() // Stop animation
               completed()
           }
           curRepeatCount += 1
      }
      self.currentFrameCount += 1
   }
}
