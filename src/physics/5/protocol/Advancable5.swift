import Foundation
/**
 * Protocol for the Advancer
 */
protocol Advancable5 { 
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static var defaults: AnimState5<Self> { get }
    func isNear( value: Self, epsilon: Self) -> Bool
}
