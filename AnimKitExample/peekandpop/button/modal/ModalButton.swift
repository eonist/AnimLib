import Cocoa
import Hybrid_macOS
import Spatial_macOS
import AnimKit
import With_mac

class ModalButton: ForceButton {
   lazy var imageView: NSImageView = createImageView()
   var factor: CGFloat { return 0 }
   var onDownYOffset: CGFloat = 0
   lazy var animator: ElasticEaser2<RoundedRect> = createAnimator()
   var isExapanded: Bool = false
   typealias Design = (icon: ImageAsset, idleColor: NSColor?, idleFrame: CGRect)
   let design: Design // Stores the look and feel of the modal button
   init(design: Design) {
      self.design = design
      let style: Button.Style = with(Button.defaultStyle) {
         $0.borderWidth = 0
         $0.borderColor = .clear
         if let color = design.idleColor { $0.backgroundColor = color }
      }
      super.init(style: style, frame: design.idleFrame)
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
