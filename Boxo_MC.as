package
{
	
	import flash.display.MovieClip;
	
	//-----------------------
	//Purpose:				The movieclip object to represent a boxo
	//
	//Public Properties:
	//	Type:int { get; } = the Boxo type { 0 = blank, 1 = up, 2 = down, 3 = left, 4 = right, 5 = neutral }
	// 
	//Public Methods:
	//	Update(type:int, lit:Boolean):void
	//-----------------------
	public class Boxo_MC extends MovieClip
	{
		// Public Properties //
		public function get type():int
		{
			return _type;
		}
		
		//* Public Properties *//
		
		
		// Private Properties //
		
		private var _type:int;
		
		//* Private Properties *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new Boxo_MC object
		//
		//Parameters:
		//	type:int = the Boxo type { 0 = blank, 1 = up, 2 = down, 3 = left, 4 = right, 5 = neutral }
		//	x:int = the x pixel coordinate to draw this movieclip at
		//	y:int = the y pixel coordinate to draw this movieclip at
		//	lit:Boolean = whether or not to draw this movieclip in the lit status
		//
		//Returns:		reference to the new object
		//---------------
		public function Boxo_MC(type:int, x:int, y:int, lit:Boolean)
		{
			this.x = x;
			this.y = y;
			this._type = type;
			
			Update(_type, lit);
		}

		//* Initialization *//
		
		
		// Public Methods //
		
		public function Move(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
		}
		
		//---------------
		//Purpose:		Update the movieclip based on the Boxo's new type and lit status
		//
		//Parameters:
		//	type:int = the Boxo type { 0 = blank, 1 = up, 2 = down, 3 = left, 4 = right, 5 = neutral }
		//	lit:Boolean = whether or not to draw this movieclip in the lit status
		//
		//Returns:		void
		//---------------
		public function Update(type:int, lit:Boolean):void
		{
			this._type = type;
			if (lit)
			{
				this.gotoAndStop(type * 2 + 1);
			}
			else
			{
				this.gotoAndStop(type * 2);
				this.width = 50;
				this.height = 50;
			}
		}
		
		//* Public Methods *//
	}
}