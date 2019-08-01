import Foundation

extension ForceButton {
   /**
    * - Note: calculates the entire range of the stage pressures so from stage 0 to 1 the pressure goes from 0 to 0.5 and from stage 1 to 2 the lienar pressure goes from 0.5 to 1 this makes it easier to scale things in a linear fashion from 0 to 1 in the entire stage range
    */
   func linearPressure(pressure: Float, stage: Int) -> CGFloat {
      let pressure: CGFloat = .init(pressure)
      if stage == 0 {
         return 0
      } else if stage == 1 {
         return pressure / 2
      } else /*if stage == 2*/ {
         return 0.5 + (pressure / 2)
      }
   }
}
