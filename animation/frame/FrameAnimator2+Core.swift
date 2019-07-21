import Foundation
/**
 * Core
 */
extension FrameAnimator2 {
   /**
    * This is called from the AnimProxy.onFrameOnMainThread method
    */
   @objc func onFrameTick() { // Fixme: ⚠️️ should be marked overridable, and move this to extension and use @objc etc
      fatalError("Must be overwritten in subclass")
   }
   /**
    * Start the animation
    */
   @objc func start() {
     guard !stopped { return } // Aka you dont have to start it if its already running
     animProxy.animators.append(self) // Add your self to the list of animators that gets the onFrame call
     guard CVDisplayLinkIsRunning(animProxy.displayLink) { return }
     CVDisplayLinkStart(animProxy.displayLink) // start the displayLink if it isn't already running
   }
   /**
    * Stop the animation
    */
   @objc func stop(){
      animProxy.animators.removeAt(animProxy.animators.indexOf(self))/*If none exist -1 is returned and none is removed*/
      if animProxy.animators.isEmpty && CVDisplayLinkIsRunning(animProxy.displayLink {
         CVDisplayLinkStop(animProxy.displayLink)
      }/*stops the frame ticker if there is no active running animators*/
   }
}
