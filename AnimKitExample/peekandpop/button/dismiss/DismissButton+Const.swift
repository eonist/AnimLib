import Foundation

extension DismissButton {
   /**
    * Hidden state (bellow vissible view)
    */
   static let hidden: CGRect = {
      let size: CGSize = .init(width: ModalButton.expandedFrame.size.width, height: 45)
      let p: CGPoint = .init(x: (WinRect.size.width / 2) - (size.width / 2), y: ModalButton.winContentFrame.size.height)
      return .init(origin: p, size: size)
   }()
   /**
    * Revealed state (just above the bottom)
    */
   static let revealed: CGRect = { // the limit of where promptButton can go vertically
      let size: CGSize = hidden.size
      let p: CGPoint = .init(x: hidden.origin.x, y: (hidden.origin.y) - hidden.height - 20)
      return .init(origin: p, size: size)
   }()
}
