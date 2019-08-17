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
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
      stageChange = onStageChange
      stageSwitch = onStageSwitch
      _ = imageView
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
