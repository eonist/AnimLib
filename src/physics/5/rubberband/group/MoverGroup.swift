import Foundation
/**
 * Movergroup for rubberband
 * Fixme: ⚠️️ rename to ElasticMoverGroup, SpringSolverGroup
 */
struct MoverGroup {
    var xMover: RubberBand
    var yMover: RubberBand
    typealias FrameTick = (CGFloat, Dir) -> Void
    init(_ callBack:@escaping FrameTick, _ maskSize: CGSize, _ contentSize: CGSize){
        self.xMover = RubberBand({ val in callBack(val, .hor) } , (0, maskSize.width), (0, contentSize.width))
        self.yMover = RubberBand({ val in callBack(val, .ver) } , (0, maskSize.height), (0, contentSize.height))
    }
}
extension MoverGroup{
//    var event: EventCallBack { get { fatalError("not supported") } set { xMover.event = newValue; yMover.event = newValue } }
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
    func start() {
        xMover.start()
        yMover.start()
    }
    func stop(){
        xMover.stop()
        yMover.stop()
    }
    func updatePosition(_ direct: Bool = false) {
        xMover.updatePosition(direct)
        yMover.updatePosition(direct)
    }
}
//extension MoverGroup {
//    var isDirectlyManipulating: Bool {
//        get { fatalError("deprecated")/*return xMover.isDirectlyManipulating || yMover.isDirectlyManipulating*/ }
//        set { xMover.isDirectlyManipulating = newValue; yMover.isDirectlyManipulating = newValue; fatalError("deprecated") }
//    }
//}
