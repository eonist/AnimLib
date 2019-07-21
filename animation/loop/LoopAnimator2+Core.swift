import Foundation
/**
 * Core
 */
extension LoopAnimator2{
   /**
    * Fires on every frame tick
    */
   override func onFrameTick() {
      let val: CGFloat = easing(currentFrameCount, from, to-from, framesToEnd)
      onFrame(val) // call the FrameTick method
      if currentFrameCount >= framesToEnd {
           self.currentFrameCount = 0 // reset
           if curRepeatCount >= repeatCount { // The loop ended
               curRepeatCount = 0 // reset
               stop() // stop animation
               completed()
           }
           curRepeatCount += 1
      }
      self.currentFrameCount += 1
   }
}
