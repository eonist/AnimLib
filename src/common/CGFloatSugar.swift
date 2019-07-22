import Foundation

extension CGFloat {
   func isNear(_ value: CGFloat, _ epsilon: CGFloat = 10e-12) -> Bool {
      return Swift.abs(self - value) <= epsilon
   }
}
