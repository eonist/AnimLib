import Foundation
import Hybrid_iOS

class PromptButton: TextButton {
   /*Animation*/
//   lazy var animator:Easer5<CGPoint> = Easer5<CGPoint>(AnimState.PromptButton.initial, DefaultEasing.point,self.promptButtonAnim)
   override init(text: String = "Default", style: TextButton.TextButtonStyle = defaultTextButtonStyle, frame: CGRect = .zero) {
      super.init(text: text, style: style, frame: frame)
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   //   init() {
//      super.init(frame:.zero)
//   }
//   override layoutSubviews() {
//      self.layer.cornerRadius = self.frame.width / 2
//   }
}

//extension PromptButton {
//   /**
//    * Frame animation for promptButton
//    */
//   func promptButtonAnim(point:CGPoint){
//      self.promptBtn.layer?.position = point
//   }
//}
