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
    * ImageView
    */
   func createImageView() -> NSImageView {
      guard let img = NSImage(named: ImageAsset.eye.rawValue) else { fatalError("no img") }
//      Swift.print("img.size:  \(img.size)")
      return with(.init(image: img)) {
//         $0.frame = .init(origin: .zero, size: img.size)
//         $0.layer?.backgroundColor = NSColor.purple.cgColor
         $0.wantsLayer = true
         self.addSubview($0)
         $0.anchorAndSize(to: self, width: img.size.width, height: img.size.height, align: .centerCenter, alignTo: .centerCenter, multiplier: .init(width: 0.8, height: 0.8))
      }
//      Swift.print("imageView.frame:  \(imageView.frame)")
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
