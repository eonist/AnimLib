import Foundation
import AnimKit
import Hybrid_macOS

extension ElasticTestView {
   /**
    * Elastic test
    */
   func createThumb() -> Thumb {
      let rect: CGRect = .init(origin: .init(x: 0, y: 40), size: .init(width: 100, height: self.frame.height - 80))
      let box: Thumb = .init(frame: rect)
      box.caLayer?.backgroundColor = Color.black.cgColor
      box.onMove = self.onMove
      box.onDown = self.onDown
//      box.
//      box.wantsLayer = true
//      box.layer?.backgroundColor = NSColor.orange.cgColor
      addSubview(box)
      return box
//      let animator: Animator = .init()
//      animator.onFrame = { progress in Swift.print("onFrame"); disableAnim { box.frame.origin.x = 100 * progress } }
//      animator.completed = { Swift.print("Animation completed ✅") }
//      animator.start()
   }
   /**
    * Creates animator
    */
   func createAnimator() -> ElasticEaser<CGFloat> {
      Swift.print("createAnimator.self.frame:  \(self.frame)")
      let initAnimState: AnimState = .init(value: thumb.frame.origin.y, targetValue: thumb.frame.origin.y, velocity: 0, stopVelocity: 0, epsilon: 0.002)
      return .init(state: initAnimState,
                   easing: 0.4,
                   contentFrame: (min: thumb.frame.origin.y, len: thumb.frame.height),
                   maskFrame: (min: self.frame.origin.y, len: self.frame.size.height),
                   onFrame: self.thumbFrameAnim)
   }
   /**
    * Create rubberband
    */
   func createRubberBand() -> RubberBand {
      return .init(thumbFrameAnim,
                   (min: self.frame.origin.y, len: self.frame.size.height),
                   (min: self.frame.origin.y, len: 100),
                   RubberBand.defaultConfig)
   }
   //ProtoTypeView.Constraint.mask
}
//static let mask:ElasticEaser5.Frame = (WinRect.point.y,WinRect.size.h)
//static let content:ElasticEaser5.Frame = (Modal.expanded.y,Modal.expanded.h)
