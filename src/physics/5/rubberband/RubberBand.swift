import Cocoa
/**
 * - Note: friction: This value is the strength of the friction when the item is floating freely
 * - Note: springEasing: the easeOut effect on the spring (also known as the dampener)
 * - Note: spring: the strength of the spring
 * - Note: limit: the max distance the displacement friction like the effect can travle, the vertical limit is the distance where the value almost doesn't move at all while directly manipulating,the illusion that the surface under the thumb is slipping
 * - Note: epsilon: twips 20th of a pixel
 * - Note: this rubberBand tween is cheating a bit. The perfect way to implement this would be to add a half circle easing curve
 * - Note: I think essentialy this is a SpringSolver. You can find an example of the SpringSolvers in programing books and also in the facebook pop lib
 * - Parameter maskRect: represents the visible part of the content
 * - Parameter contentRect: represents the total size of the content
 * - Fixme: ⚠️️ Rename to ElasticSpringSolver? or ElasticBand? ElasticSpring? Elastic?
 * - Fixme: ⚠️️ Integrate temp values inside rubberband or make a tempvalue struct
 * - Fixme: ⚠️️ Maybe rename to Elastic or SpringSolver
 */
class RubberBand: Mover {
    // Initial values
    var maskFrame: Frame // Represents the visible part of the content
    var contentFrame: Frame // Represents the total size of the content
    var config: Config // The init settings of the RubberbBand
    // Interim values
    var result: CGFloat = 0 // Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside
    var hasStopped: Bool = true // Indicates that the motion has stopped //Fixme: ⚠️️ try to move this into the mover
   /**
    * - Parameter callBack: Called on every FPS tick
    * - Parameter maskFrame: Represents the clipping area
    * - Parameter contentFrame: Represents the total size of the content
    * - Parameter config: 
    */
    init(_ callBack:@escaping FrameTick, _ maskFrame: Frame, _ contentFrame: Frame, _ config: Config) {
        self.maskFrame = maskFrame
        self.contentFrame = contentFrame
        self.config = config
        super.init(AnimProxy.shared, callBack, 0, 0)
    }
}


/**
 * Deprecations
 * - Fixme: ⚠️️ you can probably uncomment the methods bellow
 */
//extension RubberBand{
//    //legacy
//    convenience init(_ animatable:AnimProxyKind,_ callBack:@escaping FrameTick, _ maskFrame:Frame, _ contentFrame:Frame, _ value:CGFloat = 0, _ velocity:CGFloat = 0, _ friction:CGFloat = 0.98, _ springEasing:CGFloat = 0.2,_ spring:CGFloat = 0.4, _ limit:CGFloat = 100){
//        let config:Config = (friction,springEasing,spring,limit,0.15)
//        self.init(callBack, maskFrame,contentFrame, config)
//        /*self.velocity = velocity
//         self.value = value*/
//    }
//    //DEPRECATED,Legacy support
//    convenience init(_ animatable:AnimProxyKind,_ callBack:@escaping FrameTick, _ maskRect:CGRect, _ contentRect:CGRect, _ value:CGFloat = 0, _ velocity:CGFloat = 0, _ friction:CGFloat = 0.98, _ springEasing:CGFloat = 0.2,_ spring:CGFloat = 0.4, _ limit:CGFloat = 100){
//        self.init(animatable, callBack, (maskRect.y,maskRect.height),(contentRect.y,contentRect.height),value,velocity,friction,springEasing,spring,limit)
//    }
//}
