import Foundation
/**
 * Movergroup for rubberband
 * - Fixme: ⚠️️ rename to ElasticMoverGroup, SpringSolverGroup
 */
public struct MoverGroup {
   var xMover: RubberBand
   var yMover: RubberBand
   public typealias FrameTick = (CGFloat, Dir) -> Void
   public init(_ callBack:@escaping FrameTick, _ maskSize: CGSize, _ contentSize: CGSize){
      self.xMover = RubberBand({ val in callBack(val, .hor) } , (0, maskSize.width), (0, contentSize.width))
      self.yMover = RubberBand({ val in callBack(val, .ver) } , (0, maskSize.height), (0, contentSize.height))
   }
}
