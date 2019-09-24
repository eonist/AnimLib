import Cocoa
/**
 * Helper
 * - Fixme: ⚠️️ move to common etc, NSWindow+Extension etc
 */
extension NSWindow {
   /**
    * Returns window contentview frame (Convenient way to get content rect)
    */
   public static var winContentFrame: CGRect {
      let win: NSWindow = NSApp.windows.first!
      return NSWindow.contentRect(forFrameRect: win.frame, styleMask: win.styleMask)
   }
}
