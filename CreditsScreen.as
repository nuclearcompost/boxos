package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	
	//-----------------------
	//Purpose:				Manage the Credits screen for the game
	//
	//Public Properties:
	//	none
	//
	//Public Methods:
	//		none
	/// Event Handlers ///
	//		OnClickBackBtn(event:MouseEvent):void
	//		OnClickEditCustomBtn(event:MouseEvent):void
	//		OnClickManageCustomBtn(event:MouseEvent):void
	//		OnClickNewCustomBtn(event:MouseEvent):void
	//		OnClickPlayAllBtn(event:MouseEvent):void
	//		OnClickPlayCustomBtn(event:MouseEvent):void
	//-----------------------
	public class CreditsScreen extends MovieClip
	{
		// Private Properties //
		private var _backBtn:Back_Btn;
		private var _backGround:TitleBG_MC;
		private var _main:Main;
		
		//* Private Properties *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new CreditsScreen object
		//
		//Parameters:
		//	main:Main = the Main object for the game that this custom screen will be associated with
		//	
		//Returns:		reference to the new object
		//---------------
		public function CreditsScreen(main:Main)
		{
			_main = main;
			
			_backGround = new TitleBG_MC();
			_backGround.x = 400;
			_backGround.y = 300;
			_backGround.gotoAndStop(3);
			this.addChild(_backGround);
			
			_backBtn = new Back_Btn();
			_backBtn.x = 400;
			_backBtn.y = 550;
			_backBtn.addEventListener(MouseEvent.CLICK, OnClickBackBtn);
			this.addChild(_backBtn);
		}
	
		//* Initialization *//
		
		
		// Public Methods //
		
		/// Event Handlers ///
		public function OnClickBackBtn(event:MouseEvent):void
		{
			_main.ModeSwapCreditsToTitle();
		}
		
		///* Event Handlers *///
		
		//* Public Methods *//
	}
}