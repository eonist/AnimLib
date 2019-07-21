import Foundation

protocol FrameAnimatable2 {
    var animProxy: AnimProxyKind2 { get }
    func start()
    func stop()
    var stopped: Bool { get }
}
