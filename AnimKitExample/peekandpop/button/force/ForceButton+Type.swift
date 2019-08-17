import Cocoa
/**
 * Enum, type
 */
extension ForceButton {
   typealias StageSwitch = (_ stage: Int) -> Void
   typealias StageChange = (_ stage: Stage) -> Void
   typealias PressureChange = (_ linearPressure: CGFloat) -> Void
   static let defaultStageSwitch: StageSwitch = { stage in }
   static let defaultStageChange: StageChange = { stage in /*Swift.print("no call-back attached stage: \(stage)")*/ }
   static let defaultPressureChange: PressureChange = { linearPressure in /*Swift.print("no call-back attached linearPressure: \(linearPressure)")*/ }
   /**
    * Storage for linearPressure and forceDepth
    */
//   public typealias ForceTouch = (linearPressure: CGFloat, forceDepth: ForceTouchButton.ForceTouchDepth)
   /**
    * Stages
    */
   public enum Stage: Int { // case none
      case clickDown // from noStage to clickStage
      case deepClickDown // from clickStage to deepClickStage
      case clickUp // from clickStage to noStage
      case deepClickUp // from deepStage to clickStage
   }
   public enum Depth: Int {
      case idle // all force before 0.33 of pressure
      case click // it has detected a click and is moving between 0.33 and 0.66 of pressure
      case deepClick // it has deteted a deep click and is moving between 0.66 and 1.0
   }
}
