import Foundation
/**
 * - Fixme: ⚠️️ Probably rename to onMoveCallback, or move, or moveCallBack et
 */
open class InteractiveView: GraphicView {
   /*Callbacks*/
   public var onDown: CallBack = { _ in }
   public var onUp: CallBack = { _ in }
   public var onMove: CallBack = { _ in } // Fixme: rename to onDrag
}
/**
 * Type
 */
extension InteractiveView {
   public typealias CallBack = (_ point: CGPoint) -> Void
}
