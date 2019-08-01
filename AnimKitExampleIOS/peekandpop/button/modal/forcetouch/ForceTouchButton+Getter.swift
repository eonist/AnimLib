import UIKit
/**
 * This Class makes it easier to work with ForceTouch events
 */
extension ForceTouchButton {
   /**
    * - Remark: You override touchesMoved, touchesBegan and call this var
    */
   public var forceTouch: ForceTouch {
      let linearPressure: CGFloat = ForceTouchButton.linearPressure(currentPressure: self.force, maxpressure: self.maximumPossibleForce)
      let forceDepth: ForceTouchDepth = ForceTouchButton.forceStage(linearPreassure: linearPressure)
      return (linearPressure, forceDepth)
   }
   /**
    * Calculates the entire range of the stage pressures
    * P: curPressure 0-6.666
    * p: maxPressure 6.666
    */
   public static func linearPressure(currentPressure: CGFloat, maxpressure: CGFloat) -> CGFloat {
      return currentPressure / maxpressure
   }
   /**
    * Returns forceTouchDepth
    */
   public static func forceStage(linearPreassure: CGFloat) -> ForceTouchDepth {
      if linearPreassure >= 0 && linearPreassure <= 0.33 {
         return .idle
      } else if linearPreassure > 0.33 && linearPreassure <= 0.66 {
         return .click
      } else /*if linearPreassure >  0.66 && linearPreassure <= 1.0*/ {
         return .deepClick
      }
   }
   /**
    * Stage
    */
   func forceTouchStage(touches: Set<UITouch>) -> ForceTouchStage? {
      guard let forceTouch: ForceTouch = touches.first?.forceTouch else { return nil }
      //      Swift.print("forceTouch.linearPressure:  \(forceTouch.linearPressure)")
      //      Swift.print("forceTouch.forceDepth:  \(forceTouch.forceDepth)")
      let curDepth = forceTouch.forceDepth
      Swift.print("forceTouch.force:  \(touches.first?.force)")
      Swift.print("curDepth:  \(curDepth) forceTouch.linearPressure:  \(forceTouch.linearPressure)")
      if prevDepth != curDepth {
         //         Swift.print("switch")
         //         Swift.print("curDepth.rawValue:  \(curDepth.rawValue) prevDepth.rawValue:  \(prevDepth.rawValue)")
         switch (curDepth.rawValue, prevDepth.rawValue ) {
         case (0, 1):
            return .clickUp
         //            stageChange(curStage: .clickUp, prevDepth: prevDepth)
         case (1, 0):
            return .clickDown
         //            stageChange(curStage: .clickDown, prevDepth: prevDepth)
         case (1, 2):
            return .deepClickUp
         //            stageChange(curStage: .deepClickUp, prevDepth: prevDepth)
         case (2, 1):
            return .deepClickDown
         //            stageChange(curStage: .deepClickDown, prevDepth: prevDepth)
         default: break;//isn't possible
         }
         prevDepth = curDepth/*always set prevStage to curStage on stage change*/
      }
      return nil
   }
}
