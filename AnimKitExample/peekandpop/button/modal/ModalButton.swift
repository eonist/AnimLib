import Cocoa
import Hybrid_macOS
import Spatial_macOS
import AnimKit

class ModalButton: ForceButton {
   var factor: CGFloat { return 0 }
   var onDownYOffset: CGFloat = 0
   lazy var animator: ElasticEaser2<RoundedRect> = createAnimator()
   var isExapanded: Bool = false
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
      stageChange = onStageChange
      stageSwitch = onStageSwitch
      guard let img = NSImage(named: ImageAsset.eye.rawValue) else { fatalError("no img") }
      Swift.print("img.size:  \(img.size)")
      let imageView: NSImageView = .init(image: img)
      imageView.frame = .init(origin: .zero, size: img.size)
      imageView.layer?.backgroundColor = NSColor.purple.cgColor
      imageView.wantsLayer = true
      self.addSubview(imageView)
      Swift.print("imageView.frame:  \(imageView.frame)")
//      img = img?.resize(to: CGSize(width: 45/2, height: 45/2))
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

// 🏀
   // Try to use IconButton
   // add image asset
