import Foundation
/**
 * Makes it possible to create looping animations, n-loops or infinite-loops
 * - Note: use stop() to stop the animation if the animation is infinite, with n-loops the animation stops when the last repeat has run
 * - Note: we don't use structs as init values because structs look like this: SomeStruct(from:0...) bbut tupples + typealias looks simpler (from:0...) more like method args would
 * - Parameter duration: in seconds
 * - Parameter callBack: is the callback ref that is called on every "frame tick"
 */
class LoopAnimator: Animator {
    var repeatCount: Int // <--zero means infinite, not at the moment it seems
    var curRepeatCount: Int = 0
    init(initValues: LoopAnimator.InitLoopValues = LoopAnimator.initLoopValues, easing:@escaping EasingEquation = Easing.linear.ease, closure: @escaping FrameTick = { _ in }) {
        self.repeatCount = initValues.repeatCount
        super.init((initValues.duration, initValues.from, initValues.to), easing, closure)
    }
}
