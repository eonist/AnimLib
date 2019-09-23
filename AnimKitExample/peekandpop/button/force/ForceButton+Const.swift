import Foundation

extension ForceButton {
   static let defaultStageSwitch: StageSwitch = { stage in }
   static let defaultStageChange: StageChange = { stage in /*Swift.print("no call-back attached stage: \(stage)")*/ }
   static let defaultPressureChange: PressureChange = { linearPressure in /*Swift.print("no call-back attached linearPressure: \(linearPressure)")*/ }
}
