import Foundation
/**
 * - Fixme: ⚠️️ This protocol might not be needed
 */
protocol FrameAnimatable2 {
    var animProxy: AnimProxyKind2 { get } // Access to singelton instance
    func start() // Start animation
    func stop() // Stop animation
	 // Fixme: ⚠️️ Rename to hasStopped
    var stopped: Bool { get } // Assert if this animation has stopped or not
}
