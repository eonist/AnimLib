import Cocoa
/**
 * Fixme: ⚠️️ This should possibly be renamed to IAnimatableView, not relevant anymore i think
 * Fixme: ⚠️️ This protocol may not even be needed as you don't extend AnimProxy
 */
public protocol AnimProxyKind: AnyObject {
    func onFrame()
    var animators: [FrameAnimator] { get set }
    var displayLink: CVDisplayLink { get }
}
