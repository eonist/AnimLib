#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif
/**
 * Event
 * Fixme: ⚠️️ Seperate os speccific code into extension based on os
 */
extension InteractiveView {
   #if os(iOS)
   /**
    * On tap down inside
    */
   override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch: UITouch = touches.first/*, touch.view == self*/ {
         let touchPoint: CGPoint = touch.location(in: self)
         onDown(touchPoint)
      }
      super.touchesBegan(touches, with: event)
   }
   /**
    * On tap up inside
    */
   override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch: UITouch = touches.first/*, touch.view == self*/ {
         let touchPoint: CGPoint = touch.location(in: self)
         onUp(touchPoint)
      }
      super.touchesEnded(touches, with: event)
   }
   /**
    * When touches move
    */
   override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      if let touch: UITouch = touches.first /*, touch.view == self*/ {
         let touchPoint: CGPoint = touch.location(in: self)
         onMove(touchPoint)
      }
      super.touchesMoved(touches, with: event)
   }
   #elseif os(macOS)
   /**
    * Mouse down
    */
   override open func mouseDown(with event: NSEvent) {
      let p: CGPoint = self.convert(event.locationInWindow, from: nil)
      onDown(p)
   }
   /**
    * Mouse up
    */
   override open func mouseUp(with event: NSEvent) {
      let p: CGPoint = self.convert(event.locationInWindow, from: nil)
      onUp(p)
   }
   /**
    * Mouse dragged
    */
   override open func mouseDragged(with event: NSEvent) {
      // fixme: ⚠️️
      // might have to do: (since your getting local position not parentPOs i the current code)
         //let pos: CGPoint = self.superView!.convert((window?.mouseLocationOutsideOfEventStream)!,from:nil)
      let p: CGPoint = self.convert(event.locationInWindow, from: nil)
      onMove(p)
   }
   #endif
}
