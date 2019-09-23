import Cocoa
import Hybrid_macOS
import Spatial_macOS
import AnimKit

extension ModalButton {
   /**
    * Mouse down
    */
   override func mouseDown(with event: NSEvent) {
      let p: CGPoint = self.superview!.convert((window?.mouseLocationOutsideOfEventStream)!, from: nil)//self.convert(event.locationInWindow, from: nil)//      let p: CGPoint = self.convert(event.locationInWindow, from: nil)
      onDownYOffset = p.y
   }
   /**
    * Mouse dragged
    */
   override open func mouseDragged(with event: NSEvent) {
      guard isExapanded else { return }
      let newRect: RoundedRect = {
         let p: CGPoint = self.superview!.convert((window?.mouseLocationOutsideOfEventStream)!, from: nil)//self.convert(event.locationInWindow, from: nil)
         let relativePos: CGFloat = self.onDownYOffset - p.y
         var newRect = ModalButton.expanded
         newRect.origin.y -= relativePos
         return newRect
      }()
      animator.setTargetValue(newRect).start() // Moves the dismissBtn
      if animator.value.origin.y < 30 { // modal in stayMode
         PeekAndPopView.shared.isModalHinged = true
         let y: CGFloat = Swift.max(animator.value.origin.y + animator.value.size.height + 15, DismissButton.revealed.origin.y) // 15 = add some margin
         PeekAndPopView.shared.dismissButton.animator.setTargetValue(y).start() // you could do modalBtn.layer.origin + getHeight etc.
      } else if animator.value.origin.y > 30 {// modal in leaveMode
         PeekAndPopView.shared.isModalHinged = false
         PeekAndPopView.shared.dismissButton.animator.setTargetValue(DismissButton.hidden.origin.y).start() //anim bellow screen
      }
   }
}
