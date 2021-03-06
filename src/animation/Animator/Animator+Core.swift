import Foundation
/**
 * Core
 */
extension Animator {
   /**
    * - Note: we need onComplete in addition to complete because complete can't return self, so chaining won't work
    */
   @objc func onComplete(closure: @escaping Completed) -> Self {
      completed = closure // Assign the closure
      return self // We return self for chaining purpouses
   }
   /**
    * Fires on every frame tick
    */
   override func onFrameTick() {
      let val: CGFloat = easing(currentFrameCount, from, to - from, framesToEnd) // Applies the current easing equation to the current progress
      onFrame(val) // Call the callBack onFrame method
      if currentFrameCount == framesToEnd {
           stop() // Stops the animation
           completed() // _ = completed(Animator.initValues, {_ in}) // the animation completed, call the completed closure
      }
      self.currentFrameCount += 1 // increment current frame count
   }
}
