//
//  ModalButton+Core.swift
//  AnimKitExample
//
//  Created by Eon on 31/07/2019.
//  Copyright © 2019 FutureLab. All rights reserved.
//

import Foundation

extension ModalButton {
   /**
    * - Note: This is the only place to get frame.height consistently (when you use either AutoLayout or CGRect based layout)
    */
   override open func drawLayout() {
      super.drawLayout()
//      self.caLayer?.sublayers?.forEach { $0.removeFromSuperlayer() }
//      drawBackground()
      drawGraphic()
   }
   /**
    * BG
    */
   private func drawBackground() {
//      let center: CGPoint = .init(x: self.frame.width / 2, y: self.frame.height / 2)
//      let radius: CGFloat = self.frame.height / 2
//      let circle1 = CGShapeUtil.drawCircle(with: .init(), circle: (center, radius), style: (.white, .black, 1), progress: 1)
//      self.caLayer?.addSublayer(circle1)
   }
   /**
    * On
    */
   private func drawGraphic() {
//      let space: CGFloat = self.frame.width / 4
//      let centers: [CGPoint] = (1...3).map { i in
//         let x: CGFloat = space * CGFloat(i)
//         let center: CGPoint = .init(x: x, y: self.frame.height / 2)
//         return center
//      }
//      let radius: CGFloat = self.frame.height / 14
//      centers.forEach { center in
//         let circle1 = CGShapeUtil.drawCircle(with: .init(), circle: (center, radius), style: (.clear, .black, 1), progress: 1)
//         self.caLayer?.addSublayer(circle1)
//      }
   }
}

