import Foundation

extension PeekAndPopView {
   /**
    * click dismissbutton
    */
   func onDismissButtonClick() {
//      promptBtn.setAppearance(Colors.PromptButton.Background.idle)
//      self.curModal.modalAnimator.setTargetValue(Modal.initial(self.curModal.index)).start() // outro modal
      guard let curExpandedButton: ModalButton = [firstButton, secondButton, thirdButton].first(where: { $0.isExapanded } ) else { return }
      self.firstButton.animator.setTargetValue(curExpandedButton.idle).start() // outro modal
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
