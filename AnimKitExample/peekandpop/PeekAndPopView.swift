import Cocoa
import AnimKit
import Hybrid_macOS

open class PeekAndPopView: NSView {
   static let shared: PeekAndPopView = {
      let instance = PeekAndPopView()
      return instance
   }()
   override open var isFlipped: Bool { return true } // TopLeft orientation
   var isModalHinged: Bool = false // This is set to true if modal is released above a sertion threshold (modal.y < 30) threshold
   // UI
   lazy var firstButton: ModalButton = createFirstButton() // createModalButton(btn: FirstButton())
   lazy var dismissButton: DismissButton = createPromptButton()
   override public init(frame: CGRect) {
      super.init(frame: frame)
      self.wantsLayer = true // if true then view is layer backed
      _ = firstButton
      _ = dismissButton
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
