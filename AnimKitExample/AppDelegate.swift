import Cocoa
import AnimKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   /**
    * Creates the view
    */
   lazy var view: NSView = createView()
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      _ = view
   }
}

extension AppDelegate {
   /**
    * createView
    */
   func createView() -> NSView {
      window.setFrame(.init(origin: window.frame.origin, size: WinRect.size), display: true)
      let contentRect = window.contentRect(forFrameRect: window.frame) // size of win sans titleBar
//      let view:NSView = View(frame: contentRect)
//      let view:NSView = ElasticTestView(frame: contentRect)
      let view: NSView = PeekAndPopView.shared
      view.frame = contentRect
      window.contentView = view
      view.layer?.backgroundColor = NSColor.yellow.cgColor
      return view
   }
}
