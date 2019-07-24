/**
 * Create
 */
extension MainView {
	func createModalButton(type: ModalButton.Type) -> MainButton {
		let btn = type.init()
		addSubview(btn)
		btn.anchorAndSize(to: self, width: MainButton.initialSize.width, height: MainButton.initialSize.height, align: .centerCenter, alignTo: .topCenter, offset: .init(x:0,y:frame.size.height/3*btn.factor))
		btn.forceTouchEvent = onForceTouchEvent
		return btn
	}
	/**
	 * Creates the Prompt Button
	 */
	func createPromptButton() -> PromptButton {
		let textBtn: PromptButton = .init("Dismiss")
		addSubview(textBtn)
	   textBtn.anchorAndSize(to: self, height: 60, align: .bottomCenter, alignTo: .bottomCenter, sizeOffset:.init(width:-40,height:0), offset: .init(x:0,y:-20))
		return textBtn
	}
}
