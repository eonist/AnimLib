import Cocoa

class DepthParser {
   /**
    * Returns the front most view
    * - Fixme: ⚠️️ make this T where T is NSView etc
    */
   public static func frontMostView(views: [NSView]) -> NSView? {
      return views.sorted(by: { $0.superview?.subviews.firstIndex(of: $0) ?? 0 > $1.superview?.subviews.firstIndex(of: $1) ?? 0 }).first
   }
   /**
    * Return the front most view
    * - Fixme: ⚠️️ make this T where T is NSView etc
    */
   public static func frontMostView(parent: NSView) -> NSView? {
      return DepthParser.frontMostView(views: parent.subviews)
   }
}
