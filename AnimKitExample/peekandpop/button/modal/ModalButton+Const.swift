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
   static var initFrame: RoundedRect {
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
   static var clickFrame: RoundedRect {
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
   static var expandedFrame: RoundedRect {
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
    * returns window contentview frame
    */
   public static var winContentFrame: CGRect {
      let win: NSWindow = NSApp.windows.first!
      return NSWindow.contentRect(forFrameRect: win.frame, styleMask: win.styleMask)
   }
}
