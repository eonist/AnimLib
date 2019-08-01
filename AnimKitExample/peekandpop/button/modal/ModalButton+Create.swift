import Foundation
import AnimKit
import Hybrid_macOS

extension ModalButton {
   /**
    * Creates animator
    */
   func createAnimator() -> ElasticEaser2<RoundedRect> {
//      Swift.print("createAnimator.self.frame:  \(self.frame)")
      let easing: RoundedRect = .init(rect: .init(x: 0.4, y: 0.4, width: 0.4, height: 0.4), fillet: 0.4)
      let epsilon: RoundedRect = .init(rect: .init(x: 0.002, y: 0.002, width: 0.002, height: 0.002), fillet: 0.002)
      let initAnimState: AnimState<RoundedRect> = .init(ModalButton.initFrame, ModalButton.initFrame, .zero, .zero, epsilon)
//      let contentFrame = (min: self.frame.origin.y, len: self.frame.height)
      let maskFrame = (min: self.window!.contentView!.frame.origin.y, len: self.window!.contentView!.frame.size.height)
      return .init(state: initAnimState,
                   easing: easing,
//                   contentFrame: contentFrame,
                   maskFrame: maskFrame,
                   onFrame: self.onElasticFrameAnim)
   }
}
