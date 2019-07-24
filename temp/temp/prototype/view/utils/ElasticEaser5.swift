import Foundation
@testable import Utils
/**
 * NOTE: Another name for this could be: RubberBand or ConstrainedEaser
 * TODO: ⚠️️ maskFrame.y must be 0 . until you add support for it to be a value > 0 or < 0
 */
class ElasticEaser5:Easer5<RoundedRect/*CGRect*/> {
    var direct:Bool = false
    typealias Frame = (min:CGFloat,len:CGFloat)//TODO:⚠️️ rename to  boundries
    var maskFrame:Frame/*Represents the visible part of the content*/
    var contentFrame:Frame/*Represents the total size of the content*/
    var limit:CGFloat = 100
    //var result:AnimState5<T>/*Output value, this is the value that external callers can use, its the var value after friction etc has been applied, it cannot be set from outside but can only be read from outside*/
    init(_ state:AnimState5<T>, _ easing:T,  _ contentFrame:Frame,_ maskFrame:Frame, _ onFrame:@escaping FrameTickSignature) {
        //self.result = state//set init result
        self.contentFrame = contentFrame
        self.maskFrame = maskFrame
        super.init(state,easing,onFrame)
    }
    override func updatePosition() {
        if direct {
            if targetValue.y < maskFrame.min {
                //Swift.print("applyTopBoundary")
                applyTopBoundary()
            }
            else if (targetValue.y + contentFrame.len) > maskFrame.len {
                //Swift.print("applyBottomBoundary")
                applyBottomBoundary()
            }else{
                //Swift.print("apply no boundry: targetValue: \(targetValue.y)")
                super.updatePosition()
            }
        }else{
            super.updatePosition()
        }
    }
    /**
     * When the min val reaches beyond max
     * PARAM: direct: toggles the directManipulation mode
     */
    func applyTopBoundary(){/*Surface is slipping the further you pull*/
        //Swift.print("applyTopBoundary")
        if(direct){/*surface is slipping the further you pull*/
            //result = value
            let distToGoal:CGFloat = targetValue.y /*- maskFrame.min*/
            //Swift.print("distToGoal: " + "\(distToGoal)")
            //Swift.print("limit: " + "\(-limit)")
            let constrainedValue:CGFloat = /*maskFrame.min + */CustomFriction.constrainedValueWithLog10(distToGoal,-limit /*- maskFrame.min*/ /*topMargin*/)//<--Creates the illusion that the surface under the thumb is slipping
            //Swift.print("constrainedValue: " + "\(constrainedValue)")
            value.y = constrainedValue
        }/*else{/*Springs back to limit*/
         velocity -= (distToGoal * spring)
         velocity *= springEasing//TODO: try to apply log10 instead of the regular easing
         value += velocity
         if(value.isNear(maskFrame.min, 1)){checkForStop(direct)}
         result = value
         }*/
    }
    /**
     * When the max val reaches beyond the min
     * PARAM: direct: toggles the directManipulation mode
     */
    func applyBottomBoundary(){
        //Swift.print("applyBottomBoundary")
        if(direct){/*surface is slipping the further you pull*/
            let totLen = (contentFrame.len - maskFrame.len)/*tot length of items - length of mask*/
            //            Swift.print("totLen: " + "\(totLen)")
            let normalizedValue:CGFloat = totLen + targetValue.y/*goes from 0 to -100*/
            //            Swift.print("normalizedValue: " + "\(normalizedValue)")
            //result = value
            let constrainedValue:CGFloat =  CustomFriction.constrainedValueWithLog10(normalizedValue,limit)//<--Creates the illusion that the surface under the thumb is slipping
            
            //            Swift.print("constrainedValue: " + "\(constrainedValue)")
            
            let valueY = -totLen + constrainedValue
            //            Swift.print("valueY: " + "\(valueY)")
            value.y = valueY
        }/*else{/*Springs back to limit*/
         let dist = maskFrame.len - (value + contentFrame.len)/*distanceToGoal*/
         velocity += (dist * spring)
         velocity *= springEasing
         value += velocity
         if dist.isNear(0, 1) {checkForStop(direct)}/*Checks if dist is near 0, with an epsilon of 1px*/
         result = value
         }*/
    }
}
//class Constrainer{
//    var direct:Bool = false
//    typealias Frame = (min:CGFloat,len:CGFloat)//TODO:⚠️️ rename to  boundries
//    var maskFrame:Frame/*Represents the visible part of the content*/
//    var contentFrame:Frame/*Represents the total size of the content*/
//    var limit:CGFloat = 100
//    var easer:Easer5<CGRect>
//    init(_ easer:Easer5<CGRect>,_ contentFrame:Frame,_ maskFrame:Frame){
//        self.easer = easer
//        self.contentFrame = contentFrame
//        self.maskFrame = maskFrame
//        easer.updatePos = self.updatePosition
//    }
//    func updatePosition(){
//        if direct {
//            if easer.targetValue.y < maskFrame.min {
//                //Swift.print("applyTopBoundary")
//                applyTopBoundary()
//            }
//            else if (easer.targetValue.y + contentFrame.len) > maskFrame.len {
//                //Swift.print("applyBottomBoundary")
//                applyBottomBoundary()
//            }else{
//                //Swift.print("apply no boundry: targetValue: \(targetValue.y)")
//                easer.updatePosition()
//            }
//        }else{
//            easer.updatePosition()
//        }
//    }
//    func applyTopBoundary(){
//        //Swift.print("applyTopBoundary")
//        if(direct){/*surface is slipping the further you pull*/
//            let distToGoal:CGFloat = easer.targetValue.y
//            let constrainedValue:CGFloat = CustomFriction.constrainedValueWithLog10(distToGoal,-limit)//<--Creates the illusion that the surface under the thumb is slipping
//            easer.value.y = constrainedValue
//        }
//    }
//    func applyBottomBoundary(){
//        //Swift.print("applyBottomBoundary")
//        if(direct){/*surface is slipping the further you pull*/
//            let totLen = (contentFrame.len - maskFrame.len)/*tot length of items - length of mask*/
//            let normalizedValue:CGFloat = totLen + easer.targetValue.y/*goes from 0 to -100*/
//            let constrainedValue:CGFloat =  CustomFriction.constrainedValueWithLog10(normalizedValue,limit)//<--Creates the illusion that the surface under the thumb is slipping
//            let valueY = -totLen + constrainedValue
//            easer.value.y = valueY
//        }
//    }
//}
