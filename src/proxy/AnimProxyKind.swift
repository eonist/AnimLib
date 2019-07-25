import Foundation
/**
 * Fixme: ⚠️️ This protocol may not even be needed as you don't extend AnimProxy
 */
public protocol AnimProxyKind: AnyObject {
   func onFrame()
   var animators: [FrameAnimator] { get set }
   var displayLink: DisplayLink { get }
}
