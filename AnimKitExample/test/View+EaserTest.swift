import Foundation
import AnimKit

extension View {
   /**
    * Easer4 tests
    */
   func easer4Test() {
      _ = {
         let animator = Easer<CGFloat>() { val in
            Swift.print("val: " + "\(val)")
         }
         animator.targetValue = 100
         animator.start()
      }
      _ = {
         let animator = Easer<CGPoint>() { val in
            Swift.print("val: " + "\(val)")
         }
         animator.targetValue = CGPoint(x:100, y:100)
         animator.start()
      }()
   }
}
//🏀 add examples to comment
