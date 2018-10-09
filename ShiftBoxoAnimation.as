package
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ShiftBoxoAnimation
	{
		private var _boxoGraphics:Array;
		private var _boxoShifts:Array;
		private var _container:MovieClip;
		private var _destinations:Array;
		private var _parent:GameSession;
		private var _speed:int;
		private var _timer:Timer;
		
		public function ShiftBoxoAnimation(parent:GameSession, container:MovieClip, boxoShifts:Array, speed:int)
		{
			_parent = parent;
			_container = container;
			_boxoShifts = boxoShifts;
			_speed = speed;
			
			_boxoGraphics = new Array();
			_destinations = new Array();
			
			for (var i:int = 0; i < _boxoShifts.length; i++)
			{
				var oBoxoShift:BoxoShift = BoxoShift(_boxoShifts[i]);
				var iDestGridX:int = oBoxoShift.startGridX + oBoxoShift.deltaGridX;
				var iDestGridY:int = oBoxoShift.startGridY + oBoxoShift.deltaGridY;
				var iDestPixelX:int = GameSession.GRID_OFFSET_X + (GameSession.BOXO_SIZE * iDestGridX);
				var iDestPixelY:int = GameSession.GRID_OFFSET_Y + (GameSession.BOXO_SIZE * iDestGridY);
				var oDestination:Coord2D = new Coord2D(iDestPixelX, iDestPixelY);
				_destinations.push(oDestination);
			}
			
			Paint();
			
			_timer = new Timer(33);
			_timer.addEventListener(TimerEvent.TIMER, OnTimer);
			_timer.start();
		}
		
		private function AnimationComplete():void
		{
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, OnTimer);
			_timer = null;
			
			var iNumChildren:int = _container.numChildren;
			
			for (var i:int = 0; i < iNumChildren; i++)
			{
				_container.removeChildAt(0);
			}
			
			_parent.ResolveShiftBoxoAnimation(_boxoShifts);
		}
		
		private function GetMin(one:int, other:int):int
		{
			if (one < other)
			{
				return one;
			}
			
			return other;
		}
		
		private function OnTimer(event:TimerEvent):void
		{
			var bSomethingMoved:Boolean = false;
			
			for (var i:int = 0; i < _boxoGraphics.length; i++)
			{
				var mcBoxo:Boxo_MC = Boxo_MC(_boxoGraphics[i]);
				var oDestination:Coord2D = Coord2D(_destinations[i]);
				
				if (mcBoxo.x == oDestination.x && mcBoxo.y == oDestination.y)
				{
					continue;
				}
				
				if (mcBoxo.x > oDestination.x)
				{
					mcBoxo.x -= GetMin(_speed, mcBoxo.x - oDestination.x);
					bSomethingMoved = true;
				}
				
				if (mcBoxo.x < oDestination.x)
				{
					mcBoxo.x += GetMin(_speed, oDestination.x - mcBoxo.x);
					bSomethingMoved = true;
				}
				
				if (mcBoxo.y > oDestination.y)
				{
					mcBoxo.y -= GetMin(_speed, mcBoxo.y - oDestination.y);
					bSomethingMoved = true;
				}
				
				if (mcBoxo.y < oDestination.y)
				{
					mcBoxo.y += GetMin(_speed, oDestination.y - mcBoxo.y);
					bSomethingMoved = true;
				}
			}
			
			if (bSomethingMoved == false)
			{
				AnimationComplete();
			}
		}
		
		private function Paint():void
		{
			for (var i:int = 0; i < _boxoShifts.length; i++)
			{
				var oBoxoShift:BoxoShift = BoxoShift(_boxoShifts[i]);
				var iX:int = GameSession.GRID_OFFSET_X + (GameSession.BOXO_SIZE * oBoxoShift.startGridX);
				var iY:int = GameSession.GRID_OFFSET_Y + (GameSession.BOXO_SIZE * oBoxoShift.startGridY);
				var mcBoxo:Boxo_MC = new Boxo_MC(oBoxoShift.type, iX, iY, false);
				_boxoGraphics.push(mcBoxo);
				
				_container.addChild(mcBoxo);
			}
		}
	}
}