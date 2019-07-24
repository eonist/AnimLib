/**
 * on Y-axis pan change
 */
extension MainView {
	/**
	 * Drag handler for modal
	 * - Abstract: moves the promptBtnAnimator
	 */
	func leftMouseDraggedClosure(event: NSEvent, button: ModalButton)  {
		 let relativePos:CGFloat =  self.onMouseDownMouseY - self.window!.contentView!.localPos().y
		 //Swift.print("relativePos: " + "\(relativePos)")
		 var newRect = Modal.expanded
		 newRect.y -= relativePos
		 button.animator.direct = true
		 button.animator.setTargetValue(newRect).start()
		 if button.animator.value.y < 30  { // modal in stayMode
			  self.isModalHinged = true
			  // Swift.print("reveal buttons: \(modalBtn.modalAnimator.value.y)")
			  var p = button.animator.value.rect.bottomLeft
			  p.y += 15 // add some margin
			  p.y = p.y.max(ProtoTypeView.PromptButton.expanded.y)
			  promptBtn.Animator.setTargetValue(p).start()//you could do modalBtn.layer.origin + getHeight etc.
		 } else if button.animator.value.y > 30 { // modal in leaveMode
			 self.isModalHinged = false
			 promptBtn.Animator.setTargetValue(PromptButton.initial.origin).start() //anim bellow screen
		 }
	}
}
