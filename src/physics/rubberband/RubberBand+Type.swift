import Foundation

extension RubberBand {
   /**
    * This is the RubberBand config Signature
    * - Parameters:
    *   - Friction: Degrades the velocity over time utill stop
    *   - epsilon: When the velocity is bellow this value stop the animation
    */
   public typealias Config = (
      friction: CGFloat,
      springEasing: CGFloat,
      spring: CGFloat,
      limit: CGFloat,
      epsilon: CGFloat
   )
   /**
    * This is the Frame Signature, basically: (y, height) or (x, width) So that the springsolve can support horizontal and vertical orientation, but what about z?
    * - Parameters:
    *   - min: Basically topMargin when vertical, or leftMargin when horizontal
    *   - len: Basically height when vertical or width when horizontal
    */
   public typealias Frame = (
      min: CGFloat,
      len: CGFloat
   )
}
