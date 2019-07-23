import Cocoa
/**
 * You can only setup 1 CVDisplayLink as such you can only have 1 AnimProxy class to controll it
 * - Abstract: This class is a singelton wrapper around CVDisplayLink
 * - Note: This view class serves as a basis for frame animation.
 * - Note: Override the onFrame method to do frame animations
 * - Note: Start and stop with CVDisplayLinkStart(displayLink) and CVDisplayLinkStop(displayLink) and CVDisplayLinkIsRunning(displayLink) to assert if the displayLink is running
 */
class AnimProxy: NSObject, AnimProxyKind { // Apparently the class needs to be NSView in order for the performSelector to work//<---TODO: ⚠️️ you can probably delete the IAnimatable, as nothing extends this class anyway
    static let shared = AnimProxy() // Singelton variable
    lazy var displayLink: CVDisplayLink = self.setUpDisplayLink() // This is the instance that enables frame animation, lazying this value will probably haunt me later, playing with fire
    lazy var animators: [FrameAnimator] = [] // Stores the animators
}
