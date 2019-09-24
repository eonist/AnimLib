import Cocoa
import Hybrid_macOS
import Spatial_macOS
import AnimKit
import With_mac

class ModalButton: ForceButton {
   var factor: CGFloat { return 0 }
   var onDownYOffset: CGFloat = 0
   var isExapanded: Bool = false
   let design: Design // Stores the look and feel of the modal button
   lazy var imageView: NSImageView = createImageView()
   lazy var animator: ElasticEaser2<RoundedRect> = createAnimator()
   /**
    * - Parameter design: The style of the ModalButton
    */
   init(design: Design) {
      self.design = design
      let modalButtonStyle = ModalButton.modalButtonStyle(design: design)
      super.init(style: modalButtonStyle, frame: design.idleFrame)
      stageChange = onStageChange // Assign callback
      stageSwitch = onStageSwitch // Assign callback
      _ = imageView // Add image graphic
      self.layer?.cornerRadius = self.idle.fillet
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
