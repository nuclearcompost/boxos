package
{
	import flash.display.MovieClip;

	//-----------------------
	//Purpose:				The editor function button movieclip object
	//
	//Public Properties:
	//	none
	//
	//Public Methods:
	//	none
	//-----------------------
	public class EditorFunction_MC extends MovieClip
	{
		// Constants //
		public static const FRAME_TEST:int = 1;
		public static const FRAME_DESIGN:int = 2;
		public static const FRAME_SAVE:int = 3;
		public static const FRAME_EXIT:int = 4;
		public static const FRAME_PLAY:int = 5;
		public static const FRAME_BACK:int = 6;
		public static const FRAME_DELETE:int = 7;
		public static const FRAME_SHIFT_LEFT:int = 8;
		public static const FRAME_SHIFT_RIGHT:int = 9;
		public static const FRAME_DEBUG = 10;
		
		//* Constants *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new EditorFunction_MC object
		//
		//Parameters:
		//	x:int = the x coordinate to draw the movieclip at
		//	y:int = the y coordinate to draw the movieclip at
		//	frame:int = the frame to draw the movieclip at
		//
		//Returns:		reference to the new object
		//---------------
		public function EditorFunction_MC(x:int, y:int, frame:int)
		{
			this.x = x;
			this.y = y;
			this.gotoAndStop(frame);
		}

		//* Initialization *//
	}
}