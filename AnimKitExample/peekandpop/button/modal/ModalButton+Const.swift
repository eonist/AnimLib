import Cocoa
import Hybrid_macOS
import Spatial_macOS
import AnimKit
import With_mac
/**
 * Constants
 */
extension ModalButton {
   static let margin: CGFloat = 80
}
/**
 * Frame
 * - Fixme: ⚠️️ Maybe put inside an enum? Enum Const {} etc ?
 */
extension ModalButton {
   static let radius: CGFloat = 100 // the button radius
   static let initial: RoundedRect = .init(rect: .init(x: 0, y: 0, width: radius, height: radius), fillet: 20)
}
/**
 * State
 */
extension ModalButton {
   /**
    * idle state
    */
   var idle: RoundedRect {
      let fillet: CGFloat = design.idleFrame.width / 2
      return .init(rect: design.idleFrame, fillet: fillet)
   }
   /**
    * Click state
    */
   var click: RoundedRect {
      let offset: CGFloat = 20
      let size: CGSize = .init(width: ModalButton.initial.rect.width + offset, height: ModalButton.initial.rect.height + offset)
      let x: CGFloat = design.idleFrame.origin.x - offset / 2 // winFrame.size.width / 2 - size.width / 2//self.design.idle//
      let y: CGFloat = design.idleFrame.origin.y - offset / 2 // winFrame.size.height / 2 - size.height / 2
      let rect: CGRect = .init(origin: .init(x: x, y: y), size: size)
      let fillet: CGFloat = 20 // size.width / 2
      return .init(rect: rect, fillet: fillet)
   }
   /**
    * Expanded
    */
   static var expanded: RoundedRect {
      let winFrame: CGRect = ModalButton.winContentFrame
      let size: CGSize = .init(width: winFrame.size.width - 80, height: winFrame.size.height - 100)
      let x: CGFloat = winFrame.size.width / 2 - size.width / 2
      let y: CGFloat = winFrame.size.height / 2 - size.height / 2
      let rect: CGRect = .init(origin: .init(x: x, y: y), size: size)
      let fillet: CGFloat = 20
      return .init(rect: rect, fillet: fillet)
   }
}
/**
 * Helper
 * - Fixme: ⚠️️ move to common etc, NSWindow+Extension etc
 */
extension ModalButton {
   /**
    * Returns window contentview frame (Convenient way to get content rect)
    */
   public static var winContentFrame: CGRect {
      let win: NSWindow = NSApp.windows.first!
      return NSWindow.contentRect(forFrameRect: win.frame, styleMask: win.styleMask)
   }
}
/**
 * Style
 */
extension ModalButton {
   /**
    * Style for modal button
    */
   static func modalButtonStyle(design: Design) -> Button.Style {
      return with(Button.defaultStyle) {
         $0.borderWidth = 0
         $0.borderColor = .clear
         if let color = design.idleColor { $0.backgroundColor = color }
      }
   }
}
