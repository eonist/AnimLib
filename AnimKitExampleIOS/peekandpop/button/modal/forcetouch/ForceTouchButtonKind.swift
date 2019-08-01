import Foundation

public protocol ForceTouchButtonKind {
   func stageChange(curStage: ForceTouchButton.ForceTouchStage, prevDepth: ForceTouchButton.ForceTouchDepth)
}
extension ForceTouchButtonKind {
   public func stageChange(curStage: ForceTouchButton.ForceTouchStage, prevDepth: ForceTouchButton.ForceTouchDepth) {
      Swift.print("default implementation, override in subclass")
   }
}
