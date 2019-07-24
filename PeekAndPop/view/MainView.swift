import UIKit
/**
 *
 */
class MainView {
	var isModalHinged: Bool = false/*This is set to true if modal is released above a sertion threshold (modal.y < 30) threshold*/
	lazy var curModal: ModalButton = self.firstButton//the active modal
	//UI
	lazy var firstButton: MainButton = createModalButton(type: FirstButton.self)
	lazy var secondButton: MainButton = createModalButton(type: SecondButton.self)
	lazy var thirdButton: MainButton = createModalButton(type: ThirdButton.self)
	lazy var promptButton: PromptButton = createPromptButton()


	init() {
		_ = firstButton
		_ = secondButton
		_ = thirdButton
		_ = promptButton
	}
}
