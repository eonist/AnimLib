import Foundation
/**
 * Access
 */
extension MoverGroup {
   //var event: EventCallBack { get { fatalError("not supported") } set { xMover.event = newValue; yMover.event = newValue } }
   func mover(_ dir: Dir) -> RubberBand {/*Convenience*/
      return dir == .hor ? xMover : yMover
   }
   var hasStopped: Bool {
      get { fatalError("get is not supported") }
      set { xMover.hasStopped = newValue;yMover.hasStopped = newValue }
   }
   var value: CGPoint {
      get { return CGPoint(x: xMover.value, y: yMover.value) }
      set { xMover.value = newValue.x; yMover.value = newValue.y }
   }
   var result: CGPoint {
      get { return CGPoint( x: xMover.result, y: yMover.result) }
      set { xMover.result = newValue.x; yMover.result = newValue.y }
   }
   var velocity: CGPoint {
      get { fatalError("get is not supported") }
      set { xMover.velocity = newValue.x; yMover.velocity = newValue.y; }
   }
   public func start() {
      xMover.start()
      yMover.start()
   }
   public func stop() {
      xMover.stop()
      yMover.stop()
   }
   public func updatePosition(_ direct: Bool = false) {
      xMover.updatePosition(direct)
      yMover.updatePosition(direct)
   }
}
