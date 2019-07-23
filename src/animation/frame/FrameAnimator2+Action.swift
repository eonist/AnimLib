import Foundation

extension FrameAnimator2 {
   /**
    * Start the animation
    */
   @objc public func start() {
      Swift.print("FrameAnimator2.start()")
      guard stopped else { return } // Aka you dont have to start it if its already running (already stopped, return)
      animProxy.animators.append(self) // Add your self to the list of animators that gets the onFrame call
      guard !CVDisplayLinkIsRunning(animProxy.displayLink) else { return } // DisplayLink already running, return
      CVDisplayLinkStart(animProxy.displayLink) // Start the displayLink if it isn't already running
   }
   /**
    * Stop the animation
    */
   @objc public func stop() {
      animProxy.animators.removeFirst(self)
      if animProxy.animators.isEmpty && CVDisplayLinkIsRunning(animProxy.displayLink) {
         CVDisplayLinkStop(animProxy.displayLink) // Stops the frame ticker if there is no active running animators
      }
   }
}
