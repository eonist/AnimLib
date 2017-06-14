# **AnimLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/AnimLib.svg">

- Supports all common easing equations
- Interactive spring dynamics. Friction, SpringStrength etc. 
- The Spring solver has a small footprint and is easily customizable. 
- 60FPS (CVDisplayLink)
- Works with interaction (This is rare on apple platforms)
- Small footprint (Just a few functions and classes)
- Supports all the regular call-backs (onComplete etc)
- CPU friendly. Stops when there is no animation etc

In the example bellow, a clock pointer rotates 3 times: 

```swift
let line:LineGraphic = addSubView(LineGraphic())
let animator = LoopingAnimator(Animation.sharedInstance,3,1,0,1,progress,Easing.easeLinear)
func progress(value:CGFloat){
   let angle = π * 2  * value
   line.p2 = line.p1.polarPoint(50,angle)
   line.draw()
}
animator.start()
```
