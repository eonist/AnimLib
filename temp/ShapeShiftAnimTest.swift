/**
 *
 */
func circle2RectAnimTest(){
	 /*Setup a window*/
	 let rect = CGRect(0,0,200,300)
	 window.size = rect.size
	 window.contentView = InteractiveView2()
	 window.title = ""

	 StyleManager.addStyle("#bg{fill:white;}")
	 window.contentView?.addSubview(Section(window.size.w,window.size.h,nil,"bg"))

	 /*The modal shape that pops up*/
	 let startRect2 = CGRect.init(rect.center,CGSize(0,0))
	 let roundRect2:RoundRectGraphic = {
		  let roundRect = RoundRectGraphic(0,0,startRect2.w,startRect2.h,Fillet(0),FillStyle(NSColor.yellow.alpha(0)),nil)
		  window.contentView?.addSubview(roundRect.graphic)
		  roundRect.draw()
		  roundRect.graphic.layer?.position = startRect2.origin
		  return roundRect
	 }()

	 /*The blue circle shape*/
	 let startRect = CGRect.init(CGPoint(50,100),CGSize(100,100))
	 let roundRect:RoundRectGraphic = {
		  let roundRect = RoundRectGraphic(0,0,startRect.w,startRect.h,Fillet(50),FillStyle(.blue),nil)
		  window.contentView?.addSubview(roundRect.graphic)
		  roundRect.draw()
		  roundRect.graphic.layer?.position = startRect.origin
		  return roundRect
	 }()

	 let anim1 = Animator2.init(initValues:(dur:0.6,from:0,to:1), easing:Easing.expo.easeOut) { value in
		  disableAnim {
				/*roundRect1*/
				_ = {
					 /*Fillet*/
					 let fillet:Fillet = Fillet(50+(-25*value))
					 roundRect.fillet = fillet

					 /*Color*/
					 let color = NSColor.blue.interpolate(.red, value)
					 roundRect.graphic.fillStyle = FillStyle(color)

					 /*Size*/
					 let endSize = CGSize(150,50)
					 let newSize = startRect.size.interpolate(endSize, value)
					 roundRect.size = newSize

					 /*Position*/
					 let endP = CGPoint(25,25)
					 let newP = startRect.origin.interpolate(endP, value)
					 roundRect.graphic.layer?.position = newP

					 /*Draw it all*/
					 roundRect.draw()
				}()
				/*roundRect2*/
				_ = {
					 /*Fillet*/
					 let fillet:Fillet = Fillet((25*value))
					 roundRect2.fillet = fillet

					 /*Color*/
					 let color = NSColor.green.interpolate(NSColor.green.alpha(1), value)
					 roundRect2.graphic.fillStyle = FillStyle(color)

					 /*Size*/
					 let endSize = CGSize(150,150)
					 let newSize = startRect2.size.interpolate(endSize, value)
					 roundRect2.size = newSize

					 /*Position*/
					 let endP = CGPoint(25,100)
					 let newP = startRect2.origin.interpolate(endP, value)
					 roundRect2.graphic.layer?.position = newP

					 /*Draw it all*/
					 roundRect2.draw()
				}()
		  }
	 }
	 anim1.completed = {
		  bgSleep(1){/*delay anim for 1 secs*/
				anim1.initValues = (dur:0.6,from:1,to:0)/*reverse*/
				anim1.currentFrameCount = 0/*reset*/
				anim1.completed = {}/*reset*/
				anim1.start()/*start the reverse anim*/
		  }
	 }

	 bgSleep(30){/*delay anim for 2 secs*/
		  anim1.start()
	 }

}
