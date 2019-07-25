import Foundation

extension FrameAnimator {
   /**
    * Start the animation
    */
   @objc public func start() {
      Swift.print("start")
//      Swift.print("FrameAnimator2.start()")
      guard stopped else { return } // Aka you dont have to start it if its already running (already stopped, return)
      animProxy.animators.append(self) // Add your self to the list of animators that gets the onFrame call
      
      #if os(iOS)
      guard animProxy.displayLink.isPaused else { return } // DisplayLink already running, return
      animProxy.displayLink.add(to: .current, forMode: RunLoop.Mode.default)
      animProxy.displayLink.isPaused = false
      #elseif os(macOS)
      guard !CVDisplayLinkIsRunning(animProxy.displayLink) else { return } // DisplayLink already running, return
      CVDisplayLinkStart(animProxy.displayLink) // Start the displayLink if it isn't already running
      #endif
   }
   /**
    * Stop the animation
    */
   @objc public func stop() {
      animProxy.animators.removeFirst(self)
      
      #if os(iOS)
     
      animProxy.displayLink.isPaused = true
      animProxy.displayLink.invalidate()
//      open func remove(from runloop: RunLoop, forMode mode: RunLoop.Mode)
      
      
      #elseif os(macOS)
      if animProxy.animators.isEmpty && CVDisplayLinkIsRunning(animProxy.displayLink) {
         CVDisplayLinkStop(animProxy.displayLink) // Stops the frame ticker if there is no active running animators
      }
      #endif
      
   }
}
