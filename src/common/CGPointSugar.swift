import Foundation

extension CGPoint {
   /**
    * isNear
    */
   func isNear(_ p: CGPoint, _ epsilon: CGFloat = 10e-12) -> Bool {
      return self.x.isNear(p.x, epsilon) && self.y.isNear(p.y, epsilon)
   }
}
func + (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x + b.x, y: a.y + b.y) } // Adds the coordinates of point p to the coordinates of this point to create a new point
func * (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x * b.x, y: a.y * b.y) } // Multiplies two CGPoint values and returns the result as a new CGPoint.
func - (a: CGPoint, b: CGPoint) -> CGPoint { return CGPoint(x: a.x - b.x, y: a.y - b.y) } // Subtracts the coordinates of point p from the coordinates of this point to create a new point.
