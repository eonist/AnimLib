import Foundation
import AnimKit

extension View {
   /**
    * Springer4 tests
    */
   func springer4Test() {
      _ = {
         let animator = Springer<CGFloat> { print("val: " + "\($0)") }
         animator.targetValue = 100
         animator.start()
      }()
      _ = {
         let animator = Springer<CGPoint> { print("val: " + "\($0)") }
         animator.targetValue = CGPoint(x: 100, y: 100)
         animator.start()
      }
   }
}
