import Foundation
/**
 * This class exists so that Springer and Easer can have fewer vars, by instead accessing vars through getters and setters that derive their values from tuples
 * - Fixme: ⚠️️ Rename initValues to config, as initvalues could indicate the start values, which it is not
 * - Fixme: ⚠️️ Consider using other names from regex proposal
 * - Fixme: ⚠️️ Try to get rid of the :class by making the var's mutable somehow
 */
public protocol PhysicsAnimKind: AnyObject, FrameAnimatable {
   associatedtype T: Advancable
   typealias FrameTickSignature = (T) -> Void // generic call back signature, use Spring.FrameTick outside this class
   var state: AnimState<T> { get set }
   var onFrame: (T) -> Void { get set } // The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure
}
/**
 * Getters and setters for easier access to state
 */
extension PhysicsAnimKind {
   /**
    * Remark: we return self because its convenient when chaining
    * ## Examples:
    * animator.setTargetValue(yOffset).start()
    */
   public func setTargetValue(_ targetValue: T) -> Self { // Fixme: ⚠️️ rename to setTarget ?
      self.targetValue = targetValue
      return self // Enables chaining
   }
}
