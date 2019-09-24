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
