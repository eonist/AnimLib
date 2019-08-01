import UIKit
import Hybrid_iOS
import Spatial
/**
 * Fixme: impliment a check for 3d touch: https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/tracking_the_force_of_3d_touch_events/checking_the_availability_of_3d_touch
 */
public class ForceTouchButton: Button, ForceTouchButtonKind {
   var prevDepth: ForceTouchDepth = .idle
   override init(style: Button.Style = Button.defaultStyle, frame: CGRect = .zero) {
      super.init(style: style, frame: frame)
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

// To check if there is forceTouch capability:

//      if( traitCollection.forceTouchCapability == .available) {
//         registerForPreviewing(with: self, sourceView: self)
//      }
