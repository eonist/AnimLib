/**
 * Access
 */
extension Animator {
   var duration: CGFloat { get { return initValues.dur } set { initValues.dur = newValue } } // In seconds
   var from: CGFloat { get { return initValues.from } set { initValues.from = newValue } } // From this value
   var to: CGFloat { get { return initValues.to } set { initValues.to = newValue } } // To this value
   var framesToEnd: CGFloat { return Animator.fps * duration } // totFrameCount
}
