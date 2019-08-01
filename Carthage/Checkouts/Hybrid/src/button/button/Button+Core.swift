import Foundation

extension Button {
   override open func drawLayout() {
//      Swift.print("Button.drawLayout")
      self.caLayer?.cornerRadius = style.isRounded ? frame.height / 2 : self.caLayer?.cornerRadius ?? 0
      self.caLayer?.borderColor = style.borderColor.cgColor
      self.caLayer?.backgroundColor = style.backgroundColor.cgColor
      self.caLayer?.borderWidth = style.borderWidth
   }
}
