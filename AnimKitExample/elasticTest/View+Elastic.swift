import Foundation
import AnimKit
import Hybrid_macOS

extension ElasticTestView {
   /**
    * Elastic test
    */
   func elasticTest() {
      let rect: CGRect = .init(origin: .zero, size: .init(width: 100, height: 100))
      let box: Thumb = .init(frame: rect)
      box.caLayer?.backgroundColor = Color.black.cgColor
      box.onMove = self.onMove
      addSubview(box)
   }
   func onMove(p: CGPoint) {
      Swift.print("p:  \(p)")
   }
}

//      let animator: Animator = .init()
//      animator.onFrame = { progress in Swift.print("onFrame"); disableAnim { box.frame.origin.x = 100 * progress } }
//      animator.completed = { Swift.print("Animation completed ✅") }
//      animator.start()
