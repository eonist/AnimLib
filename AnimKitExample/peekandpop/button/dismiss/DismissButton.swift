import Foundation
import Hybrid_macOS
import AnimKit

class DismissButton: TextButton {
   /*Animation*/
   lazy var animator: Easer<CGFloat> = .init(.init(DismissButton.hidden.origin.y), CGFloat.defaultEasing, onFrameTick)
   override init(text: String = "Default", style: TextButton.TextButtonStyle = defaultTextButtonStyle, frame: CGRect = .zero) {
      super.init(text: text, style: style, frame: frame)
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

//extension PromptButton {
//   /**
//    * Frame animation for promptButton
//    */
//   func promptButtonAnim(point:CGPoint){
//      self.promptBtn.layer?.position = point
//   }
//}

// add dismiss anim when leave deep-click-mode
