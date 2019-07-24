
/**
 * It's all about making bespoke interactions 👌
 */
func forceTouchButtonTesting(){
	 //1. circular button,centered
	 //window
	 let winRect = CGRect(0,0,200,300)
	 window.size = winRect.size
	 window.contentView = InteractiveView2()
	 window.title = ""

	 StyleManager.addStyle("#bg{fill:white;padding-top:24px;}")
	 let section = window.contentView?.addSubView(Section(window.size.w,window.size.h,nil,"bg"))

	 let textCSS:String = "Text{margin-top:0px;float:left;clear:left;font:Helvetica Neue;size:18px;align:center;type:dynamic;color:grey6;selectable:true;wordWrap:true;}"
	 StyleManager.addStyle(textCSS)

	 let text = Text(200,24,"0.0",section,"pressureText")
	 section?.addSubview(text)

	 let text2 = Text(200,24,"idle",section,"stageText")
	 section?.addSubview(text2)

	 let initRect:CGRect = {
		  let size:CGSize = CGSize(100,100)
		  let p:CGPoint = Align.alignmentPoint(size, winRect.size, Alignment.centerCenter, Alignment.centerCenter)
		  return CGRect(p,size)
	 }()
	 let initFillet:CGFloat = 20

	 let minRect:CGRect = {
		  let size = initRect.size * 0.5
		  let p:CGPoint = Align.alignmentPoint(size, winRect.size, Alignment.centerCenter, Alignment.centerCenter)
		  return CGRect(p,size)
	 }()
	 let minFillet:CGFloat = initFillet * 0.5

	 let btn:Button = {//button
		  StyleManager.addStyle("Button{width:\(initRect.size.w)px;height:\(initRect.size.h)px;fill:blue;corner-radius:20px;clear:none;float:none;}")
		  let btn = window.contentView!.addSubView(ForceTouchButton(initRect.size.w,initRect.size.h,nil,"btn"))
		  btn.point = initRect.origin//center button
		  return btn
	 }()

	 var style:Style = btn.skin!.style! as! Style

	 func onViewEvent(_ event:Event) {/*This is the click on window event handler*/
		  if event.type == ForceTouchEvent.clickDown{
				Swift.print("clickDown")
		  }else if event.type == ForceTouchEvent.deepClickDown{
				Swift.print("deepClickDown")
		  }else if event.type == ForceTouchEvent.clickUp {
				Swift.print("clickUp")
		  }else if event.type == ForceTouchEvent.deepClickUp {
				Swift.print("deepClickUp")
		  }
		  if event.type == ForceTouchEvent.stageChange {
				let stage:Int = (event as! ForceTouchEvent).stage
				Swift.print("stage: " + "\(stage)")
				if stage == 0 {
					 StyleModifier.overrideStylePropVal(&style, ("fill",0), NSColor.blue)
					 Swift.print("override to blue")
					 text2.setText("idle")
				}else if stage == 1{
					 StyleModifier.overrideStylePropVal(&style, ("fill",0), NSColor.red)
					 Swift.print("override to red")
					 text2.setText("click")
				}else /*if stage == 2*/{
					 StyleModifier.overrideStylePropVal(&style, ("fill",0), NSColor.green)
					 Swift.print("override to green")
					 text2.setText("deep click")
				}
		  }
		  if event.type == ForceTouchEvent.pressureChange {
				//Swift.print("pressure: " + "\((event as! ForceTouchEvent).pressure)")
				//Swift.print("event.linearPressure: " + "\((event as! ForceTouchEvent).linearPressure)")
				let scalar = (event as! ForceTouchEvent).linearPressure
				text.setText(scalar.toFixed(1).string)
				//interpolate size and position
				let newSize = initRect.size.interpolate(minRect.size, scalar)
				//Swift.print("newSize: " + "\(newSize)")
				let newPoint = initRect.origin.interpolate(minRect.origin, scalar)
				let newFillet = initFillet.interpolate(minFillet, scalar)
				//Edit the shape of the button, TODO: ⚠️️ clean the bellow up later. no forced unwraps and more direct calls plz

				StyleModifier.overrideStylePropVal(&style, ("width",0), newSize.w)
				StyleModifier.overrideStylePropVal(&style, ("height",0), newSize.h)
				StyleModifier.overrideStylePropVal(&style, ("corner-radius",0), newFillet)
				disableAnim {
					 btn.layer?.position = newPoint
					 btn.skin!.setStyle(style)
				}
		  }

	 }


	 btn.event = onViewEvent

}
