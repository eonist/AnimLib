import QuartzCore
/**
 * Disable implicit animation
 * - Fixme: ⚠️️ Figure out how to disaple auto anim in NSViews i think it's: layer.actions = ["sublayers":NSNull()] see: https://stackoverflow.com/questions/5833488/how-to-disable-calayer-implicit-animations/43560444#43560444   and:  https://stackoverflow.com/questions/2244147/disabling-implicit-animations-in-calayer-setneedsdisplayinrect?rq=1
 * ## Examples:
 * disableAnim { view.isHidden = true } // Default animation is now disabled, Basically whatever you put inside the closure is not animated
 */
public func disableAnim(_ closure: () -> Void) {
   CATransaction.begin()
   CATransaction.setDisableActions(true)
   closure()
   CATransaction.commit()
}
