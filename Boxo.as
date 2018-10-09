package
{
	//-----------------------
	//Purpose:				The main gameplay object, a gravity-affecting box
	//
	//Public Properties:
	//	Lit:Boolean { set; } = Whether or not the boxo should be drawn lit up
	//	MC:Boxo_MC { get; } = The boxo's movieclip object
	//	Type:int { get; set; } = The boxo type { 0 = blank, 1 = up, 2 = down, 3 = left, 4 = right, 5 = neutral }
	//	
	//Public Methods:
	//	Paint(x:int, y:int):void
	//	UpdateGraphics():void
	//-----------------------
	public class Boxo
	{
		// Constants //
		public static const NUM_TYPES:int = 5;
		
		//* Constants *//
		
		
		// Public Properties //
		public function set lit(value:Boolean):void
		{
			_lit = value;
			
			if (_mc != null)
			{
				_mc.Update(_type, _lit);
			}
		}
		
		public function get mc():Boxo_MC
		{
			return _mc;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function set type(value:int):void
		{
			_type = value;
			
			if (_mc != null)
			{
				_mc.Update(_type, _lit);
			}
		}
		
		//* Public Properties *//
		
		
		// Private Properties //
		private var _game:GameSession;
		private var _lit:Boolean;
		private var _mc:Boxo_MC;
		private var _type:int;
		
		//* Private Properties *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new Boxo object
		//
		//Parameters:
		//	game:GameSession = the GameSession to which this Boxo belongs
		//	type:int = the Boxo type { 0 = blank, 1 = up, 2 = down, 3 = left, 4 = right, 5 = neutral } 
		//	x:int = the x coordinate in the grid where this Boxo is located
		//	y:int = the y coordinate in the grid where this Boxo is located
		//
		//Returns:		reference to the new object
		//---------------
		public function Boxo(game:GameSession, type:int, x:int, y:int)
		{
			_game = game;
			_lit = false;
			_type = type;
			Paint(x, y);
		}
		
		//* Initialization *//
	
	
		// Public Methods //
		
		//---------------
		//Purpose:		Create a new Boxo_MC for this boxo and add it to the display list
		//
		//Parameters:
		//	x:int = the x coordinate to display the graphics at
		//	y:int = the y coordinate to display the graphics at
		//
		//Returns:		void
		//---------------
		public function Paint(x:int, y:int):void
		{
			_mc = new Boxo_MC(_type, x, y, _lit);
			_game.AddBoxoGraphics(_mc);
		}
		
		//---------------
		//Purpose:		Updates the boxo's movieclip graphics based on the current type and lighting status
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		public function UpdateGraphics():void
		{
			_mc.Update(_type, _lit);
		}

		//* Public Methods *//
	}
}