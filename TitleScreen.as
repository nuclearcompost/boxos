package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class TitleScreen extends MovieClip
	{
		// Private Properties //
		private var _arcadeBtn:ArcadeMode_Btn;
		private var _backGround:TitleBG_MC;
		private var _creditsBtn:Credits_Btn;
		private var _customBtn:Custom_Btn;
		private var _main:Main;
		private var _puzzleBtn:PuzzleMode_Btn;
		
		//* Private Properties *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new TitleScreen object
		//
		//Parameters:
		//	maint:Main = the Main object for the game that this title screen will be associated with
		//
		//Returns:		reference to the new object
		//---------------
		public function TitleScreen(main:Main)
		{
			_main = main;
			
			_backGround = new TitleBG_MC();
			_backGround.x = 400;
			_backGround.y = 300;
			this.addChild(_backGround);
			
			_arcadeBtn = new ArcadeMode_Btn();
			_arcadeBtn.x = 150;
			_arcadeBtn.y = 300;
			_arcadeBtn.addEventListener(MouseEvent.CLICK, OnClickArcadeModeBtn);
			this.addChild(_arcadeBtn);
			
			_puzzleBtn = new PuzzleMode_Btn();
			_puzzleBtn.x = 150;
			_puzzleBtn.y = 400;
			_puzzleBtn.addEventListener(MouseEvent.CLICK, OnClickPuzzleModeBtn);
			this.addChild(_puzzleBtn);
			
			_customBtn = new Custom_Btn();
			_customBtn.x = 150;
			_customBtn.y = 500;
			_customBtn.addEventListener(MouseEvent.CLICK, OnClickCustomBtn);
			this.addChild(_customBtn);
			
			_creditsBtn = new Credits_Btn();
			_creditsBtn.x = 675;
			_creditsBtn.y = 525;
			_creditsBtn.addEventListener(MouseEvent.CLICK, OnClickCreditsBtn);
			this.addChild(_creditsBtn);
			
		}
	
		//* Initialization *//
		
		
		// Protected Methods //
		
		/// Event Handlers ///
		protected function OnClickArcadeModeBtn(event:MouseEvent):void
		{
			_main.ModeSwapTitleToArcadeGame();
		}
		
		protected function OnClickPuzzleModeBtn(event:MouseEvent):void
		{
			_main.ModeSwapTitleToPuzzleGame();
		}
		
		protected function OnClickCustomBtn(event:MouseEvent):void
		{
			_main.ModeSwapTitleToCustom();
		}
		
		protected function OnClickCreditsBtn(event:MouseEvent):void
		{
			_main.ModeSwapTitleToCredits();
		}
		
		///* Event Handlers *///
		
		//* Protected Methods *//
	}
}