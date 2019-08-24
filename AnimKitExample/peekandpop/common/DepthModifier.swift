import Cocoa

public class DepthModifier {
   /**
    * bring subView to the front in containerView
    * ## Examples:
    * bringSubviewToFront(parent:containerView, child: subView)
    */
   public static func bringSubviewToFront(parent: NSView, child: NSView) {
      var theView = child
      parent.sortSubviews({ viewA, viewB, rawPointer in
         let view = rawPointer?.load(as: NSView.self)
         switch view {
         case viewA:
            return ComparisonResult.orderedDescending
         case viewB:
            return ComparisonResult.orderedAscending
         default:
            return ComparisonResult.orderedSame
         }
      }, context: &theView)
   }
}
extension NSView {
   /**
    * bring subView to the front in containerView
    * ## Examples:
    * self.superView?.bringSubviewToFront(self)
    */
   public func bringSubviewToFront(_ view: NSView) {
      DepthModifier.bringSubviewToFront(parent: self, child: view)
   }
}
