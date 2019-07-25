import Foundation
/**
 * Access
 */
extension RubberBand {
   var friction: CGFloat { return config.friction }
   var springEasing: CGFloat { return config.springEasing }
   var spring: CGFloat { return config.spring }
   var limit: CGFloat { return config.limit }
   var epsilon: CGFloat { return config.epsilon }
}

//DEPRECATED,Legacy support
//var frame: CGRect { get { return CGRect(0, maskFrame.min, 0, maskFrame.len) } set { maskFrame = (newValue.y, newValue.height) } }
//DEPRECATED,Legacy support
//var itemsRect: CGRect { get { return CGRect(0, contentFrame.min , 0, contentFrame.len) } set { contentFrame = (newValue.y, newValue.height) } }
//DEPRECATED
//var isDirectlyManipulating: Bool {get{fatalError("not supported anymore")}set{_ = newValue; fatalError("deprecated");}}/*toggles the directManipulation mode*/
