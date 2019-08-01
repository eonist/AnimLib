import Foundation

public class ElasticEaser2<T: Advancable>: Easer<RoundedRect> {
   public var direct: Bool = false
   public typealias Frame = (min: CGFloat, len: CGFloat) // Fixme:⚠️️ rename to  boundries
   var maskFrame: Frame // Represents the visible part of the content
   var limit: CGFloat = 200
   //var result:AnimState5<T> // Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside
   public init(state: AnimState<RoundedRect> = RoundedRect.defaults, easing: RoundedRect = RoundedRect.defaultEasing, maskFrame: Frame, onFrame:@escaping FrameTickSignature) {
      //self.result = state//set init result
      self.maskFrame = maskFrame
      //(state, easing, onFrame)
      super.init(state, easing, onFrame)
   }
   /**
    * updatePosition
    * Fixme: ⚠️️ Rename to update value
    */
   override func updatePosition() {
//      Swift.print("updatePosition: contentFrame.len: \(contentFrame.len) maskFrame.len: \(maskFrame.len)")
      if direct {
         if targetValue.origin.y < maskFrame.min { // applyTopBoundary
            applyTopBoundary()
         } else if targetValue.origin.y + targetValue.size.height > maskFrame.len { // applyBottomBoundary
            applyBottomBoundary()
         } else { // apply no boundry
            super.updatePosition()
         }
      } else {
         super.updatePosition()
      }
   }
}
