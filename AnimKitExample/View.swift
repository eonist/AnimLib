import Cocoa
import AnimKit

open class View: NSView{
   override open var isFlipped: Bool { return true }/*TopLeft orientation*/
   override public init(frame: CGRect) {
      super.init(frame: frame)
      Swift.print("hello world")
      self.wantsLayer = true /* if true then view is layer backed */
      testAnimation()
   }
   /**
    * Boilerplate
    */
   required public init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension View {
   /**
    * testAnimation
    */
   func testAnimation() {
      let box = NSView.init(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
      box.wantsLayer = true
      box.layer?.backgroundColor = NSColor.orange.cgColor
      addSubview(box)
      let animator: Animator2 = .init()
      animator.onFrame = { progress in Swift.print("onFrame"); disableAnim { box.frame.origin.x = 100 * progress } }
      animator.completed = { Swift.print("Animation completed ✅") }
      animator.start()
   }
}
