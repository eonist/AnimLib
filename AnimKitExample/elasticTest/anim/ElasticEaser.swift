import Foundation
/**
 * NOTE: Another name for this could be: RubberBand or ConstrainedEaser
 * Fixme: ⚠️️ maskFrame.y must be 0 . until you add support for it to be a value > 0 or < 0
 * Fixme: ⚠️️ USe T type ?
 */
public class ElasticEaser<T: Advancable>: Easer<CGFloat> {
   public var direct: Bool = false
   public typealias Frame = (min: CGFloat, len: CGFloat) // Fixme:⚠️️ rename to  boundries
   var maskFrame: Frame // Represents the visible part of the content
   var contentFrame: Frame // Represents the total size of the content
   var limit: CGFloat = 200
   //var result:AnimState5<T> // Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside
   public init(state: AnimState<CGFloat> = CGFloat.defaults, easing: CGFloat = CGFloat.defaultEasing, contentFrame: Frame, maskFrame: Frame, onFrame:@escaping FrameTickSignature) {
      //self.result = state//set init result
      self.contentFrame = contentFrame
      self.maskFrame = maskFrame
      //(state, easing, onFrame)
      super.init(state, easing, onFrame)
   }
   /**
    * updatePosition
    * Fixme: ⚠️️ Rename to update value
    */
   override func updatePosition() {
      if direct {
         if targetValue < maskFrame.min { // applyTopBoundary
            applyTopBoundary()
         } else if targetValue + contentFrame.len > maskFrame.len { // applyBottomBoundary
            applyBottomBoundary()
         } else { // apply no boundry
            super.updatePosition()
         }
      } else {
         super.updatePosition()
      }
   }
}
