import Foundation
import AnimKit
/**
 * Animation
 */
extension ModalButton {
   /**
    * onFrameTick
    * - Remark: it seems we dont need `disableAnim {}`, but maybe in the future
    */
   func onElasticFrameAnim(value: RoundedRect) {
      self.frame = value.rect
      self.layer?.cornerRadius = value.fillet
   }
}
//AutoLayout code:
//let yOffset: CGFloat = touchPoint.y - onDownYOffset + (height/2)
//self.update(offset: .init(x: 0, y: yOffset), align: .centerCenter, alignTo: .topCenter)
