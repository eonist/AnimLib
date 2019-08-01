import Cocoa
import AnimKit
import Hybrid_macOS

open class ElasticTestView: NSView {
   override open var isFlipped: Bool { return true } /* TopLeft orientation */
   var onDownYOffset: CGFloat = 0
   lazy var thumb: Thumb = createThumb()
   lazy var animator: ElasticEaser<CGFloat> = createAnimator()
//   lazy var rubberband: RubberBand = createRubberBand()
   override public init(frame: CGRect) {
      super.init(frame: frame)
//      Swift.print("Hello world")
      self.wantsLayer = true /* if true then view is layer backed */
      _ = thumb
//      _ = animator
      //      testAnimation()
      //      zoomBackAndForthAnimTest()
      //      easer4Test()
      //      springer4Test()
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
