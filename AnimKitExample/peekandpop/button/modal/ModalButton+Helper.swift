import Foundation

extension ModalButton {
   /**
    * hides other buttons
    */
   func hideOtherButtons(isHidden: Bool) {
      let parent = (self.superview as? PeekAndPopView)
      let otherButtons: [ModalButton] = [parent?.firstButton, parent?.secondButton, parent?.thirdButton].compactMap { $0 }.filter { $0 != self }
      otherButtons.forEach { $0.isHidden = isHidden }
   }
}
