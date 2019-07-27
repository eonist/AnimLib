import UIKit
import Hybrid_iOS
import Spatial
/**
 * Fixme: impliment a check for 3d touch: https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/tracking_the_force_of_3d_touch_events/checking_the_availability_of_3d_touch
 */
public class ForceTouchButton: Button, ForceTouchButtonKind {
   var prevStage: ForceTouchStage = .clickDown
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Extension
 */
extension ForceTouchButton {
   override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let forceTouch: ForceTouch = touches.first?.forceTouch else { return }
//      Swift.print("forceTouch.linearPressure:  \(forceTouch.linearPressure)")
//      Swift.print("forceTouch.forceStage:  \(forceTouch.forceStage)")
      let curStage = forceTouch.forceStage
      if prevStage != curStage {
         switch (curStage.rawValue, prevStage.rawValue){
         case (0,1):
            stageChange(curStage: .clickUp, prevStage: prevStage)
         case (1,0):
            stageChange(curStage: .clickDown, prevStage: prevStage)
         case (1,2):
            stageChange(curStage: .deepClickUp, prevStage: prevStage)
         case (2,1):
            stageChange(curStage: .deepClickDown, prevStage: prevStage)
         default: break;//isn't possible
         }
         prevStage = curStage/*always set prevStage to curStage on stage change*/
      }
   }
}
