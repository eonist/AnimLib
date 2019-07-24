import UIKit
/**
 *
 */
extension MainView {
	/**
	 * ForceTouch handler for modal
	 */
	func onForceTouchEvent(_ event: ForceTouchEvent)  {
		switch event {
		case is .stageChange: onButtonThresholdChange(event)
		case is .clickDown: onButtonDown()
		case is .clickUp: onButtonUp()
		case is .deepClickDown: onButtonDeepDown()
		case is .deepClickUp: onButtonDeepUp()
		}
	}
}
/**
 * Button event
 */
extension MainView {
	func onButtonDown(button: ModalButton){
		button.modalAnimator.setTargetValue(button.click).start()
	}
	func onButtonUp(button: ModalButton){
		button.modalAnimator.setTargetValue(button.initial).start()//transition Modal from expanded to initial, if it was in expanded
	}
	func onButtonDeepDown(button: ModalButton){
		self.curModal = button//set cur active modal
		modalAnimator.setTargetValue(button.expanded).start()//Swift.print("window.contentView.localPos(): " + "\(window.contentView!.localPos())")
		onMouseDownMouseY = button.localPos().y
		NSEvent.addMonitor(&leftMouseDraggedMonitor, .leftMouseDragged, leftMouseDraggedClosure)
	}
	func onButtonDeepUp(button: ModalButton){
		if isModalHinged {/*modal stay*/
			 // ProtoTypeView.shared.curModal.removeHandler()
			 modalAnimator.direct = false
			 var rect = Modal.expanded
			 rect.origin.y -= 30
			 modalAnimator.setTargetValue(rect).start()
		}else{/*modal leave*/
			 modalAnimator.direct = false
			 modalAnimator.setTargetValue(button.initial).start()
			 /*promptBtn*/
			 promptButton.animator.setTargetValue(promptButton.initial.origin).start() //anim bellow screen
		}
		NSEvent.removeMonitor(&leftMouseDraggedMonitor)
	}
	/**
	 * When forcetouch changes state
	 */
	func onButtonThresholdChange(button: ModalButton) {
		let stage: Int = event.stage
		if stage == 0 && !isModalHinged {
		  	button.setFocusedState(.focused)
			 toggleFocusForOtherButtons(.focused, button)
		} else if stage == 1 { // only change to red if prev stage was 0
			 if !isModalHinged && event.prevStage == 0 {
				  button.setFocusedState(.focused)
				  toggleFocusForOtherButtons(.unFocused, button)
			 }
		} else if stage == 2 && !self.isModalHinged {
			 toggleFocusForOtherButtons(.hidden, button)
		}
	}
}
/**
 * Helper
 */
extension MainView {
	/**
	 * toggleFocus
	 */
	fileprivate func toggleFocus(focusState: FocusState, button: ModalButton){
		 self.subviews.filter { $0 is ModalButton.self && button !== self }.forEach {
			 $0.setFocusState(focusState: focusState)
		 }
	}
}
