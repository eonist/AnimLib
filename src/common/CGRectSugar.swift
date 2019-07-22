import Foundation

func +(a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin + b.origin, size: a.size + b.size) }
func -(a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin - b.origin, size: a.size - b.size) }
func *(a: CGRect, b: CGRect) -> CGRect { return CGRect(origin: a.origin * b.origin, size: a.size * b.size) }
