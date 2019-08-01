import Hybrid_macOS
import Cocoa

class ForceButton: Button {
   var prevStage: Int = 0
   var stageSwitch: StageSwitch = defaultStageSwitch
   var stageChange: StageChange = defaultStageChange
   var pressureChange: PressureChange = defaultPressureChange
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

//extension ForceTouchButton {
//   var pressure:CGFloat {
//      return event!.pressure.cgFloat
//   }
//   var stage:Int {
//      return event!.stage
//   }
   /**
    * NOTE: calculates the entire range of the stage pressures so from stage 0 to 1 the pressure goes from 0 to 0.5 and from stage 1 to 2 the lienar pressure goes from 0.5 to 1 this makes it easier to scale things in a linear fashion from 0 to 1 in the entire stage range
    */
//   var linearPressure:CGFloat{
//      if stage == 0 {
//         return 0
//      }else if stage == 1{
//         return pressure / 2
//      }else /*if stage == 2*/ {
//         return 0.5 + (pressure / 2)
//      }
//   }
//}

//   static var clickDown:String = "forceTouchButtonClickDown"/*from noStage to clickStage*/
//   static var deepClickDown:String = "forceTouchButtonDeepClickDown"/*from clickStage to deepClickStage*/
//   static var clickUp:String = "forceTouchButtonClickUp"/*from clickStage to noStage*/
//   static var deepClickUp:String = "forceTouchButtonDeepClickUp"/*from deepStage to clickStage*/
/*Change*/
//   static var pressureChange:String = "forceTouchButtonPressureChange"/*fires all the time when pressure is applied*/
//   static var stageChange:String = "forceTouchButtonStageChange"/*fires only when tranisitoning from 1 stage to the other*/
/*Original NSEvent*/
