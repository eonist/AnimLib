import Foundation
/**
 * Protocol for the Advancer
 */
public protocol Advancable {
   static func + (lhs: Self, rhs: Self) -> Self
   static func - (lhs: Self, rhs: Self) -> Self
   static func * (lhs: Self, rhs: Self) -> Self
   static var defaults: AnimState<Self> { get }
   static var defaultEasing: Self { get }
   func isNear( value: Self, epsilon: Self) -> Bool
}
