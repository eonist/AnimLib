import Cocoa
import AnimKit

extension View {
   /**
    * testAnimation
    */
   func testAnimation() {
      let box: NSView = .init(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
      box.wantsLayer = true
      box.layer?.backgroundColor = NSColor.orange.cgColor
      addSubview(box)
      let animator: Animator2 = .init()
      animator.onFrame = { progress in Swift.print("onFrame"); disableAnim { box.frame.origin.x = 100 * progress } }
      animator.completed = { Swift.print("Animation completed ✅") }
      animator.start()
   }
}
