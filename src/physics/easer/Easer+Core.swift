/**
 * Core
 */
extension Easer {
   /**
    * The value will never be absolute, so we use epsilon to determine if it's close enough
    * - Fixme: ⚠️️ Rename to hasStopped
    */
   var assertStop: Bool {
      return state.velocity.isNear(value: stopVelocity, epsilon: epsilon)
   }
}
