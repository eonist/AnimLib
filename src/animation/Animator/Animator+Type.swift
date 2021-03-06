import Foundation
/**
 * Type
 */
extension Animator {
   public typealias Completed = () -> Void
   /**
    * Signature for initValues
    * - Parameters:
    *   - dur: the seconds you want the animation to last
    *   - from: from which value you want the animation to start from
    *   - to: the end value you want to modulate to
    */
   public typealias InitValues = (dur: CGFloat, from: CGFloat, to: CGFloat)
}
// Fixme: ⚠️️ Possibly move this into a different scope
public typealias FrameTick = (CGFloat) -> Void // the callBack signature for onFrame ticks
