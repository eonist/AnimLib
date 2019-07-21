import Foundation
/**
 * - Abstract: This class is in charge of moving things around when doing physics based animation
 * - Note: The Advancable protocol makes this class able to manipulate multiple values at once
 * - Note: The FrameTick and the InitValues typaliases are the same in Springer and Easer so we just reuse them
 * - Note: This is the Base class
 * - Fixme: ⚠️️ Maybe make a base class for Easer and Springer that they both can extend? that way you could change between them on a whim
 * - Fixme: ⚠️️ Rename to Advancer ?
 */
class Easer5<T: Advancable5>: FrameAnimator2, PhysicsAnimKind5 {
    var easing: T // This can be customized by setting the value but not via init
    var state: AnimState5<T>
    var onFrame: FrameTickSignature // Fixme: ⚠️️ rename to onFrameTick, onFrameCallback?
    var onComplete: OnComplete = {} // add external onComplete closures when needed
//    var updatePos:(()->Void) = {_ in} // might have to make this lazy
    init(state: AnimState5<T>, easing: T, onFrame:@escaping FrameTickSignature) {
        self.state = state
        self.easing = easing
        self.onFrame = onFrame
        super.init()
//        self.updatePos = updatePosition
    }
}
