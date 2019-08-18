import Foundation
import Spatial_macOS
import With_mac
import Hybrid_macOS

extension PeekAndPopView {
   /**
    * first Btn
    */
   func createFirstButton() -> ModalButton {
      let frame: CGRect = {
         let size = ModalButton.initial.rect.size
         let alignmentPoint = Align.alignmentPoint(size, canvasSize: ModalButton.winContentFrame.size, canvasAlign: .topCenter, objectAlign: .topCenter, offset: .init(x: 0, y: 60))
         return .init(origin: alignmentPoint, size: size)
      }()
      let design: ModalButton.Design = (.eye, Colors.Initial.first.color, frame)
      return with(.init(design: design)) {
         addSubview($0)
      }
   }
   //Autolayout code
//         btn.applyAnchorAndSize(to: self, width: 80, height: 80, align: .centerCenter, alignTo: .topCenter, offset: .init(x: 0, y: y) )
//         $0.anchorAndSize(to: self, width: 100, height: 24, align: .topLeft, alignTo: .topLeft)
//         $0.upInsideCallBack = {Swift.print("upinside")}
   /**
    * Second button
    */
   func createSecondButton() -> ModalButton {
      let frame: CGRect = {
         let size = ModalButton.initial.rect.size
         let alignmentPoint = Align.alignmentPoint(size, canvasSize: ModalButton.winContentFrame.size, canvasAlign: .centerCenter, objectAlign: .centerCenter, offset: .init(x: 0, y: 0))
         return .init(origin: alignmentPoint, size: size)
      }()
      let design: ModalButton.Design = (.bolt, Colors.Initial.second.color, frame)
      return with(.init(design: design)) {
         addSubview($0)
      }
   }
   /**
    * Third button
    */
   func createThirdButton() -> ModalButton {
      let frame: CGRect = {
         let size = ModalButton.initial.rect.size
         let alignmentPoint = Align.alignmentPoint(size, canvasSize: ModalButton.winContentFrame.size, canvasAlign: .bottomCenter, objectAlign: .bottomCenter, offset: .init(x: 0, y: -60))
         return .init(origin: alignmentPoint, size: size)
      }()
      let design: ModalButton.Design = (.calculator, Colors.Initial.third.color, frame)
      return with(.init(design: design)) {
         addSubview($0)
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
