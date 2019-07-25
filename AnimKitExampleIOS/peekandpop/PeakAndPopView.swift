import UIKit
import Hybrid_iOS

class PeekAndPopView: UIView {
//   lazy var firstButton: Button = createFirstButton()
   lazy var firstButton: ModalButton = createModalButton(btn: FirstButton())
   lazy var secondButton: ModalButton = createModalButton(btn: SecondButton())
   lazy var thirdButton: ModalButton = createModalButton(btn: ThirdButton())
   lazy var promptButton: PromptButton = createPromptButton()

   init() {
      super.init(frame: .zero)
      _ = firstButton
      _ = secondButton
      _ = thirdButton
      _ = promptButton
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
