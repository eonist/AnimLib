import Foundation
import AnimKit

extension ModalButton {
   /**
    * onFrameTick
    */
   func onElasticFrameAnim(value: RoundedRect) {
      //Swift.print("thumbFrameAnim.yValue:  \(yValue)")
//      disableAnim {
      self.frame = value.rect
      self.layer?.cornerRadius = value.fillet
//      }
   }
}
//let yOffset: CGFloat = touchPoint.y - onDownYOffset + (height/2)
//self.update(offset: .init(x: 0, y: yOffset), align: .centerCenter, alignTo: .topCenter)
