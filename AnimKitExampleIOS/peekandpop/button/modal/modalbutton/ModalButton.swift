import Foundation
import UIKit
import Hybrid_iOS
import Spatial

class ModalButton: ForceTouchButton {
   var factor: CGFloat { return 0 }
   var onDownYOffset: CGFloat = 0
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Helper
 */
extension ModalButton {
   /**
    * Called on each stage change
    */
   func stageChange(curStage: ForceTouchButton.ForceTouchStage, prevStage: ForceTouchButton.ForceTouchStage) {
      Swift.print("stageChange curStage:  \(curStage) prevStage:  \(prevStage)")
   }
}

