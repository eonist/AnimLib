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
let animator = LoopingAnimator(Animation.sharedInstance,3,1,0,1,progress,Linear.ease)
func progress(value:CGFloat){
   let angle = π * 2  * value
   line.p2 = line.p1.polarPoint(50,angle)
   line.draw()
}
animator.start()
```

#### Springer

In springing, acceleration is proportional to the distance. If the object is far away from the target, a whole lot of acceleration is applied, increasing the velocity quickly. As the object gets closer to its target, less acceleration is applied, but it’s still accelerating! It flies right past the target, and then acceleration pulls it back. Eventually, friction causes it to settle down.

<img width="394" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/spring.mov.gif">

#### Easer

when you use easing to move an object into position, it automatically takes on a very natural appearance. One of the coolest things is that simple easing is actually very easy to do. In fact, it’s prob- ably easier than figuring out the angle, the vx, and the vy, and moving at a fixed speed.

<img width="398" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Easer_4.gif">