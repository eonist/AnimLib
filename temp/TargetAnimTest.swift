/**
 *
 */
func targetAnimationTest(){
	 //animate to to target
	 //then we change the target and the ball should gravitate towards this new target

	 //Setup a window
	 window.size = CGSize(664,400)
	 window.contentView = InteractiveView2()
	 window.title = ""

	 StyleManager.addStyle("#bg{fill:white;}")
	 let bg = window.contentView?.addSubView(Button(window.size.w,window.size.h,nil,"bg"))

	 /*Ellipse*/
	 let ellipse = EllipseGraphic(-50,-50,100,100,FillStyle(.blue),nil)
	 window.contentView?.addSubview(ellipse.graphic)
	 ellipse.draw()

	 func progress(value:CGPoint){/*This method gets called 60FPS, add the values to be manipulated here*/
		  disableAnim {/*Important so that you don't get the apple "auto" anim as well*/
				ellipse.graphic.layer?.position = value/*We manipulate the layer because it is GPU accelerated as oppose to setting the view.position which is slow*/
		  }
	 }
	 let animator = PointEaser(progress, PointEaser.initValues,PointEaser.initConfig)/*Setup interuptable animator*/
	 func onViewEvent(_ event:Event) {/*This is the click on window event handler*/
		  if event.type == ButtonEvent.upInside {
				animator.targetValue = bg!.localPos()/*Set the position of where you want the anim to go*/
				if animator.stopped {animator.start()}/*We only need to start the animation if it has already stopped*/
		  }
	 }
	 bg?.event = onViewEvent

	 //update mover target on window event mouseUpEvent
}
