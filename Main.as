package
{
	//-----------------------
	//Purpose:				
	//Public Properties:
	//	
	//Public Methods:
	//	
	//-----------------------
	
		//---------------
		//Purpose:		
		//Parameters:
		//	
		//Returns:		
		//---------------
	
	import flash.display.MovieClip;
	
	//-----------------------
	//Purpose:				Document class & Main Menu for the game
	//
	//Public Properties:
	//	none
	//
	//Public Methods:
	///	ModeSwapFunctions ///
	//		ModeSwapCreditsToTitle():void
	//		ModeSwapCustomToEditCustomSelect():void
	//		ModeSwapCustomToManageCustom():void
	//		ModeSwapCustomToNewCustom():void
	//		ModeSwapCustomToPlayAllCustom():void
	//		ModeSwapCustomToPlayCustomSelect():void
	//		ModeSwapCustomToTitle():void
	//		ModeSwapGameToCustom():void
	//		ModeSwapGameToTitle():void
	//		ModeSwapNewCustomToCustom():void
	//		ModeSwapTitleToArcadeGame():void
	//		ModeSwapTitleToCredits():void
	//		ModeSwapTitleToCustom():void
	//		ModeSwapTitleToPuzzleGame():void
	//-----------------------
	public class Main extends MovieClip
	{
		// Private Properties //
		private var _credits:CreditsScreen;
		private var _custom:CustomScreen;
		private var _game:GameSession;
		private var _title:TitleScreen;
		
		//* Private Properties *//
		
		
		// Initialization //
		
		public function Main()
		{ 
			PutUpTitle();
		}

		//* Initialization *//
		
	
		// Public Methods //
		
		/// Mode Swap functions - Move the program between different modes ///
		
		public function ModeSwapCreditsToTitle():void
		{
			TakeDownCredits();
			PutUpTitle();
		}
		
		public function ModeSwapCustomToEditCustomSelect():void
		{
			TakeDownCustom();
			PutUpGame("editCustomSelect");
		}
		
		public function ModeSwapCustomToManageCustom():void
		{
			TakeDownCustom();
			PutUpGame("manageCustom");
		}
		
		public function ModeSwapCustomToNewCustom():void
		{
			TakeDownCustom();
			PutUpGame("levelEditor");
		}

		public function ModeSwapCustomToPlayAllCustom():void
		{
			TakeDownCustom();
			PutUpGame("playAllCustom");
		}
		
		public function ModeSwapCustomToPlayCustomSelect():void
		{
			TakeDownCustom();
			PutUpGame("playCustomSelect");
		}
		
		public function ModeSwapCustomToTitle():void
		{
			TakeDownCustom();
			PutUpTitle();
		}
		
		public function ModeSwapGameToCustom():void
		{
			TakeDownGame();
			PutUpCustom();
		}
		
		public function ModeSwapGameToTitle():void
		{
			TakeDownGame();
			PutUpTitle();
		}
		
		public function ModeSwapNewCustomToCustom():void
		{
			TakeDownGame();
			PutUpCustom();
		}
		
		public function ModeSwapTitleToArcadeGame():void
		{
			TakeDownTitle();
			PutUpGame("arcade");
		}
		
		public function ModeSwapTitleToCredits():void
		{
			TakeDownTitle();
			PutUpCredits();
		}
		
		public function ModeSwapTitleToCustom():void
		{
			TakeDownTitle();
			PutUpCustom();
		}
		
		public function ModeSwapTitleToPuzzleGame():void
		{
			TakeDownTitle();
			PutUpGame("puzzle");
		}
		
		///* Mode Swap functions *///
		
		//* Public Methods *//
		
		
		// Protected Methods //
		
		//---------------
		//Purpose:		Load the interface for the credits
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function PutUpCredits():void
		{
			_credits = new CreditsScreen(this);
			stage.addChild(_credits);
		}
		
		//---------------
		//Purpose:		Load the interface for the custom menu
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function PutUpCustom():void
		{
			_custom = new CustomScreen(this);
			stage.addChild(_custom);
		}
		
		//---------------
		//Purpose:		Load the interface for a game session
		//
		//Parameters:
		//	mode:String = the game mode { "arcade", "editCustomSelect", "levelEditor", "manageCustom", "playAllCustom", "playCustomSelect", "puzzle" }
		//	
		//Returns:		void
		//---------------
		protected function PutUpGame(mode:String):void
		{
			_game = new GameSession(this, mode);
			stage.addChild(_game);
		}
		
		//---------------
		//Purpose:		Load the interface for the title screen
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function PutUpTitle():void
		{
			_title = new TitleScreen(this);
			stage.addChild(_title);
		}
		
		//---------------
		//Purpose:		Remove the interface for the credits
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function TakeDownCredits():void
		{
			stage.removeChild(_credits);
		}
		
		//---------------
		//Purpose:		Remove the interface for the custom menu
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function TakeDownCustom():void
		{
			stage.removeChild(_custom);
		}
		
		//---------------
		//Purpose:		Remove the interface for the current game session
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function TakeDownGame():void
		{
			stage.removeChild(_game);
		}
		
		//---------------
		//Purpose:		Remove the interface from the title screen
		//
		//Parameters:
		//	none
		//	
		//Returns:		void
		//---------------
		protected function TakeDownTitle():void
		{
			stage.removeChild(_title);
		}
		
		//* Protected Methods *//
	}
}
	