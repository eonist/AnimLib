import Foundation

public func +(a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin + b.origin, size: a.size + b.size) }
public func -(a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin - b.origin, size: a.size - b.size) }
public func *(a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin * b.origin, size: a.size * b.size) }
