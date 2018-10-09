package
{
	import flash.display.MovieClip;
	
	//-----------------------
	//Purpose:				The gravity arrow movieclip object
	//
	//Public Properties:
	//	none
	//
	//Public Methods:
	//	Repaint(gravity:int):void
	//-----------------------
	public class GravArrow_MC extends MovieClip
	{
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new GravArrow_MC object
		//
		//Parameters:
		//	x:int = the x coordinate to draw the movieclip at
		//	y:int = the y coordinate to draw the movieclip at
		//	gravity:int = current gravity status { 1 = up, 2 = down, 3 = left, 4 = right }
		//
		//Returns:		reference to the new object
		//---------------
		public function GravArrow_MC(x:int, y:int, gravity:int)
		{
			this.x = x;
			this.y = y;
			this.gotoAndStop(gravity);
		}
		
		//* Initialization *//


		// Public Methods //
		
		//---------------
		//Purpose:		Repaint the movieclip based on the current gravity
		//
		//Parameters:
		//	gravity:int = the current gravity { 1 = up, 2 = down, 3 = left, 4 = right }
		//
		//Returns:		void
		//---------------
		public function Repaint(gravity:int):void
		{
			this.gotoAndStop(gravity);
		}
		
		//* Public Methods *//
	}
}