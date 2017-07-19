import Cocoa
/**
 * TODO: Consider not using EventSender in the animation lib and instead setup callbacks so that it can work standalone
 * NOTE: We use EventSender for in-frequent events such as onComplete or onStop and we use a regular callback method as its very frequent
 */
class BaseAnimation:EventSender {
    var animatable:Animatable/*Reference to where the displayLink resides*/
    init(_ animatable:Animatable = Animation.sharedInstance){
        self.animatable = animatable
    }
    func onFrame(){
        fatalError("Must be overwritten in subclass")
    }
    /**
     * Start the animation
     */
    func start(){
        animatable.animators.append(self)/*add your self to the list of animators that gets the onFrame call*/
        if(!CVDisplayLinkIsRunning(animatable.displayLink)){CVDisplayLinkStart(animatable.displayLink)}/*start the displayLink if it isn't already running*/
    }
    /**
     * Stop the animation
     */
    func stop(){
        animatable.animators.removeAt(animatable.animators.indexOf(self))/*If none exist -1 is returned and none is removed*/
        if(animatable.animators.isEmpty && CVDisplayLinkIsRunning(animatable.displayLink)){CVDisplayLinkStop(animatable.displayLink)}/*stops the frame ticker if there is no active running animators*/
        super.onEvent(AnimEvent(AnimEvent.stopped,self))/*Notify listners the animation has stopped*/
    }
}
extension BaseAnimation{
    var stopped:Bool {return animatable.animators.indexOf(self) == -1}
}
