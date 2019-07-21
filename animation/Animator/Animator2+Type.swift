import Foundation
/**
 * Type
 */
extension Animator2 {
    typealias Completed = () -> Void
    /**
     * Signature for initValues
     * - Parameter dur: the seconds you want the animation to last
     * - Parameter from: from which value you want the animation to start from
     * - Parameter to: the end value you want to modulate to
     */
    typealias InitValues = (dur: CGFloat, from: CGFloat, to: CGFloat)
}
