package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	
	//-----------------------
	//Purpose:				Manage the Custom menu for the game
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
	public class CustomScreen extends MovieClip
	{
		// Private Properties //
		private var _backBtn:Back_Btn;
		private var _backGround:TitleBG_MC;
		private var _editCustomBtn:EditCustom_Btn;
		private var _main:Main;
		private var _manageCustomBtn:ManageCustom_Btn;
		private var _newCustomBtn:NewCustom_Btn;
		private var _playAllCustomBtn:PlayAllCustom_Btn;
		private var _playCustomBtn:PlayCustom_Btn;
		
		//* Private Properties *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new CustomScreen object
		//
		//Parameters:
		//	main:Main = the Main object for the game that this custom screen will be associated with
		//	
		//Returns:		reference to the new object
		//---------------
		public function CustomScreen(main:Main)
		{
			_main = main;
			
			_backGround = new TitleBG_MC();
			_backGround.x = 400;
			_backGround.y = 300;
			_backGround.gotoAndStop(2);
			this.addChild(_backGround);
			
			var bHasCustomPuzzleData:Boolean = HasCustomPuzzleData();
			
			if (bHasCustomPuzzleData)
			{
				_playCustomBtn = new PlayCustom_Btn();
				_playCustomBtn.x = 400;
				_playCustomBtn.y = 60;
				_playCustomBtn.addEventListener(MouseEvent.CLICK, OnClickPlayCustomBtn);
				this.addChild(_playCustomBtn);
				
				_playAllCustomBtn = new PlayAllCustom_Btn();
				_playAllCustomBtn.x = 400;
				_playAllCustomBtn.y = 140;
				_playAllCustomBtn.addEventListener(MouseEvent.CLICK, OnClickPlayAllCustomBtn);
				this.addChild(_playAllCustomBtn);
			}
			
			_newCustomBtn = new NewCustom_Btn();
			_newCustomBtn.x = 400;
			_newCustomBtn.y = 260;
			_newCustomBtn.addEventListener(MouseEvent.CLICK, OnClickNewCustomBtn);
			this.addChild(_newCustomBtn);
			
			if (bHasCustomPuzzleData)
			{
				_editCustomBtn = new EditCustom_Btn();
				_editCustomBtn.x = 400;
				_editCustomBtn.y = 340;
				_editCustomBtn.addEventListener(MouseEvent.CLICK, OnClickEditCustomBtn);
				this.addChild(_editCustomBtn);
				
				_manageCustomBtn = new ManageCustom_Btn();
				_manageCustomBtn.x = 400;
				_manageCustomBtn.y = 420;
				_manageCustomBtn.addEventListener(MouseEvent.CLICK, OnClickManageCustomBtn);
				this.addChild(_manageCustomBtn);
			}
			
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
			_main.ModeSwapCustomToTitle();
		}
		
		public function OnClickEditCustomBtn(event:MouseEvent):void
		{
			_main.ModeSwapCustomToEditCustomSelect();
		}
		
		public function OnClickManageCustomBtn(event:MouseEvent):void
		{
			_main.ModeSwapCustomToManageCustom();
		}
		
		public function OnClickNewCustomBtn(event:MouseEvent):void
		{
			_main.ModeSwapCustomToNewCustom();
		}
		
		public function OnClickPlayAllCustomBtn(event:MouseEvent):void
		{
			_main.ModeSwapCustomToPlayAllCustom();
		}
		
		public function OnClickPlayCustomBtn(event:MouseEvent):void
		{
			_main.ModeSwapCustomToPlayCustomSelect();
		}
		
		///* Event Handlers *///
		
		//* Public Methods *//
		
		
		// Protected Methods //
		
		//---------------
		//Purpose:		Check if there is any custom puzzle data in the BoxosCoreData file
		//
		//Parameters:
		//	none
		//
		//Returns:		true if there is any custom puzzle data; false otherwise
		//---------------
		public function HasCustomPuzzleData():Boolean
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)
			{
				saveFile.close();
				return false;
			}
			saveFile.close();
			return true;
		}
		
		//* Protected Methods *//
	}
}