import Cocoa
import AnimKit
import Hybrid_macOS
/**
 * - Fixme: ⚠️️ rename buttons to primary, secondary tier...
 */
open class PeekAndPopView: NSView {
   static let shared: PeekAndPopView = { let instance = PeekAndPopView(); return instance }() // Singelton
   override open var isFlipped: Bool { return true } // TopLeft orientation
   var isModalHinged: Bool = false // This is set to true if modal is released above a sertion threshold (modal.y < 30) threshold
   // UI
   lazy var firstButton: ModalButton = createFirstButton() // createModalButton(btn: FirstButton())
   lazy var secondButton: ModalButton = createSecondButton() // createModalButton(btn: FirstButton())
   lazy var thirdButton: ModalButton = createThirdButton() //
   lazy var dismissButton: DismissButton = createPromptButton()
   override public init(frame: CGRect) {
      super.init(frame: frame)
      Swift.print("PeekAndPopView.init()")
      self.wantsLayer = true // if true then view is layer backed
      self.layer?.backgroundColor = Colors.background.color?.cgColor
      _ = firstButton
      _ = secondButton
      _ = dismissButton
      _ = thirdButton
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
