import Foundation
import AnimKit
/**
 * Animation
 */
extension ModalButton {
   /**
    * onFrameTick
    * - Note: it seems we don't need `disableAnim {}`, but maybe in the future
    */
   func onFrameTick(value: RoundedRect) {
      self.frame = value.rect
      self.layer?.cornerRadius = value.fillet
   }
}
//AutoLayout code:
//let yOffset: CGFloat = touchPoint.y - onDownYOffset + (height/2)
//self.update(offset: .init(x: 0, y: yOffset), align: .centerCenter, alignTo: .topCenter)
