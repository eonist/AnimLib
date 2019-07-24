
/**
 * Springer4 tests
 */
func springer4Test(){
	 _ = {
		  let animator = Springer4<CGFloat>(initValues,initSpringerConfig){ val in
				Swift.print("val: " + "\(val)")
		  }
		  animator.targetValue = 100
		  animator.start()
	 }()
	 _ = {
		  let animator = Springer4<CGPoint>(initPointValues,initPointSpringerConfig){ val in
				Swift.print("val: " + "\(val)")
		  }
		  animator.start()
	 }
}
