import Foundation

extension RubberBand{
   /**
    * - Abstract: When the min val reaches beyond max
    * - Parameter direct: toggles the directManipulation mode
    */
   func applyTopBoundary(_ direct: Bool){/*Surface is slipping the further you pull*/
      let distToGoal: CGFloat = value - maskFrame.min
      if direct { // surface is slipping the further you pull
         result = maskFrame.min + CustomFriction.constrainedValueWithLog10(distToGoal,limit - maskFrame.min /*topMargin*/)//<--Creates the illusion that the surface under the thumb is slipping
      } else { // Springs back to limit
         velocity -= (distToGoal * spring)
         velocity *= springEasing // Fixme: ⚠️️ try to apply log10 instead of the regular easing
         value += velocity
         if value.isNear(maskFrame.min, 1) { checkForStop(direct) }
         result = value
      }
   }
   /**
    * - Abstract: When the max val reaches beyond the min
    * - Parameter direct: toggles the directManipulation mode
    */
   func applyBottomBoundary(_ direct: Bool) {
      if direct { // surface is slipping the further you pull
         let totLen: CGFloat = contentFrame.len - maskFrame.len // tot length of items - length of mask
         let normalizedValue: CGFloat = totLen + value // goes from 0 to -100
         result = -totLen + CustomFriction.constrainedValueWithLog10(normalizedValue,-limit)//<--Creates the illusion that the surface under the thumb is slipping
      } else { // Springs back to limit
         let dist = maskFrame.len - (value + contentFrame.len) // distanceToGoal
         velocity += (dist * spring)
         velocity *= springEasing
         value += velocity
         if dist.isNear(0, 1) { checkForStop(direct) }/*Checks if dist is near 0, with an epsilon of 1px*/
         result = value
      }
   }
   /**
    * When velocity is less than epsilon basically less than half of a twib 0.15. then set the hasStopped flag to true
    * - Note: Basically stops listening for the onFrame event
    * - Paramter direct: toggles the directManipulation mode
    */
   func checkForStop(_ direct: Bool) {
      if !direct && velocity.isNear(0, epsilon) {
         velocity = 0 // ⚠️️ quick fix, may break things, was added to be able to detect anim stop on bounce-back complete
         hasStopped = true
      }
   }
}
