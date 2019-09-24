import Cocoa
/**
 * Enum, type
 */
extension ForceButton {
   typealias StageSwitch = (_ stage: Int) -> Void
   typealias StageChange = (_ stage: Stage) -> Void
   typealias PressureChange = (_ linearPressure: CGFloat) -> Void
}
/**
 * Storage for linearPressure and forceDepth
 */
//   public typealias ForceTouch = (linearPressure: CGFloat, forceDepth: ForceTouchButton.ForceTouchDepth)
