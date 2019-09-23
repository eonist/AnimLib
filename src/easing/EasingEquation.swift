import Foundation
/**
 * - Parameters:
 *   - t: time (current frame) this can also be actual time
 *   - b: begin (the value it is at the begining)
 *   - c: change (end value - begining value) sort of the amount to change, this can also be described as the difference between two values
 *   - d: duration (total frames in anim) this can also be actual time
 * - Fixme: ⚠️️ Complete the: Elastic, Circular, Back, bounce, Quibic +++
 * - Note: robertpenner.com has lots of tutorials and pdfs on how easing works
 */
public typealias EasingEquation = (_ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat // Easing equation signature
