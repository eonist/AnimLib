import Foundation

extension RubberBand {
   /**
    * 
    */
   override func onFrame(){
      if hasStopped { // stop the frameTicker here
         stop() // <---never stop the CVDisplayLink before you start another. Since you can't start a CVDisplayLink within a CVDisplayLinkStart block
      } else { // only move the view if the mover is not stopped
         updatePosition() // tick the mover on every frame
         callBack(result) // indirect manipulation aka momentum
      }
   }
   /**
    * While directly manipulating: Enforces the illusion that the surface is slipping the further you pull
    * - Note: When in inderect motion: Springs back to it's limit
    * - Fixme: ⚠️️ Add a isDirectlyManipulating flag to the function arg instead of having a class scoped bool flag!?!?
    */
   override func updatePosition(_ direct: Bool = false) {
      if value > maskFrame.min { applyTopBoundary(direct) } // the top of the item-container passed the mask-container top checkPoint
      else if (value + contentFrame.len) < maskFrame.len { applyBottomBoundary(direct) } // the bottom of the item-container passed the mask-container bottom checkPoint
      else { // within the Boundaries
         if !direct { // Only apply friction and velocity when not directly manipulating the value
            applyFriction()
         }
         checkForStop(direct) // Assert if the movement is close to stopping, if it is then stop it
         result = value
      }
   }
   /**
    * If you extract this code to a method 🚀, and then override it with the snapFriction equation, then it should work just like that!
    */
   func applyFriction() {
      velocity *= friction
      value += velocity
   }
}
