import Foundation
import Spatial_macOS
import With_mac
import Hybrid_macOS

extension PeekAndPopView {
   /**
    * firstBtn
    */
   func createFirstButton() -> ModalButton {
      let style: Button.Style = with(Button.defaultStyle) {
         $0.borderWidth = 0
         $0.borderColor = .clear
         if let color = Colors.Initial.first.color { $0.backgroundColor = color }
      }
      return with(.init(style: style)) {
         addSubview($0)
//         let y: CGFloat = self.frame.size.height / 4 * 2
         $0.frame = ModalButton.initial.rect
         $0.layer?.cornerRadius = ModalButton.initial.fillet
//         btn.applyAnchorAndSize(to: self, width: 80, height: 80, align: .centerCenter, alignTo: .topCenter, offset: .init(x: 0, y: y) )
//         $0.anchorAndSize(to: self, width: 100, height: 24, align: .topLeft, alignTo: .topLeft)
//         $0.upInsideCallBack = {Swift.print("upinside")}
      }
   }
   /**
    * Creates the Prompt Button
    */
   func createPromptButton() -> DismissButton {
      let style: TextButton.TextButtonStyle = with(TextButton.defaultTextButtonStyle) {
         $0.borderWidth = 0
         $0.borderColor = .clear
         if let color = Colors.dismiss.color { $0.backgroundColor = color }
         if let color = Colors.Text.down.color { $0.textColor = color }
      }
      return with(.init(text: "Dismiss", style: style)) {
         addSubview($0)
         $0.frame = DismissButton.hidden
         $0.layer?.cornerRadius = DismissButton.hidden.height / 2
//         $0.anchorAndSize(to: self, height: 60, align: .bottomCenter, alignTo: .bottomCenter, offset: .init(x: 0, y: -20), sizeOffset: .init(width: -40, height: 0) )
         $0.upInsideCallBack = onDismissButtonClick
      }
   }
}
