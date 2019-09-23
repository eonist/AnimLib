import Foundation
/**
 * - Fixme: ⚠️️ This protocol might not be needed
 * - Fixme: ⚠️️ Rename stopped to hasStopped
 */
public protocol FrameAnimatable {
    var animProxy: AnimProxyKind { get } // Access to singelton instance
    func start() // Start animation
    func stop() // Stop animation
    var stopped: Bool { get } // Assert if this animation has stopped or not
}
