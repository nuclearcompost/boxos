package
{
	//-----------------------
	//Purpose:				Represents a 2D coordinate
	//Public Properties:
	//	X:int { get; set; } = the x coordinate
	//  Y:int { get; set; } = the y coordinate
	//
	//Public Methods:
	//	Equals(Coord2D):Boolean
	//-----------------------
	public class Coord2D
	{
		// Public Properties:
		public function get x():int
		{
			return this._x;
		}
		
		public function set x(value:int):void
		{
			this._x = value;
		}
		
		public function get y():int
		{
			return this._y;
		}
		
		public function set y(value:int):void
		{
			this._y = value;
		}
		
		//* Public Properties *//
		
		
		// Private Properties //
		private var _x:int;
		private var _y:int;
		
		//* Private Properties *//
		
		
		// Initialization //
		public function Coord2D(x:int, y:int)
		{
			this._x = x;
			this._y = y;
		}
	
		//* Initialization *//
		
		
		// Public Methods //
		
		//---------------
		//Purpose:		Check if two Coord2Ds are the same or not
		//
		//Parameters:
		//	compare:Coord2D = the Coord2D to compare this Coord2D to
		//
		//Returns:		true if the 2 Coord2Ds are the same, false otherwise
		//---------------
		public function Equals(compare:Coord2D):Boolean
		{
			if (this._x != compare.x)
			{
				return false;
			}
			if (this._y != compare.y)
			{
				return false;
			}
			return true;
		}
		
		//* Public Methods *//
	}
}