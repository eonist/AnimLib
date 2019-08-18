import Cocoa

extension ElasticTestView {
   /**
    * OnMove
    */
   func onMove(p: CGPoint) {
//      Swift.print("onMove.p:  \(p)")
//      let p: CGPoint = self.convert((window?.mouseLocationOutsideOfEventStream)!, from: nil)//self.convert(event.locationInWindow, from: nil)
      let yOffset: CGFloat = p.y - onDownYOffset
//      rubberband.value = -yOffset
//      rubberband.updatePosition(true)
//      rubberband.start()
      animator.direct = true
      animator.setTargetValue(yOffset).start()
   }
   func onDown(p: CGPoint) {
      onDownYOffset = p.y
   }
}
extension ElasticTestView {
   /**
    * thumbFrameAnim
    */
   func thumbFrameAnim(yValue: CGFloat) {
//      Swift.print("thumbFrameAnim.yValue:  \(yValue)")
      thumb.frame.origin.y = yValue
   }
}
