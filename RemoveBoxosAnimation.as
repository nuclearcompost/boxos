package
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class RemoveBoxosAnimation
	{
		// Constants:
		// Public Properties:
		
		// Private Properties //
		
		private var _boxoGraphicSize:Number;
		private var _container:MovieClip;
		private var _grid:Array;
		private var _parent:GameSession;
		private var _tileList:Array;
		private var _timer:Timer;
		
		//- Private Properties -//
	
		// Initialization:
		public function RemoveBoxosAnimation(parent:GameSession, container:MovieClip, grid:Array, tileList:Array)
		{
			_parent = parent;
			_container = container;
			_grid = grid;
			_tileList = tileList;
			
			_boxoGraphicSize = 100;
			
			_timer = new Timer(33);
			_timer.addEventListener(TimerEvent.TIMER, OnTimer);
			_timer.start();
		}
	
		// Public Methods:
		
		// Private Methods //
		
		private function AnimationComplete():void
		{
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, OnTimer);
			_timer = null;
			
			_parent.ResolveRemoveBoxosAnimation();
		}
		
		private function OnTimer(event:TimerEvent):void
		{
			_boxoGraphicSize -= 5;
			
			if (_boxoGraphicSize <= 10)
			{
				AnimationComplete();
				return;
			}
			
			for (var i:int = 0; i < _tileList.length; i++)
			{
				var oCoord:Coord2D = Coord2D(_tileList[i]);
				var oBoxo:Boxo = Boxo(_grid[oCoord.x][oCoord.y]);
				var mcBoxo:MovieClip = oBoxo.mc;
				
				var iSize:Number = Number(_boxoGraphicSize / 100.0);
				mcBoxo.width *= iSize;
				mcBoxo.height *= iSize;
			}
		}
		
		//- Private Methods -//
	}
}