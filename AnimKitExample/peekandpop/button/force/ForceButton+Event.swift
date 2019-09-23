import Cocoa

extension ForceButton {
   /**
    * Force touch changed pressure
    */
   override func pressureChange(with event: NSEvent) {
      let curStage: Int = event.stage
      if event.pressureBehavior == .primaryDeepClick, prevStage != curStage {
         switch (curStage, prevStage) {
         case (0, 1): stageChange(Stage.clickUp) // super.onEvent(ForceTouchEvent(ForceTouchEvent.clickUp,prevStage,self,event))
         case (1, 0): stageChange(Stage.clickDown) // super.onEvent(ForceTouchEvent(ForceTouchEvent.clickDown,prevStage,self,event))
         case (1, 2):  stageChange(Stage.deepClickUp) // super.onEvent(ForceTouchEvent(ForceTouchEvent.deepClickUp,prevStage,self,event))
         case (2, 1): stageChange(Stage.deepClickDown) // super.onEvent(ForceTouchEvent(ForceTouchEvent.deepClickDown,prevStage,self,event))
         default: fatalError("stage not supoprted") // isn't possible
         }
         stageSwitch(event.stage)
         prevStage = curStage // always set prevStage to curStage on stage change
      }
      let linearPressure: CGFloat = self.linearPressure(pressure: event.pressure, stage: event.stage)
      pressureChange(linearPressure)
   }
}
