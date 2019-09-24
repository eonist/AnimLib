import Cocoa
/**
 * Button events
 */
extension PeekAndPopView {
   /**
    * on click dismissButton
    */
   func onDismissButtonClick() {
      guard let curExpandedButton: ModalButton = DepthParser.frontMostView(views: [firstButton, secondButton, thirdButton]) as? ModalButton else { Swift.print("Cant find expanded button"); return }
      curExpandedButton.animator.setTargetValue(curExpandedButton.idle).start() // outro modal
      self.dismissButton.animator.setTargetValue(DismissButton.hidden.origin.y).start() // outro promptBtn
      self.isModalHinged = false // release modalStayMode
      curExpandedButton.hideOtherButtons(isHidden: false)
   }
}
/**
 * Event on background
 */
extension PeekAndPopView {
   /**
    * Hide modal and dismissButton on background mouseDown
    */
   override open func mouseDown(with event: NSEvent) {
      onDismissButtonClick()
   }
}
