import UIKit
import AnimKitIOS

class MainVC: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView(frame: .zero)
//      view = PeekAndPopView()
      view.backgroundColor = .yellow
   }
   override var prefersStatusBarHidden: Bool { return true }
}
class MainView: UIView {
   override init(frame: CGRect) {
      super.init(frame: frame)
      testAnimation()
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   /**
    * testAnimation
    */
   func testAnimation() {
      Swift.print("testAnimation")
      let box: UIView = .init(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
      box.backgroundColor = UIColor.orange
      addSubview(box)
      let animator: Animator = .init()
      animator.onFrame = { progress in Swift.print("onFrame"); /*disableAnim {*/  box.frame.origin.x = 100 * progress /*}*/ }
      animator.completed = { Swift.print("Animation completed ✅") }
      animator.start()
   }
}
