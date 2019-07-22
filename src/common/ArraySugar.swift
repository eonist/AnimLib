import Foundation

extension Array {
   /**
    * Removes first item in array if available
    */
   @discardableResult
   public mutating func removeFirst(_ item: Element) -> Element? {
      if let i = self.firstIndex(where: { ($0 as AnyObject) === (item as AnyObject) }) {
         return self.remove(at: i)
      }
      return nil
   }
}
