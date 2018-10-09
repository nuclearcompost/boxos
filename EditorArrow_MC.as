package
{
	import flash.display.MovieClip;
	
	//-----------------------
	//Purpose:				The editor arrow movieclip object
	//
	//Public Properties:
	//	none
	//
	//Public Methods:
	//	none
	//-----------------------
	public class EditorArrow_MC extends MovieClip {
		
		// Constants //
		public static const FRAME_LEFT:int = 1;
		public static const FRAME_RIGHT:int = 2;
		
		//* Constants *//


		// Initialization //
		
		//---------------
		//Purpose:		Construct a new EditorArrow_MC object
		//
		//Parameters:
		//	x:int = the x coordinate to draw the movieclip at
		//	y:int = the y coordinate to draw the movieclip at
		//	frame:int = the frame to draw the movieclip at
		//
		//Returns:		reference to the new object
		//---------------
		public function EditorArrow_MC(x:int, y:int, frame:int)
		{
			this.x = x;
			this.y = y;
			this.gotoAndStop(frame);
		}
		
		//* Initialization *//
	}
}