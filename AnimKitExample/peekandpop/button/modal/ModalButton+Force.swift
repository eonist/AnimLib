import Cocoa
/**
 * Force - stage
 */
extension ModalButton {
   /**
    * on stageSwitch
    */
   func onStageSwitch(stage: Int) {
      //Swift.print("onStageSwitch.stage:  \(stage)")
      if stage == 0 {
         if !PeekAndPopView.shared.isModalHinged {
            self.animator.direct = false
            self.animator.setTargetValue(self.idle).start()
            self.isExapanded = false
            if let color = design.idleColor { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         }
      } else if stage == 1 && self.prevStage == 0 { // only change to red if prev stage was 0
         if !PeekAndPopView.shared.isModalHinged {
            self.animator.direct = false
            self.animator.setTargetValue(self.click).start()
            self.isExapanded = false
            if let color = Colors.click.color { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         }
      } else if stage == 2 { // Expanded mode
         self.superview?.bringSubviewToFront(self) // change depth of view
         self.animator.direct = true
         self.isExapanded = true
         self.animator.setTargetValue(ModalButton.expanded).start()
         if let color = design.idleColor { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         //self.backgroundColor = .green
         //self.style.backgroundColor = .green
      }
   }
   /**
    * on Forcetouch stage change
    */
   func onStageChange(curStage: ForceButton.Stage) { //, prevStage: ForceTouchButton.ForceTouchStage
      Swift.print("stageChange curStage:  \(curStage)") //  prevStage:  \(prevStage)
      //let indexOfModal:Int = self.indexOfModal(event.origin)
      //Swift.print("event.type: " + "\(event.type)")
      switch curStage {
      case .clickDown:
         clickDown()
      case .clickUp:
         clickUp()
      case .deepClickDown:
         deepClickDown()
      case .deepClickUp:
         deepClickUp()
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
   }
   /**
    * deep-mode -> click-mode
    */
   private func deepClickUp() {
      Swift.print("deepClickUp")
      if PeekAndPopView.shared.isModalHinged {
         Swift.print("modal stay")
         // Fixme: ⚠️️ Remove click event listener for self here
         animator.direct = false
         var rect = ModalButton.expanded
         rect.origin.y -= 30
         animator.setTargetValue(rect).start()
      } else {
         Swift.print("modal leave")
         animator.direct = false
         animator.setTargetValue(self.idle).start()
         /*promptBtn*/
         PeekAndPopView.shared.dismissButton.animator.setTargetValue(DismissButton.hidden.origin.y).start() //anim bellow screen
      }
      self.isExapanded = false
   }
}
