import Foundation
/**
 * Creates the displacement friction effect. Like you finger is slightly losing its grip
 * - Remark: USed by RubberBand springsolver class
 */
class CustomFriction {
    /**
     * - Note: The limit is the point where the value almost doesn't move at all
     * - Note: This metod also works with negative values. Just make sure that both the value and the limit are negative.
     * - Note: value ranges from 0 to 100, then limit should be 100, if value ranges from 0 to -100 then limit should be -100
     * - Note: You need to use correct ranges of values in order for this to work. Think relative values
     * - Note: The idea is that when value approches the limit it gets constrained. so if your value is 80 and limit is 100, the it will return something like 64, if both value and limit are 100 then it will return somthing like 69 etc
     */
    static func constrainedValueWithLog10(_ value: CGFloat, _ limit: CGFloat) -> CGFloat {
        let multiplier = log10(1.0 + value / limit)
        return limit * multiplier
    }
    /**
     * - Note: If you decrease the decimal variable you increase the friction effect
     * - Note: works similar to log10
     */
    static func constrainedValue(_ value: CGFloat, _ limit: CGFloat) -> CGFloat {
        let multiplier = 0.2 * (value / limit)
        return limit * multiplier
    }
}
