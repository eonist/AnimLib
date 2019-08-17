import Cocoa
/**
 * Force - stage
 */
extension ModalButton {
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
   /**
    * on stageSwitch
    */
   func onStageSwitch(stage: Int) {
      //      Swift.print("onStageSwitch.stage:  \(stage)")
      if stage == 0 {
         if !PeekAndPopView.shared.isModalHinged {
            self.animator.direct = false
            self.animator.setTargetValue(ModalButton.initial).start()
            self.isExapanded = false
            if let color = Colors.Initial.first.color { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         }
      } else if stage == 1 && self.prevStage == 0 { // only change to red if prev stage was 0
         if !PeekAndPopView.shared.isModalHinged {
            self.animator.direct = false
            self.animator.setTargetValue(ModalButton.click).start()
            self.isExapanded = false
            if let color = Colors.click.color { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         }
      } else if stage == 2 {
         self.animator.direct = true
         self.isExapanded = true
         self.animator.setTargetValue(ModalButton.expanded).start()
         if let color = Colors.Initial.first.color { self.style.backgroundColor = color; self.backgroundColor = color } //.white
         //         self.backgroundColor = .green
         //         self.style.backgroundColor = .green
      }
   }
}
/**
 * ForceTouch
 */
extension ModalButton {
   private func clickDown() {
      Swift.print("clickDown")
   }
   private func clickUp() {
      Swift.print("clickUp")
   }
   private func deepClickDown() {
      Swift.print("deepClickDown")
   }
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
         animator.setTargetValue(ModalButton.initial).start()
         /*promptBtn*/
         PeekAndPopView.shared.dismissButton.animator.setTargetValue(DismissButton.hidden.origin.y).start() //anim bellow screen
      }
      self.isExapanded = false
   }
}
