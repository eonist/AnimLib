import UIKit
/**
 * This Class makes it easier to work with ForceTouch events
 */
extension ForceTouchButton {
   /**
    * Calculates the entire range of the stage pressures
    * P: curPressure 0-6.666
    * p: maxPressure 6.666
    */
   public static func linearPressure(currentPressure: CGFloat, maxpressure: CGFloat) -> CGFloat {
      return maxpressure / currentPressure
   }
   /**
    * Returns forceTouchStage
    */
   public static func forceStage(linearPreassure: CGFloat) -> ForceTouchStage {
      if linearPreassure > 0 && linearPreassure <= 0.25 {
         return .clickDown
      } else if linearPreassure >  0.25 && linearPreassure <= 0.5 {
         return .deepClickDown
      } else if linearPreassure >  0.5 && linearPreassure <= 0.75 {
         return .clickUp
      } else /* linearPreassure >  0.75 && linearPreassure <= 1.0*/ {
         return .deepClickUp
      }
   }
}
extension UITouch {
   /**
    * Override touchesMoved, touchesBegan and call this var
    */
   public var forceTouch: ForceTouchButton.ForceTouch {
      let linearPressure: CGFloat = ForceTouchButton.linearPressure(currentPressure: self.force, maxpressure: self.maximumPossibleForce)
      let forceStage: ForceTouchButton.ForceTouchStage = ForceTouchButton.forceStage(linearPreassure: linearPressure)
      return (linearPressure, forceStage)
   }
}
/**
 * Enum, type
 */
extension ForceTouchButton {
   public typealias ForceTouch = (linearPressure: CGFloat, forceStage: ForceTouchButton.ForceTouchStage)
   public enum ForceTouchStage: Int {
//      case none
      case clickDown // from noStage to clickStage
      case deepClickDown // from clickStage to deepClickStage
      case clickUp // from clickStage to noStage
      case deepClickUp // from deepStage to clickStage
   }
}

//      if( traitCollection.forceTouchCapability == .available) {
//         registerForPreviewing(with: self, sourceView: self)
//      }
