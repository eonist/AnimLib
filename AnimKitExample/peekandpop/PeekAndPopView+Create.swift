import Foundation
import Spatial_macOS
import With_mac
import Hybrid_macOS

extension PeekAndPopView {
   /**
    * firstBtn
    */
   func createFirstButton() -> ModalButton {
      var style: Button.Style = Button.defaultStyle
      style.borderWidth = 0
      style.borderColor = .clear
      if let color = Colors.Initial.first.color { style.backgroundColor = color }
      return with(.init(style: style)) {
         addSubview($0)
//         let y: CGFloat = self.frame.size.height / 4 * 2
         $0.frame = ModalButton.initFrame.rect
         $0.layer?.cornerRadius = ModalButton.initFrame.fillet
//         btn.applyAnchorAndSize(to: self, width: 80, height: 80, align: .centerCenter, alignTo: .topCenter, offset: .init(x: 0, y: y) )
//         $0.anchorAndSize(to: self, width: 100, height: 24, align: .topLeft, alignTo: .topLeft)
//         $0.upInsideCallBack = {Swift.print("upinside")}
      }
   }
   /**
    * Creates the Prompt Button
    */
   func createPromptButton() -> DismissButton {
      // Fixme: ⚠️️ use with
      //text: ), frame:
      Swift.print("DismissButton.revealed:  \(DismissButton.revealed.size)")
      Swift.print("DismissButton.revealed.origin:  \(DismissButton.revealed.origin)")
      return with(.init(text: "Dismiss", style: TextButton.defaultTextButtonStyle)) {
         addSubview($0)
         $0.frame = DismissButton.hidden
//         $0.anchorAndSize(to: self, height: 60, align: .bottomCenter, alignTo: .bottomCenter, offset: .init(x: 0, y: -20), sizeOffset: .init(width: -40, height: 0) )
         $0.upInsideCallBack = onDismissButtonClick
      }
   }
}
