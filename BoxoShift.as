package
{
	//-----------------------
	//Purpose:				Information about a shifting a boxo in the grid
	//
	//Properties:
	//	
	//Methods:
	//	
	//-----------------------
	public class BoxoShift
	{
		// Constants //
		
		//- Constants -//
		
		
		// Public Properties //
		
		public function get deltaGridX():int
		{
			return _deltaGridX;
		}
		
		public function set deltaGridX(value:int):void
		{
			_deltaGridX = value;
		}
		
		public function get deltaGridY():int
		{
			return _deltaGridY;
		}
		
		public function set deltaGridY(value:int):void
		{
			_deltaGridY = value;
		}
		
		public function get startGridX():int
		{
			return _startGridX;
		}
		
		public function set startGridX(value:int):void
		{
			_startGridX = value;
		}
		
		public function get startGridY():int
		{
			return _startGridY;
		}
		
		public function set startGridY(value:int):void
		{
			_startGridY = value;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function set type(value:int):void
		{
			_type = value;
		}
		
		//- Public Properties -//
		
		
		// Private Properties //
		
		private var _deltaGridX:int;
		private var _deltaGridY:int;
		private var _startGridX:int;
		private var _startGridY:int;
		private var _type:int;
		
		//- Private Properties -//
		
	
		// Initialization //
		
		public function BoxoShift(startGridX:int, startGridY:int, deltaGridX:int, deltaGridY:int, type:int)
		{
			_startGridX = startGridX;
			_startGridY = startGridY;
			_deltaGridX = deltaGridX;
			_deltaGridY = deltaGridY;			
			_type = type;
		}
	
		//- Initialization -//
		
		
		// Public Methods //
		
		//- Public Methods -//
		
		
		// Private Methods //
		
		//- Private Methods -//
		
		
		// Testing Methods //
		
		//- Testing Methods -//
	}
}