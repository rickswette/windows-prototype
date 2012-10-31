package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import flash.events.TouchEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TransformGestureEvent;
	
	import Window;
		
	import flash.events.GestureEvent;
	import flash.events.GesturePhase;
	public class windows extends Sprite
	{
		
		private var myTextField:TextField = new TextField();
	
		public function windows()
		{
			var a:Window = new Window(this.stage,"#ffcc00",100);
			addChild(a);
			
			var b:Window = new Window(this.stage,"#ffcccc",400);
			addChild(b);
			
			var c:Window = new Window(this.stage,"#ffcccc",700);
			addChild(c);
		
			this.addEventListener(TransformGestureEvent.GESTURE_PAN, globalGesture);
			
			
		}
		private function globalGesture(evt:TransformGestureEvent):void{
			
			trace(evt.phase);
			if (evt.phase==GesturePhase.BEGIN) {
				myTextField.text = "Begin";
			}
			if (evt.phase==GesturePhase.UPDATE) {
				myTextField.text = "Update";
			}
			if (evt.phase==GesturePhase.END) {
				myTextField.text = "End";
			}
			
		}
	}
}
