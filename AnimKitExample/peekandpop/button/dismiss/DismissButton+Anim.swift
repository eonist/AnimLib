import Foundation

extension DismissButton {
   /**
    * onFrameTick
    */
   func onFrameTick(value: CGFloat) {
      self.frame.origin.y = value
   }
}
