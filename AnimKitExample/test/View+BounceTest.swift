import Cocoa
import AnimKit

extension View {
   /**
    * zoomBackAndForthAnimTest
    */
   func zoomBackAndForthAnimTest() {
      let startRect: CGRect = {
         let size: CGSize = .init(width: 70, height: 70)
         let p1: CGPoint = .init(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
         let p2: CGPoint = .init(x: size.width / 2, y: size.height / 2)
         let p: CGPoint = .init(x: p1.x - p2.x, y: p1.y - p2.y)
         return .init(origin: p, size: size)
      }()
      let endRect: CGRect = {
         let size: CGSize = .init(width: 150, height: 150)
         let p1: CGPoint = .init(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
         let p2: CGPoint = .init(x: size.width / 2, y: size.height / 2)
         let p: CGPoint = .init(x: p1.x - p2.x, y: p1.y - p2.y)
         return .init(origin: p, size: size)
      }()
      let startCornerRadius: CGFloat = 20
      let endCornerRadius: CGFloat = 35
      let view: NSView = {
         let roundRect: NSView = .init(frame: startRect)
         self.addSubview(roundRect)
         roundRect.wantsLayer = true
         roundRect.layer?.backgroundColor = NSColor.black.cgColor
         roundRect.layer?.cornerRadius = startCornerRadius
         return roundRect
      }()
      let anim = Animator.init((dur: 0.8, from: 0, to: 1), Easing.elastic.easeOut) { value in
         view.layer?.cornerRadius = startCornerRadius.interpolate(endCornerRadius, value)
         view.frame.size = startRect.size.interpolate(endRect.size, value)
         view.frame.origin = startRect.origin.interpolate(endRect.origin, value)
      }
      var zoomOut: () -> Void = {}
      let zoomIn: () -> Void = {
         anim.initValues = (dur: 0.8, from: 0, to: 1) // reverse
         anim.currentFrameCount = 0 // reset
         anim.completed = zoomOut // reset
         bgSleep(0.5) { anim.start() } // delay anim for 1 secs
      }
      zoomOut = {
         anim.initValues = (dur: 0.8, from: 1, to: 0) // reverse
         anim.currentFrameCount = 0 // reset
         anim.completed = zoomIn
         bgSleep(0.5) { anim.start() } // delay anim for 1 secs
      }
      anim.completed = zoomOut
      anim.start()
   }
}
