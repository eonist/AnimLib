import Foundation

extension CGSize {
   /**
    * isNear
    */
   func isNear(_ p: CGSize, _ epsilon: CGFloat = 10e-12) -> Bool {
      return self.width.isNear(p.width, epsilon) && self.height.isNear(p.height, epsilon)
   }
}
func + (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width + b.width, height: a.height + b.height) }
func - (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width - b.width, height: a.height - b.height) }
func * (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width * b.width, height: a.height * b.height) }
