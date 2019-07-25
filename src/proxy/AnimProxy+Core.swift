import Foundation
/**
 * Core
 */
extension AnimProxy {
   /**
    * Fires on every screen refresh at 60 FPS, or device speed
    */
   @objc public func onFrame() {
      Swift.print("AnimProxy2.onFrame()")
      self.performSelector(onMainThread: #selector(onFrameOnMainThread), with: nil, waitUntilDone: false)
   }
   /**
    * Tick every animator on every frame tick (This is called on the MainThread)
    */
   @objc func onFrameOnMainThread() {
      animators.forEach { $0.onFrameTick() } // Loop through all assigned animators that are registered to AnimProxy
   }
   /**
    * - Note: It seems that you can't move this method into a static class method. Either internally in the same file or externally in another file
    * - Note: This method fires 60 FPS
    */
   @objc func setUpDisplayLink() -> CVDisplayLink {
      Swift.print("setUpDisplayLink")
      var displayLink: CVDisplayLink?
      var status = kCVReturnSuccess // Fixme: ⚠️️ Write the type for this variable
      status = CVDisplayLinkCreateWithActiveCGDisplays(&displayLink) // strange that you can't move this one line up
      // Set up DisplayLink, Fixme: ⚠️️ make this a var based callback instead?
      func displayLinkOutputCallback(displayLink: CVDisplayLink, _ inNow: UnsafePointer<CVTimeStamp>, _ inOutputTime: UnsafePointer<CVTimeStamp>, _ flagsIn: CVOptionFlags, _ flagsOut: UnsafeMutablePointer<CVOptionFlags>, _ displayLinkContext: UnsafeMutableRawPointer?) -> CVReturn {
           unsafeBitCast(displayLinkContext, to: AnimProxy.self).onFrame()
           return kCVReturnSuccess
      }
      if let displayLink = displayLink {
           /*let outputStatus */  _ = CVDisplayLinkSetOutputCallback(displayLink, displayLinkOutputCallback, UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()))
           let displayID = CGMainDisplayID()
           /*let displayIDStatus*/ _ = CVDisplayLinkSetCurrentCGDisplay(displayLink, displayID)
           return displayLink
      } else {
           fatalError("unable to setup displayLink")
      }
   }
}
