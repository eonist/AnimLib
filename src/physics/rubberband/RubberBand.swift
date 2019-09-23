import Foundation
/**
 * - Note: friction: This value is the strength of the friction when the item is floating freely
 * - Note: springEasing: the easeOut effect on the spring (also known as the dampener)
 * - Note: spring: the strength of the spring
 * - Note: limit: the max distance the displacement friction like the effect can travle, the vertical limit is the distance where the value almost doesn't move at all while directly manipulating,the illusion that the surface under the thumb is slipping
 * - Note: epsilon: twips 20th of a pixel
 * - Note: this rubberBand tween is cheating a bit. The perfect way to implement this would be to add a half circle easing curve
 * - Note: I think essentialy this is a SpringSolver. You can find an example of the SpringSolvers in programing books and also in the facebook pop lib
 * - Parameter maskRect: represents the visible part of the content
 * - Parameter contentRect: represents the total size of the content
 * - Fixme: ⚠️️ Rename to ElasticSpringSolver? or ElasticBand? ElasticSpring? Elastic?
 * - Fixme: ⚠️️ Integrate temp values inside rubberband or make a tempvalue struct
 * - Fixme: ⚠️️ Maybe rename to Elastic or SpringSolver
 */
public class RubberBand: Mover {
   // Initial values
   var maskFrame: Frame // Fixme: ⚠️️ group maskFrame and contentFrame?
   var contentFrame: Frame
   var config: Config
   // Interim values
   var result: CGFloat = 0 // Output value, this is the value that external callers can use, it's the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside
   var hasStopped: Bool = true // Indicates that the motion has stopped //Fixme: ⚠️️ try to move this into the mover
   /**
    * - Parameters:
    *   - callBack: Called on every FPS tick
    *   - maskFrame: Represents the visible part of the content
    *   - contentFrame: Represents the total size of the content
    *   - config: Contains the configuration of the elastic effect (friction, springyness, limit etc)
    * ## Examples:
    * .init(thumbFrameAnim,(min: self.frame.origin.y, len: self.frame.size.height),(min: self.frame.origin.y, len: 100),RubberBand.defaultConfig)
    */
   public init(_ callBack:@escaping FrameTick, _ maskFrame: Frame, _ contentFrame: Frame, _ config: Config = RubberBand.defaultConfig) {
      self.maskFrame = maskFrame
      self.contentFrame = contentFrame
      self.config = config
      super.init(AnimProxy.shared, callBack, 0, 0)
   }
}
