import UIKit
import Spatial

extension ModalButton {
   /**
    * onMove
    */
   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//      Swift.print("touchesMoved")
      if let touch: UITouch = touches.first /*, touch.view == self*/ {
         let touchPoint: CGPoint = touch.location(in: self.superview)
         guard let height: CGFloat = self.size?.h.constant else { return }
         let yOffset: CGFloat = touchPoint.y - onDownYOffset + (height / 2)
         self.update(offset: .init(x: 0, y: yOffset), align: .centerCenter, alignTo: .topCenter)
      }
      super.touchesMoved(touches, with: event)
   }
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      if  let touch: UITouch = touches.first/*, touch.view == self*/ {
         let touchPoint: CGPoint = touch.location(in: self)
         onDownYOffset = touchPoint.y
      }
   }
}
