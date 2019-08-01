import Foundation

extension ElasticEaser2 {
   /**
    * When the min val reaches beyond max
    * - Parameter direct: toggles the directManipulation mode
    */
   func applyTopBoundary() { // Surface is slipping the further you pull
            Swift.print("applyTopBoundary")
      if direct { // surface is slipping the further you pull
         let distToGoal: CGFloat = targetValue.origin.y
         let constrainedValue: CGFloat = CustomFriction.constrainedValueWithLog10(distToGoal, -limit) // <--Creates the illusion that the surface under the thumb is slipping
         //Swift.print("constrainedValue: " + "\(constrainedValue)")
         value.origin.y = constrainedValue
      }
   }
   /**
    * When the max val reaches beyond the min
    * - Parameter direct: toggles the directManipulation mode
    */
   func applyBottomBoundary() {
            Swift.print("applyBottomBoundary")
      if direct { //surface is slipping the further you pull
         let totLen = targetValue.size.height - maskFrame.len //tot length of items - length of mask
         //         Swift.print("totLen:  \(totLen)")
         let normalizedValue: CGFloat = totLen + targetValue.origin.y // goes from 0 to -100
         //         Swift.print("normalizedValue:  \(normalizedValue)")
         let constrainedValue: CGFloat = CustomFriction.constrainedValueWithLog10(normalizedValue, limit)// <--Creates the illusion that the surface under the thumb is slipping
         //         Swift.print("constrainedValue:  \(constrainedValue)")
         let valueY = -totLen + constrainedValue
         //         Swift.print("valueY:  \(valueY)")
         value.origin.y = valueY
      }
   }
}
