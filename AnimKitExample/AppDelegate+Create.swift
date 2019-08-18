import Cocoa
import AnimKit
/**
 * Create
 */
extension AppDelegate {
   /**
    * createView
    */
   func createView() -> NSView {
      window.setFrame(.init(origin: window.frame.origin, size: WinRect.size), display: true)
      let contentRect = window.contentRect(forFrameRect: window.frame) // size of win sans titleBar
      //let view:NSView = View(frame: contentRect)
      //let view:NSView = ElasticTestView(frame: contentRect)
      let view: NSView = PeekAndPopView.shared
      view.frame = contentRect
      window.contentView = view
      return view
   }
}
