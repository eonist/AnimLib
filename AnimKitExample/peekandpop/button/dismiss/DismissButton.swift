import Foundation
import Hybrid_macOS
import AnimKit
/**
 * Fixme: ⚠️️ add dismiss anim when leave deep-click-mode
 */
class DismissButton: TextButton {
   /**
    * The animator
    */
   lazy var animator: Easer<CGFloat> = .init(.init(DismissButton.hidden.origin.y), CGFloat.defaultEasing, onFrameTick)
   override init(text: String = "Default", style: TextButton.TextButtonStyle = defaultTextButtonStyle, frame: CGRect = .zero) {
      super.init(text: text, style: style, frame: frame)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
