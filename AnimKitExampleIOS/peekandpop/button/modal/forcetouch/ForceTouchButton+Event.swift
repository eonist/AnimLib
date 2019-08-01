import Foundation
/**
 * Extension
 */
extension ForceTouchButton {
   override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      //      Swift.print("ForceTouchButton.touchesMoved")
      //      guard let forceTouch: ForceTouch = touches.first?.forceTouch else { return }
      //      Swift.print("forceTouch.linearPressure:  \(forceTouch.linearPressure)")
      //      Swift.print("forceTouch.forceDepth:  \(forceTouch.forceDepth)")
      //      let curDepth = forceTouch.forceDepth
      //      Swift.print("curDepth:  \(curDepth.rawValue)")
      //      Swift.print("prevDepth.rawValue:  \(prevDepth.rawValue)")
      if let curDepth: ForceTouchStage = self.forceTouchStage(touches: touches) {
         //         Swift.print("has changed: :  \(curDepth)")
      }
      //use nil to check bool instead
   }
}
//🏀
//@objc func onStageChange(curStage: Int) { 0,1,2,3 }
