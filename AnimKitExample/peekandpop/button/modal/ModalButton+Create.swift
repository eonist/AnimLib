import Foundation
import AnimKit
import Hybrid_macOS
import With_mac

extension ModalButton {
   /**
    * Creates animator
    */
   func createAnimator() -> ElasticEaser2<RoundedRect> {
//      Swift.print("createAnimator.self.frame:  \(self.frame)")
      let easing: RoundedRect = .init(rect: .init(x: 0.4, y: 0.4, width: 0.4, height: 0.4), fillet: 0.4)
      let epsilon: RoundedRect = .init(rect: .init(x: 0.002, y: 0.002, width: 0.002, height: 0.002), fillet: 0.002)
      let initAnimState: AnimState<RoundedRect> = .init(ModalButton.initial, ModalButton.initial, .zero, .zero, epsilon)
//      let contentFrame = (min: self.frame.origin.y, len: self.frame.height)
      let maskFrame = (min: self.window!.contentView!.frame.origin.y, len: self.window!.contentView!.frame.size.height)
      return .init(state: initAnimState,
                   easing: easing,
//                   contentFrame: contentFrame,
                   maskFrame: maskFrame,
                   onFrame: self.onElasticFrameAnim)
   }
   /**
    * ImageView
    */
   func createImageView() -> NSImageView {
      guard let img = NSImage(named: ImageAsset.eye.rawValue) else { fatalError("no img") }
      return with(.init(image: img)) {
         $0.wantsLayer = true
         self.addSubview($0)
         $0.anchorAndSize(to: self, width: img.size.width, height: img.size.height, align: .centerCenter, alignTo: .centerCenter, multiplier: .init(width: 0.8, height: 0.8))
      }
   }
}
