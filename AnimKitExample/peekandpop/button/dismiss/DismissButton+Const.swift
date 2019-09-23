import Foundation

extension DismissButton {
   /**
    * Hidden state (bellow vissible view)
    * - Abstract: Basically the positioning state when the dismissbutton is hidden out of view
    */
   static let hidden: CGRect = {
      let size: CGSize = .init(width: ModalButton.expanded.size.width, height: 45)
      let p: CGPoint = .init(x: (WinRect.size.width / 2) - (size.width / 2), y: ModalButton.winContentFrame.size.height)
      return .init(origin: p, size: size)
   }()
   /**
    * Revealed state (just above the bottom)
    * - Description: the limit of where promptButton can go vertically
    * - Abstract: Basically the positioning state when the dismissbutton is shown
    */
   static let revealed: CGRect = {
      let size: CGSize = hidden.size
      let p: CGPoint = .init(x: hidden.origin.x, y: (hidden.origin.y) - hidden.height - 20)
      return .init(origin: p, size: size)
   }()
}
