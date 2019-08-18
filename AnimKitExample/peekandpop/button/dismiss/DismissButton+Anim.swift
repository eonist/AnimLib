import Foundation

extension DismissButton {
   /**
    * onFrameTick
    */
   func onFrameTick(value: CGFloat) {
      self.frame.origin.y = value // We only want to animate the Y position
   }
}
