import Foundation

extension CGSize {
   /**
    * isNear
    */
   func isNear(_ p: CGSize, _ epsilon: CGFloat = 10e-12) -> Bool {
      return self.width.isNear(p.width, epsilon) && self.height.isNear(p.height, epsilon)
   }
   public func interpolate(_ to:CGSize, _ scalar:CGFloat) -> CGSize{/*Convenience*/
      return CGSize(width: self.width.interpolate(to.width, scalar), height: self.height.interpolate(to.height, scalar))
   }
}
func + (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width + b.width, height: a.height + b.height) }
func - (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width - b.width, height: a.height - b.height) }
func * (a: CGSize, b: CGSize) -> CGSize { return CGSize(width: a.width * b.width, height: a.height * b.height) }
