#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

#if os(iOS)
public typealias DisplayLink = CADisplayLink
#elseif os(macOS)
public typealias DisplayLink = CVDisplayLink
#endif
