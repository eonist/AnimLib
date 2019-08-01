import UIKit
/**
 * Enum, type
 */
extension ForceTouchButton {
   /**
    * Storage for linearPressure and forceDepth
    */
   public typealias ForceTouch = (linearPressure: CGFloat, forceDepth: ForceTouchButton.ForceTouchDepth)
   /**
    * Stages
    */
   public enum ForceTouchStage: Int {
      //      case none
      case clickDown // from noStage to clickStage
      case deepClickDown // from clickStage to deepClickStage
      case clickUp // from clickStage to noStage
      case deepClickUp // from deepStage to clickStage
   }
   public enum ForceTouchDepth: Int {
      case idle // all force before 0.33 of pressure
      case click // it has detected a click and is moving between 0.33 and 0.66 of pressure
      case deepClick // it has deteted a deep click and is moving between 0.66 and 1.0
   }
}
