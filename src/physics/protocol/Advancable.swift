import Foundation
/**
 * Protocol for the Advancer
 */
public protocol Advancable {
   static func + (lhs: Self, rhs: Self) -> Self
   static func - (lhs: Self, rhs: Self) -> Self
   static func * (lhs: Self, rhs: Self) -> Self
   static var defaults: AnimState<Self> { get } // fixme: ⚠️️ Rename to deafultState
   static var defaultEasing: Self { get }
   static var defaultSpring: Springer<Self>.Config { get }
//   static var defaultSpringConfig: Self { get }
   func isNear( value: Self, epsilon: Self) -> Bool
}
