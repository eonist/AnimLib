import Foundation
/**
 * Access
 */
extension RubberBand {
   var friction: CGFloat { return config.friction }
   var springEasing: CGFloat { return config.springEasing }
   var spring: CGFloat { return config.spring }
   var limit: CGFloat { return config.limit }
   var epsilon: CGFloat { return config.epsilon }
}
