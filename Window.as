package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.GestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import flash.events.TransformGestureEvent;
	
	import windowback;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	
	public class Window extends MovieClip
	{
		private var WIDTH:int = 200;
		private var HEIGHT:int = 200;
		private var a:windowback;
		
		public var xdiff:int;
		public var ydiff:int;
		
		public var draggable:Boolean = false;
		
		private var blammo:Boolean = true;
		
		private var xshifttotal:int = 0;
		private var yshifttotal:int = 0;
		private var xtotal:int = 0;
		private var ytotal:int = 0;
		
		private var beginningwidth:int = 0;
		private var beginningheight:int = 0;
		private var xbeginning:int;
		private var ybeginning:int;
		
		
		public function Window(parent2:Object,color,beginningx)
		{
			super();
			
			a = new windowback();
			
			addChild(a)
		//	this.add
			
			this.addEventListener(MouseEvent.MOUSE_DOWN,beginDrag1);
			parent2.addEventListener(MouseEvent.MOUSE_MOVE,drag1);
			parent2.addEventListener(MouseEvent.MOUSE_UP,stopDrag1);
		
			
			a.x = beginningx;
			a.y = 300;
			
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			
			parent2.addEventListener(TransformGestureEvent.GESTURE_PAN, onGlobalPan);
			//this.addEventListener(TransformGestureEvent.GESTURE_PAN, onPan);
	
			//parent2.addEventListener(TransformGestureEvent.GESTURE_SWIPE, onZoom);
			endGlobal.addEventListener(TimerEvent.TIMER_COMPLETE,endgesture);
				
		}
		private function endgesture(e:TimerEvent):void{
			trace("beginend",beginPan);
			beginPan = false;
		
		}
		private function onPan(e:TransformGestureEvent):void{
			trace("ontheobj");
			beginPan = true;
			
		}
		private var beginPan:Boolean = true;
		private var endGlobal:Timer = new Timer(1500,1);
		private var mover:Boolean = false;
		private var blammo1:Boolean = true;
		
		private function onGlobalPan(e:TransformGestureEvent):void{
		
			if (blammo1){
				if(e.shiftKey){
						a.x = a.x - e.offsetX * 3;
						a.y = a.y - e.offsetY * 3;
				}else{
				
					a.x = a.x - e.offsetX * 3;
					a.y = a.y - e.offsetY * 3;
					
					endGlobal.start();
				
					/*if(!beginPan){
						mover = false;
					
						if ((e.stageX - a.x) < 100){
							mover = true;
						}
						beginPan = true;
					
					}
					*/
					//a.width = a.width + e.offsetX * 3;
					//a.height = a.height  + e.offsetY * 3;
				}
			}else{
				//trace("global:" , beginPan);
				
				
				if(beginPan == true){
					a.x = a.x - e.offsetX * 5;
					a.y = a.y - e.offsetY * 5;
				}else{
					
					trace(e.offsetX,e.offsetY);
				//	if ((Math.abs(e.stageX - a.x) < 100) && (Math.abs(e.stageY - a.y) < 100)){
				//		beginPan = true;
				//	}
					
				}
				endGlobal = new Timer(3000,1);
				endGlobal.start();
				endGlobal.addEventListener(TimerEvent.TIMER_COMPLETE,endgesture);
				
			}
			
		}
		private function onZoom(e:TransformGestureEvent):void{
			//trace("zoom",e);
		}	
	
		
		public function scroll1(e:MouseEvent):void{
			
			if(e.delta > 0){
				a.height = a.height + 2;
			}else if (e.delta < 0){
				a.height = a.height - 2;
			}
		}
		public function setsize(c:int, d:int):void{
			a.width = WIDTH = c;
			a.height = HEIGHT = d;
			
			
		}
		private var laststagex:int;
		private var laststagey:int;
		
		private function drag1(e:MouseEvent):void{
			if(draggable){
			
				var deltax = laststagex - e.stageX;
				laststagex = e.stageX;

				var deltay = laststagey - e.stageY;
				laststagey = e.stageY;
				

				if(e.shiftKey){
					
					
					if(blammo){
					//a.width = a.width -deltax;
					//a.height = a.height - deltay;
					
					a.width = Math.abs(a.x - e.stageX);
					a.height = Math.abs(a.y - e.stageY);
						
					}else{
					xshifttotal = xbeginning - e.stageX;
					yshifttotal = ybeginning - e.stageY;
			
					a.width = beginningwidth - xshifttotal;
					a.height = beginningheight - yshifttotal;
					}
			
				}else{
					a.x = a.x - deltax;
					a.y = a.y - deltay;
					
					//	a.x = e.stageX - xdiff;
					//	a.y = e.stageY - ydiff;
						
				}
			}
			
			
		}
		public function stopDrag1(e:MouseEvent):void{
			draggable = false;
		}
		private function beginDrag1(e:MouseEvent):void{
		
			laststagex = e.stageX;
			laststagey = e.stageY;
			
			xdiff = e.stageX - a.x;
			ydiff = e.stageY - a.y;
			
			xbeginning = e.stageX;
			ybeginning = e.stageY;
			
			 beginningwidth = a.width;
			 beginningheight = 	a.height;
			
			 
			xshifttotal = 0;
			yshifttotal = 0;
			
			xtotal = 0;
			ytotal = 0;
			
		//	trace("boom");
			draggable = true;
			
			if (e.shiftKey){
				if(blammo){
					//a.width = a.width -deltax;
					//a.height = a.height - deltay;
					
					a.width = Math.abs(a.x - e.stageX);
					a.height = Math.abs(a.y - e.stageY);
					
				}
			}
		
		}
	}
}