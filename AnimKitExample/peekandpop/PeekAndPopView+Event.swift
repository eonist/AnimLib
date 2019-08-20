import Foundation

extension PeekAndPopView {
   /**
    * click dismissbutton
    */
   func onDismissButtonClick() {
      Swift.print("onDismissButtonClick")
//      promptBtn.setAppearance(Colors.PromptButton.Background.idle)
//      self.curModal.modalAnimator.setTargetValue(Modal.initial(self.curModal.index)).start() // outro modal
//      guard let curExpandedButton: ModalButton = [firstButton, secondButton, thirdButton].first(where: { $0.isExapanded } ) else { Swift.print("Cant find expanded button"); return }
      
      // 🏀
         // Generalize the bellow method and add to DepthParser
         // use minMax to get front and back
         // hide other buttons, when expansion is complete
         // unihide other btns when expansion is dismissed
      guard let frontMostButton: ModalButton = [firstButton, secondButton, thirdButton].sorted(by: { $0.superview?.subviews.firstIndex(of: $0) ?? 0 > $1.superview?.subviews.firstIndex(of: $1) ?? 0 }).first else { return }
      Swift.print("curExpandedButton:  \(frontMostButton)")
      Swift.print("frontMostButton.design.icon:  \(frontMostButton.design.icon)")
      frontMostButton.animator.setTargetValue(frontMostButton.idle).start() // outro modal
//      self.curModal.setAppearance(Colors.Modal.initial(self.curModal.index)) // reset the color again
//      self.firstButton.backgroundColor = .white
//      self.firstButton.style.backgroundColor = .white
//      self.curModal.toggleFocusForOtherButtons(.focused) // reset focus state of other buttons
      self.dismissButton.animator.setTargetValue(DismissButton.hidden.origin.y).start() // outro promptBtn
//      self.curModal.addHandler(self.curModal.forceTouchHandler) // re-Added forcetoucheventhandler, ideally add this handler on outro complete
//      self.modalStayMode = false
      self.isModalHinged = false // release modalStayMode
   }
}
