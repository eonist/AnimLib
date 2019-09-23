#if os(iOS)
import UIKit
public typealias DisplayLink = CADisplayLink
#elseif os(macOS)
import Cocoa
public typealias DisplayLink = CVDisplayLink
#endif
