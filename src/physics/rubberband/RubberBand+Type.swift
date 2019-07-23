import Foundation

extension RubberBand {
   /**
    * This is the RubberBand config Signature
    * - Parameter Friction: Degrades the velocity over time utill stop
    * - Parameter epsilon: When the velocity is bellow this value stop the animation
    */
   typealias Config = (
      friction: CGFloat,
      springEasing: CGFloat,
      spring: CGFloat,
      limit: CGFloat,
      epsilon: CGFloat
   )
   /**
    * This is the Frame Signature, basically: (y, height) or (x, width) So that the springsolve can support horizontal and vertical orientation, but what about z?
    * - Parameter min: Basically topMargin when vertical, or leftMargin when horizontal
    * - Prameter len: Basically height when vertical or width when horizontal
    */
   typealias Frame = (
      min: CGFloat,
      len: CGFloat
   )
}
