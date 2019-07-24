
/**
 *
 */
func animator2Test(){
	 /*Setup a window*/
	 window.size = CGSize(200,200)
	 window.contentView = InteractiveView2()
	 window.title = ""

	 /*Ellipse*/
	 //        let newColor = NSColor.blue.interpolate(.red, 1)
	 let ellipse = RectGraphic(10,10,100,100,FillStyle(.blue),nil)
	 window.contentView?.addSubview(ellipse.graphic)
	 ellipse.draw()

	 let anim1 = Animator2(initValues:Animator2.initValues){ value in/*This method gets called 60FPS, add the values to be manipulated here*/
		  Swift.print("value: " + "\(value)")
		  disableAnim {/*Important so that you don't get the apple "auto" anim as well*/
				ellipse.graphic.layer?.position = CGPoint(100*value,0)/*We manipulate the layer because it is GPU accelerated as oppose to setting the view.position which is slow*/
		  }
	 }
	 let anim2 = Animator2(initValues:(dur:0.5,from:1,to:0)) { value in//adds a new anim block to the completed callBack
		  Swift.print("value: " + "\(value)")
		  disableAnim {/*Important so that you don't get the apple "auto" anim as well*/
				ellipse.graphic.layer?.position = CGPoint(100*value,0)/*We manipulate the layer because it is GPU accelerated as oppose to setting the view.position which is slow*/
		  }
	 }
	 anim1.completed = {
		  Swift.print("anim1 completed")
		  sleep(2)
		  anim2.start()//start the second anim right after the first started
	 }
	 let anim3 = Animator2(initValues: (dur:2.2,from:0,to:1)){ value in
		  disableAnim {
				let color = NSColor.blue.interpolate(.red, value)
				ellipse.graphic.fillStyle = FillStyle(color)
				ellipse.draw()
		  }
		  }.onComplete {//this is the final complete call in the chain
				Swift.print("entire anim sequence completed 🏆")
	 }
	 anim2.completed = {
		  sleep(2)
		  anim3.start()
	 }
	 let anim4 = Animator2(initValues: (dur:2.2,from:0,to:1)){ value in
		  disableAnim {
				let color = NSColor.red.interpolate(.blue, value)
				ellipse.graphic.fillStyle = FillStyle(color)
				ellipse.draw()
		  }
	 }
	 anim3.completed = {
		  sleep(CGFloat(0.4).int.uint32)
		  anim4.start()
	 }


	 bgSleep(30){/*start anim after 2 sec, but doesn't block the app*/
		  anim1.start()/*initiates the animation chain*/
	 }
}
