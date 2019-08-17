import Cocoa
import AnimKit
/**
 * Frame
 * - Fixme: Maybe put inside an enum? Enum Const {} etc ?
 */
extension ModalButton {
   /**
    * - Fixme: ⚠️️ maybe rename to idle
    */
   static var initial: RoundedRect {
      let winFrame: CGRect = ModalButton.winContentFrame
      let size: CGSize = .init(width: 80, height: 80)
      let x: CGFloat = winFrame.size.width / 2 - size.width / 2
      let y: CGFloat = winFrame.size.height / 2 - size.height / 2
      let rect: CGRect = .init(origin: .init(x: x, y: y), size: size)
      let fillet: CGFloat = size.width / 2
      return .init(rect: rect, fillet: fillet)
   }
   /**
    * Fixme: ⚠️️ Rename to click
    */
   static var click: RoundedRect {
      let winFrame: CGRect = ModalButton.winContentFrame
      let size: CGSize = .init(width: 80 * 1.25, height: 80 * 1.25)
      let x: CGFloat = winFrame.size.width / 2 - size.width / 2
      let y: CGFloat = winFrame.size.height / 2 - size.height / 2
      let rect: CGRect = .init(origin: .init(x: x, y: y), size: size)
      let fillet: CGFloat = 20//size.width / 2
      return .init(rect: rect, fillet: fillet)
   }
   /**
    * Fixme: ⚠️️ Rename to expanded
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
