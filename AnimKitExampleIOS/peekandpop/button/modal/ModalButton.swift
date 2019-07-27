import Foundation
import UIKit
import Hybrid_iOS

class ModalButton: ForceTouchButton {
   var factor: CGFloat { return 0 }
//   lazy var animator: ElasticEaser5 = ElasticEaser5(AnimState.initial(self.index), RoundedRect.DefaultEasing.easing,ProtoTypeView.Constraint.content,ProtoTypeView.Constraint.mask,self.modalFrameAnim)
//   var onMouseDownMouseY:CGFloat = 0
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension ModalButton {
   func stageChange(curStage: ForceTouchButton.ForceTouchStage, prevStage: ForceTouchButton.ForceTouchStage) {
      Swift.print("curStage:  \(curStage) prevStage:  \(prevStage)")
   }
}
/*
 * Defaults
 */
//extension ModalButton {
//   static initSize: CGSize = .init(width: 80, height: 80)
//   static clickSize: CGSize = .init(width: 80 * 1.25, height: 80 * 1.25)
//   static expandedSize: CGSize = .init(width: frame.size.width - 40, height: frame.size.height - 40)
//}
/*
 * Setter
 */
//extension ModalButton {
//   enum FocusState {
//      case focused, unFocused, hidden
//   }
//   func setFocusState(state: FocusState) {
//      let alpha:CGFloat = {
//         switch state  {
//         case .focused: return 1.0
//         case .unFocused: return 0.2
//         case .hidden: return 0.0
//         }
//      }
//      button.backgroundColor = Colors.background.alpha(alpha)
//      button.graphic.backgroundColor = Colors.foreground.alpha(alpha)
//   }
//}
