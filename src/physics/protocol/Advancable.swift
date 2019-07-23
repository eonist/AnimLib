import Foundation
/**
 * Protocol for the Advancer
 */
protocol Advancable { 
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static var defaults: AnimState<Self> { get }
    func isNear( value: Self, epsilon: Self) -> Bool
}
