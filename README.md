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

#### Springing:

When springing, the acceleration is proportional to the distance. If the item is far away from the target, a lot of acceleration is applied, increasing the velocity quickly. As the object gets closer to its target, less acceleration is applied, but it’s still accelerating! It flies right past the target, and then acceleration pulls it back. Eventually, friction causes it to settle down.

<img width="394" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/spring.mov.gif">

**Here is the code for the above example:**

```swift
func progress(value:CGPoint){/*This method gets called 60FPS, add the values to be manipulated here*/
    disableAnim {/*Important so that you don't get the apple "auto" anim as well*/
        ellipse.graphic.layer?.position = value/*We manipulate the layer because it is GPU accelerated as oppose to setting the view.position which is slow*/
    }
}
let animator = PointSpringer(progress, PointSpringer.initValues,PointSpringer.initConfig)/*Setup interruptible animator*/
func onViewEvent(_ event:Event) {/*This is the click on window event handler*/
    if event.type == ButtonEvent.upInside {
        animator.targetValue = bg!.localPos()/*Set the position of where you want the anim to go*/
        if animator.stopped {animator.start()}/*We only need to start the animation if it has already stopped*/
    }
}
bg?.event = onViewEvent
```

To explain how springing works, let’s simulate it with some sample numbers. Let’s say the x position is 0, vx
is 0, the target x is 100, and the spring variable is 0.1. Here is how it might progress:

1. Multiply distance (100) by spring, and you get 10. Add that to vx, which then becomes 10. Add
velocity to position, making the x position 10.
2. Next step, distance (100 – 10) is 90. Acceleration is 90 times 0.1, or 9 this time. This gets
added to vx, which becomes 19. The x position becomes 29.
3. Next step, distance is 71, acceleration is 7.1, which added to vx makes it 26.1. The x position
becomes 55.1.
4. Next step, distance is 44.9, acceleration is 4.49, and vx becomes 30.59. The x position is then 85.69.
The thing to note is that the acceleration on each frame becomes less and less as the object approaches its target, but the velocity continues to build. It’s not building as rapidly as it was on previous frames, but it’s still moving faster and faster.
After a couple more steps, the object goes right past the target to an x position of around 117. The distance is now 100 – 117, which is –17. A fraction of this gets added to the velocity, slowing the object down a bit.


- A high spring value will make a very stiff spring. Something lower will look more like a loose rubber band. You can play around with the friction and spring values to get the look you want


#### Easing:
when you use easing to move an object into position, it automatically takes on a very natural appearance. One of the coolest things is that simple easing is actually very easy to do. In fact, it’s probably easier than figuring out the angle, the vx, and the vy, and moving at a fixed speed.

<img width="398" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Easer_4.gif">

**Here is the code for the above example:**

```swift
//See Springer example and switch PointSpringer for PointEaser
```

Here are the steps for easing:  
1. Decide on a number for your proportional motion. This will be a fraction of 1. 2. Determine your target.
3. Calculate the distance from the object to the target.
4. Multiply the distance by the fraction. This is your velocity.
5. Add the velocity value to the current position.
6. Repeat steps 3 through 5 until the object is at the target.

#### Why can't we just use UIViewPropertyAnimator?

In iOS 10 apple gave us "UIViewPropertyAnimator" Which was a big level up in the interruptible animation genre. However this too is limited in nature. And leaves a lot to be desired:

1. You don't have a onProgress callBack method when using UIViewPropertyAnimator 

2. Many of the layer’s properties are unsupported. (shadow, border, 3d transform) (won’t support arc)

3. Also the animations are limited to UIView Animatable Properties, which are: frame, bounds, center, transform, alpha, backgroundColor, contentStretch

4. No keyframe based animation

#### Final remarks:

There is also NumberSpringer and NumberEaser which can be used to manipulate CGFloat. Which enables you to animate color transition. Rotation, shadow, gradient, 3d perspectives or any other variable. unlike apples built in animation system this Animation lib enables you to animate any property you desire. You can also Extend the Easer or Springer class with your own Custom class so that it can have more custom logic. Say you want to do something with Point3D and need to account for the z value as well. The possibilities are endless. AnimLib also does more stock like animations similar to Apples Animation classes. I will attempt to do some examples and write another article about these features at a later date. Until then any feedback is always welcomed. Thanks for reading.


#### More examples: 

**Interpolation:**

<img width="100" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/color_interpolation_take_three.gif">

The above animation can be achieved by including the simple line bellow in the progress method 

```swift
let color = NSColor.green.interpolate(.blue, 0.5)
```

