import UIKit
import AnimKitIOS

class MainVC: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
//      view = MainView(frame: .zero)
      view = PeekAndPopView()
      view.backgroundColor = .yellow
   }
   override var prefersStatusBarHidden: Bool { return true }
}
