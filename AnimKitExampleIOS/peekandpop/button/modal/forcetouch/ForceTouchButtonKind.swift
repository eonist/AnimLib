import Foundation

public protocol ForceTouchButtonKind {
   func stageChange(curStage: ForceTouchButton.ForceTouchStage, prevStage: ForceTouchButton.ForceTouchStage) -> Void
}
extension ForceTouchButtonKind {
   public func stageChange(curStage: ForceTouchButton.ForceTouchStage, prevStage: ForceTouchButton.ForceTouchStage) {
      // default implementation, override in subclass
   }
}
