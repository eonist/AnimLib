/**
 * Easer4 tests
 */
func easer4Test(){
	 _ = {
		  let animator = Easer4<CGFloat>(initValues,initConfig){ val in
				Swift.print("val: " + "\(val)")
		  }
		  animator.targetValue = 100
		  animator.start()
	 }
	 _ = {
		  let animator = Easer4<CGPoint>(initPointValues,initPointConfig){ val in
				Swift.print("val: " + "\(val)")
		  }
		  animator.targetValue = CGPoint(100,100)
		  animator.start()
	 }()
}
