import Cocoa
/**
 * Force - stage
 */
extension ModalButton {
   /**
    * on stageSwitch
    */
   func onStageSwitch(stage: Int) {
      if stage == 0 { // initial mode
         if !PeekAndPopView.shared.isModalHinged {
            self.animator.direct = false
            self.animator.onComplete = { [weak self] in
               self?.hideOtherButtons(isHidden: false) // hide other buttons
            }
            self.animator.setTargetValue(self.idle).start()
            self.isExpanded = false
            if let color = design.idleColor { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         }
      } else if stage == 1 && self.prevStage == 0 { // idle mode
         if !PeekAndPopView.shared.isModalHinged {
            self.animator.direct = false
            self.animator.onComplete = { [weak self] in
               self?.hideOtherButtons(isHidden: false) // hide other buttons
            }
            self.animator.setTargetValue(self.click).start()
            self.isExpanded = false
            if let color = Colors.click.color { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         }
      } else if stage == 2 { // Expanded mode
         self.superview?.bringSubviewToFront(self) // change depth of view
         self.animator.direct = true
         self.isExpanded = true
         self.animator.onComplete = { [weak self] in
            self?.hideOtherButtons(isHidden: true) // hide other buttons
         }
         self.animator.setTargetValue(ModalButton.expanded).start()
         if let color = design.idleColor { self.style.backgroundColor = color; self.backgroundColor = color } //.white
      }
   }
   /**
    * on Forcetouch stage change
    */
   func onStageChange(curStage: ForceButton.Stage) {
      Swift.print("stageChange curStage:  \(curStage)")
      switch curStage {
      case .clickDown: clickDown()
      case .clickUp: clickUp()
      case .deepClickDown: deepClickDown()
      case .deepClickUp: deepClickUp()
      }
   }
}
/**
 * ForceTouch
 */
extension ModalButton {
   /**
    * idle-mode -> click-mode
    */
   private func clickDown() {
      Swift.print("clickDown")
   }
   /**
    * click-mode -> idle-mode
    */
   private func clickUp() {
      Swift.print("clickUp")
   }
   /**
    * click-mode -> deep-mode
    */
   private func deepClickDown() {
      Swift.print("deepClickDown")
//      hideOtherButtons(isHidden: true)
   }
   /**
    * deep-mode -> click-mode
    * Fixme: ⚠️️ Remove click event listener for self here
    */
   private func deepClickUp() {
      if PeekAndPopView.shared.isModalHinged { // modal stay
         animator.direct = false
         var rect = ModalButton.expanded
         rect.origin.y -= 30
         animator.setTargetValue(rect).start()
      } else { // modal leave
         animator.direct = false
         animator.setTargetValue(self.idle).start()
         PeekAndPopView.shared.dismissButton.animator.setTargetValue(DismissButton.hidden.origin.y).start() // promptBtn, anim bellow screen
         // hide other
         hideOtherButtons(isHidden: false)
      }
      self.isExpanded = false
   }
}
