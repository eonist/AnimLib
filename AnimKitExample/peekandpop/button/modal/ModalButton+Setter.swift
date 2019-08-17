import Foundation
/**
 * Setter
 */
extension ModalButton {
   enum FocusState {
      case focused, unFocused, hidden
   }
}
//   func setFocusState(state: FocusState) {
//      let alpha: CGFloat = {
//         switch state  {
//         case .focused: return 1.0
//         case .unFocused: return 0.2
//         case .hidden: return 0.0
//         }
//      }
//      button.backgroundColor = Colors.background.alpha(alpha)
//      button.graphic.backgroundColor = Colors.foreground.alpha(alpha)
//   }
