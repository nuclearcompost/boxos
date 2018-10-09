package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	
	//-----------------------
	//Purpose:				The top-level class for a single game session
	//
	//Public Properties:
	//	none
	//
	//Public Methods:
	//	AddBoxoGraphics(boxo:Boxo_MC):void
	//	OnLoadCursorClick(event:MouseEvent):void
	//-----------------------
	public class GameSession extends MovieClip 
	{
		
		// Constants //
		public static const BOXO_SIZE:int = 50;
		public static const MAX_X:int = 11;
		public static const MAX_Y:int = 11;
		public static const NUM_PUZZLE_LEVELS = 3;
		public static const PUZZLE_DATA:Array = new Array(new Array(new Array(0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 3),
																    new Array(0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 5, 0, 0, 0, 0, 5, 0, 0, 5, 5),
																    new Array(4, 0, 1, 1, 0, 0, 0, 0, 4, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 4, 1, 0, 0, 0, 0, 0, 0, 1, 4),
																    new Array(0, 0, 0, 0, 5, 5, 0, 5, 0, 5, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2)
																    ),
														  new Array(new Array(0, 0, 5, 0, 1, 0, 0, 0, 0, 0, 5),
																    new Array(5, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 0, 0, 5, 0, 0, 5, 4, 5),
																    new Array(0, 0, 5, 0, 0, 0, 0, 0, 0, 4, 0),
																    new Array(0, 0, 5, 0, 0, 0, 0, 0, 3, 4, 5),
																    new Array(0, 0, 5, 0, 0, 0, 0, 0, 3, 2, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2),
																    new Array(0, 5, 5, 0, 3, 5, 0, 0, 5, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0),
																    new Array(0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0)
																    ),
														  new Array(new Array(0, 3, 4, 1, 4, 1, 4, 1, 4, 2, 2),
																    new Array(0, 0, 3, 4, 1, 4, 1, 4, 1, 4, 2),
																    new Array(0, 3, 4, 1, 4, 1, 4, 1, 4, 2, 2),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 4, 2, 2, 5, 0, 5, 2, 5),
																    new Array(0, 0, 0, 0, 2, 2, 0, 5, 2, 5, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
																    new Array(0, 4, 1, 4, 1, 4, 1, 3, 0, 3, 3),
																    new Array(0, 1, 4, 1, 4, 1, 4, 3, 3, 0, 3)
																    )
														  );
		
		public static const GRID_OFFSET_X:int = 250;
		public static const GRID_OFFSET_Y:int = 50;
		
		// Public Properties //
		
		//* Public Properties *//
		
		
		// Private Properties //
		
		/// Data Properties ///
		private var _animationRunning:Boolean;
		private var _curFileIndex:int;
		private var _cursorLoad:int;
		private var _curTileList:Array;
		private var _curTileListValue:int;
		private var _gravity:int;  // 1 = up, 2 = down, 3 = left, 4 = right
		private var _grid:Array;
		private var _main:Main;
		private var _mode:String;
		private var _numCustomLevels:int;
		private var _prevMouseLocation:Coord2D;
		private var _puzzleLevel:int;
		private var _saveGrid:Array;
		private var _score:int;
		
		///* Data Properties *///
		
		/// Graphics Properties ///
		private var _animationGraphics:MovieClip;
		private var _backBtn:Back_Btn
		private var _backgroundGraphics:Background_MC;
		private var _cursorLoadGraphics:MovieClip;  // container
		private var _customSelectBackGraphics:EditorFunction_MC;
		private var _customSelectDesignGraphics:EditorFunction_MC;
		private var _customSelectLeftArrowGraphics:EditorArrow_MC;
		private var _customSelectRightArrowGraphics:EditorArrow_MC;
		private var _customSelectPlayGraphics:EditorFunction_MC;
		private var _editorDoneGraphics:EditorFunction_MC;
		private var _editorModeGraphics:EditorFunction_MC;
		private var _endGame:EndGame_MC;
		private var _gravArrowGraphics:GravArrow_MC;
		private var _gridGraphics:MovieClip;  // container
		private var _interfacePanelGraphics:InterfacePanel_MC;
		private var _manageCustomDeleteGraphics:EditorFunction_MC;
		private var _manageCustomShiftLeftGraphics:EditorFunction_MC;
		private var _manageCustomShiftRightGraphics:EditorFunction_MC;
		private var _playAgain:PlayAgain_Btn;
		private var _debugBtnGraphics:EditorFunction_MC;
		
		///* Graphics Properties *///
		
		//* Private Properties *//
		
		
		// Initialization //
		
		//---------------
		//Purpose:		Construct a new GameSession object
		//
		//Parameters:
		//	main:Main = the document class for this swf movie that the game session should run attached to
		//	mode:String = the game mode to run { "arcade", "editCustomSelect", "levelEditor", "manageCustom", "playAllCustom", "playCustomSelect", "puzzle" }
		//
		//Returns:		reference to the new object
		//---------------
		public function GameSession(main:Main, mode:String)
		{
			_main = main;
			_mode = mode;
			
			// Initialize Data //
			_animationRunning = false;
			_grid = new Array(GameSession.MAX_X);
			_saveGrid = new Array(GameSession.MAX_X);
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				_grid[x] = new Array(GameSession.MAX_Y);
				_saveGrid[x] = new Array(GameSession.MAX_Y);
			}
			_curTileList = new Array();
			_curTileListValue = 0;
			_gravity = 2;  // start gravity going down
			
			_numCustomLevels = GetNextFileIndex();
			_prevMouseLocation = new Coord2D(-1, -1);
			_puzzleLevel = 0;
			_score = 0;
						
			if (_mode == "levelEditor")
			{
				_curFileIndex = _numCustomLevels;
			}
			
			// Initialize Graphics //
			_backgroundGraphics = new Background_MC();
			this.addChild(_backgroundGraphics);
			
			_gridGraphics = new MovieClip();  // container
			this.addChild(_gridGraphics);
			
			_animationGraphics = new MovieClip();
			this.addChild(_animationGraphics);
			
			_interfacePanelGraphics = new InterfacePanel_MC();
			this.addChild(_interfacePanelGraphics);
			_interfacePanelGraphics._score.text = _score.toString();
			_interfacePanelGraphics._value.text = "0";

			if (_mode == "arcade")
			{
				InitGridRandom();
			}
			else if (_mode == "puzzle")
			{
				InitGridPuzzle();
			}
			else if (_mode == "levelEditor")
			{
				InitGridEmpty();
			}
			else if (_mode == "playAllCustom" || _mode == "playCustomSelect" || _mode == "editCustomSelect" || _mode == "manageCustom")
			{
				_curFileIndex = 0;
				InitGridFromFile();
			}
			else
			{
				trace("invalid mode!");
			}
			
			RepaintInterface();
			
			if (_mode != "levelEditor" && _mode != "playCustomSelect" && _mode != "editCustomSelect" && _mode != "manageCustom")
			{
				this.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			}
			
			this.addEventListener(MouseEvent.CLICK, OnMouseClick);
		}
		
		//---------------
		//Purpose:		Initialize the grid to have all empty boxos
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function InitGridEmpty():void
		{
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					_grid[x][y] = new Boxo(this, 0, GameSession.GRID_OFFSET_X + (GameSession.BOXO_SIZE * x), GameSession.GRID_OFFSET_Y + (GameSession.BOXO_SIZE * y));
				}
			}
		}
		
		//---------------
		//Purpose:		Initialize the grid from custom file data at the current file index
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function InitGridFromFile():void
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)  // error, no puzzle data!
			{
				trace("Error: no data to load!");
				return;
			}
			else if (_curFileIndex < saveFile.data.puzzle_data.length)  // load existing puzzle data
			{
				for (var x:int = 0; x < GameSession.MAX_X; x++)
				{
					for (var y:int = 0; y < GameSession.MAX_Y; y++)
					{
						var iX:int = GameSession.GRID_OFFSET_X + (GameSession.BOXO_SIZE * x);
						var iY:int = GameSession.GRID_OFFSET_Y + (GameSession.BOXO_SIZE * y);
						_grid[x][y] = new Boxo(this, saveFile.data.puzzle_data[_curFileIndex][x][y], iX, iY);
					}
				}
			}
			saveFile.close();
		}
		
		//---------------
		//Purpose:		Initialize the grid from puzzle data for the current puzzle level
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function InitGridPuzzle():void
		{
			if (_puzzleLevel < 0 || _puzzleLevel >= GameSession.NUM_PUZZLE_LEVELS)
			{
				return;
			}
			
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					var iX:int = GameSession.GRID_OFFSET_X + (GameSession.BOXO_SIZE * x);
					var iY:int = GameSession.GRID_OFFSET_Y + (GameSession.BOXO_SIZE * y);
					_grid[x][y] = new Boxo(this, GameSession.PUZZLE_DATA[_puzzleLevel][x][y], iX, iY);
				}
			}
		}
		
		//---------------
		//Purpose:		Initialize the grid with random, non-empty boxos
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function InitGridRandom():void
		{
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					var iX:int = GameSession.GRID_OFFSET_X + (GameSession.BOXO_SIZE * x);
					var iY:int = GameSession.GRID_OFFSET_Y + (GameSession.BOXO_SIZE * y);
					_grid[x][y] = new Boxo(this, Math.floor(Math.random() * Boxo.NUM_TYPES) + 1, iX, iY);
				}
			}
		}
		
		//* Initialization *//
		
		
		// Public Methods //
		
		//---------------
		//Purpose:		Add a boxo_MC to the gridGraphics entry in the display list
		//
		//Parameters:
		//	boxo:Boxo_MC = the movieclip to add to the display list in gridGraphics
		//
		//Returns:		void
		//---------------
		public function AddBoxoGraphics(boxo:Boxo_MC):void
		{
			_gridGraphics.addChild(boxo);
		}
		
		public function RemoveBoxoGraphics(boxo:Boxo_MC):void
		{
			_gridGraphics.removeChild(boxo);
		}
		
		//---------------
		//Purpose:		Load the cursor with a boxo type - for level editor
		//
		//Parameters:
		//	event:MouseEvent - the event triggered when a Boxo_MC was clicked
		//
		//Returns:		void
		//---------------
		public function OnLoadCursorClick(event:MouseEvent):void
		{
			if (event.target is Boxo_MC)
			{
				_cursorLoad = event.target.type;
			}
		}
		
		public function ResolveRemoveBoxosAnimation():void
		{
			// remove the data and graphics from the removed boxos
			for (var i:int = 0; i < _curTileList.length; i++)
			{
				var oRemoveCoord:Coord2D = Coord2D(_curTileList[i]);
				var oRemoveBoxo:Boxo = Boxo(_grid[oRemoveCoord.x][oRemoveCoord.y]);
				oRemoveBoxo.type = 0;
			}
			
			// build the list of boxo shifts needed
			var lBoxoShifts:Array = new Array();
			
			if (_gravity == 1)  // up
			{
				for (var iX:int = 0; iX < _grid.length; iX++)
				{
					var iColumnShiftCount:int = 0;
					
					for (var iY:int = 0; iY < _grid[iX].length; iY++)
					{
						var oBoxo:Boxo = Boxo(_grid[iX][iY]);
						
						if (oBoxo.type == 0)
						{
							iColumnShiftCount--;
							continue;
						}
						
						if (iColumnShiftCount < 0)
						{
							lBoxoShifts.push(new BoxoShift(iX, iY, 0, iColumnShiftCount, oBoxo.type));
						}
					}
				}
			}
			else if (_gravity == 2) // down
			{
				for (iX = 0; iX < _grid.length; iX++)
				{
					iColumnShiftCount = 0;
					
					for (iY = _grid[iX].length - 1; iY >= 0; iY--)
					{
						oBoxo = Boxo(_grid[iX][iY]);
						
						if (oBoxo.type == 0)
						{
							iColumnShiftCount++;
							continue;
						}
						
						if (iColumnShiftCount > 0)
						{
							lBoxoShifts.push(new BoxoShift(iX, iY, 0, iColumnShiftCount, oBoxo.type));
						}
					}
				}
			}
			else if (_gravity == 3) // left
			{
				for (iY = 0; iY < _grid[0].length; iY++)
				{
					iColumnShiftCount = 0;
					
					for (iX = 0; iX < _grid.length; iX++)
					{
						oBoxo = Boxo(_grid[iX][iY]);
						
						if (oBoxo.type == 0)
						{
							iColumnShiftCount--;
							continue;
						}
						
						if (iColumnShiftCount < 0)
						{
							lBoxoShifts.push(new BoxoShift(iX, iY, iColumnShiftCount, 0, oBoxo.type));
						}
					}
				}
			}
			else if (_gravity == 4) // right
			{
				for (iY = 0; iY < _grid[0].length; iY++)
				{
					iColumnShiftCount = 0;
					
					for (iX = _grid.length - 1; iX >= 0; iX--)
					{
						oBoxo = Boxo(_grid[iX][iY]);
						
						if (oBoxo.type == 0)
						{
							iColumnShiftCount++;
							continue;
						}
						
						if (iColumnShiftCount > 0)
						{
							lBoxoShifts.push(new BoxoShift(iX, iY, iColumnShiftCount, 0, oBoxo.type));
						}
					}
				}
			}
			
			// clear all of the shifting boxos from the grid
			for (i = 0; i < lBoxoShifts.length; i++)
			{
				var oBoxoShift:BoxoShift = BoxoShift(lBoxoShifts[i]);
				_grid[oBoxoShift.startGridX][oBoxoShift.startGridY].type = 0;
			}
			
			RepaintGrid();
			
			// start the shift animation
			var oAnimation:ShiftBoxoAnimation = new ShiftBoxoAnimation(this, _animationGraphics, lBoxoShifts, 20);
		}
		
		public function ResolveShiftBoxoAnimation(boxoShifts:Array):void
		{
			// score upkeep
			_score += _curTileListValue;
			_interfacePanelGraphics._score.text = _score.toString();
			
			// update the grid state to be the post-shift values
			for (var i:int = 0; i < boxoShifts.length; i++)
			{
				var oBoxoShift:BoxoShift = BoxoShift(boxoShifts[i]);
				var iEndX:int = oBoxoShift.startGridX + oBoxoShift.deltaGridX;
				var iEndY:int = oBoxoShift.startGridY + oBoxoShift.deltaGridY;
				_grid[iEndX][iEndY].type = oBoxoShift.type;
			}
			
			_animationRunning = false;
			
			//Refresh the highlighted tile values
			var oMouseLocation:Coord2D = Coord2D(_curTileList[0]);
			ShowNeighbors(oMouseLocation);
			
			// See if the level is over
			if (IsGridEmpty())
			{
				if (_mode == "puzzle")
				{
					_puzzleLevel++;
					InitGridPuzzle();
					
					if (_puzzleLevel == GameSession.NUM_PUZZLE_LEVELS)
					{
						EndGame();
					}
				}
				else if (_mode == "arcade" || _mode == "playCustom")
				{
					EndGame();
				}
				else if (_mode == "playAllCustom")
				{
					_curFileIndex++;
					if (_curFileIndex >= GetNextFileIndex())
					{
						EndGame();
					}
					else
					{
						InitGridFromFile();
					}
				}
			}
			
			RepaintGrid();
		}
		
		//* Public Methods *//
		
		
		// Protected Methods //
		
		/// Core Functionality ///
		
		//---------------
		//Purpose:		Changes the type of the boxo clicked on in the level editor to the current cursor load type
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function ChangeTileType():void
		{
			var iMousePixelX:int = this.mouseX;
			var iMousePixelY:int = this.mouseY;
			var iMouseTileX:int = Math.floor((iMousePixelX - 225) / GameSession.BOXO_SIZE);
			var iMouseTileY:int = Math.floor((iMousePixelY - 25) / GameSession.BOXO_SIZE);
			
			if (iMouseTileX > -1 && iMouseTileX < GameSession.MAX_X && iMouseTileY > -1 && iMouseTileY < GameSession.MAX_Y)
			{
				_grid[iMouseTileX][iMouseTileY].type = _cursorLoad;
				RepaintGrid();
			}
		}
		
		//---------------
		//Purpose:		Display the end game screen
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function EndGame():void
		{
			_endGame = new EndGame_MC();
			_endGame.x = 500;
			_endGame.y = 200;
			_endGame._score.text = _score.toString();
			this.addChild(_endGame);
			
			_playAgain = new PlayAgain_Btn();
			_playAgain.x = 510;
			_playAgain.y = 370;
			_playAgain.addEventListener(MouseEvent.CLICK, OnPlayAgainClick);
			this.addChild(_playAgain);
			
			_backBtn = new Back_Btn();
			_backBtn.x = 510;
			_backBtn.y = 465;
			_backBtn.addEventListener(MouseEvent.CLICK, OnBackClick);
			this.addChild(_backBtn);
		}
		
		//---------------
		//Purpose:		Remove all highlighting from the grid
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function HideNeighbors():void
		{
			for (var i:int = 0; i < _curTileList.length; i++)
			{
				_grid[_curTileList[i].x][_curTileList[i].y].lit = false;
			}
		}
		
		//---------------
		//Purpose:		See if the grid contains any non-zero type boxos
		//
		//Parameters:
		//	none
		//
		//Returns:		True if the grid contains no non-zero type boxos; false otherwise
		//---------------
		protected function IsGridEmpty():Boolean
		{
			for (var iCurX:int = 0; iCurX < GameSession.MAX_X; iCurX++)
			{
				for (var iCurY:int = 0; iCurY < GameSession.MAX_Y; iCurY++)
				{
					if (_grid[iCurX][iCurY].type > 0)
					{
						return false;
					}
				}
			}
			return true;
		}
		
		//---------------
		//Purpose:		Remove all highlighted neighbor boxos from the grid
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function RemoveTiles():void
		{
			if (_curTileList.length == 0)
			{
				return;
			}
			
			// change gravity based on type of tile being removed
			var iCurX:int = Coord2D(_curTileList[0]).x;
			var iCurY:int = Coord2D(_curTileList[0]).y;
			var oMouseCoord:Coord2D = new Coord2D(iCurX, iCurY);
			var iCurType:int = _grid[iCurX][iCurY].type;
			
			if (iCurType == 0)
			{
				return;
			}
			
			_animationRunning = true;
			
			if (iCurType > 0 && iCurType < Boxo.NUM_TYPES)
			{
				_gravity = iCurType;
				_gravArrowGraphics.Repaint(_gravity);
			}
			
			HideNeighbors();
			RepaintGrid();
			
			var oRemoveBoxosAnimation:RemoveBoxosAnimation = new RemoveBoxosAnimation(this, _animationGraphics, _grid, _curTileList);
			
			
		} // function RemoveTiles()
		
		//---------------
		//Purpose:		Highlights a whole contiguous group of adjacent same-type boxos
		//
		//Parameters:
		//	seedTile:Coord2D = the grid coordinates of the starting boxo to highlight
		//
		//Returns:		void
		//---------------
		protected function ShowNeighbors(seedTile:Coord2D):void
		{
			// create arrays
			_curTileList = new Array();
			var lNewList:Array = new Array();
			
			// don't do any work if we're off of the grid
			if (!(seedTile.x >= 0 && seedTile.x < GameSession.MAX_X && seedTile.y >= 0 && seedTile.y < GameSession.MAX_Y))
			{
				_curTileListValue = 0;
				_interfacePanelGraphics._value.text = _curTileListValue.toString();
				return;
			}
			
			// don't do any work if we're over a blank tile
			if (_grid[seedTile.x][seedTile.y].type == 0)
			{
				_curTileListValue = 0;
				_interfacePanelGraphics._value.text = _curTileListValue.toString();
				return;
			}
			
			// add the seed tile to the new list
			lNewList[0] = seedTile;

			// begin main algorithm
			while(lNewList[0] != null)
			{
				// add the current tile to the final list
				_curTileList[_curTileList.length] = lNewList[0];
				
				// take the next tile off of the new list
				var iCurX:int = lNewList[0].x;
				var iCurY:int = lNewList[0].y;
				var iCurTileType:int = _grid[iCurX][iCurY].type;
				
				// light up each tile that's in the FinalList
				_grid[iCurX][iCurY].lit = true;

				// scan the 4 adjacent tiles and add any similar tiles to the new list
				if (iCurX > 0)
				{
					if (_grid[iCurX - 1][iCurY].type == iCurTileType)
					{
						lNewList[lNewList.length] = new Coord2D(iCurX - 1, iCurY);
					}
				}
				if (iCurX < GameSession.MAX_X - 1)
				{
					if (_grid[iCurX + 1][iCurY].type == iCurTileType)
					{
						lNewList[lNewList.length] = new Coord2D(iCurX + 1, iCurY);
					}
				}
				if (iCurY > 0)
				{
					if (_grid[iCurX][iCurY - 1].type == iCurTileType)
					{
						lNewList[lNewList.length] = new Coord2D(iCurX, iCurY - 1);
					}
				}
				if (iCurY < GameSession.MAX_Y - 1)
				{
					if (_grid[iCurX][iCurY + 1].type == iCurTileType)
					{
						lNewList[lNewList.length] = new Coord2D(iCurX, iCurY + 1);
					}
				}

				// remove all entries from the new list that are already in the final list
				for (var n:int = lNewList.length - 1; n >= 0; n--)
				{
					for (var f:int = 0; f < _curTileList.length; f++)
					{
						if (Coord2D(lNewList[n]).Equals(Coord2D(_curTileList[f])))
						{
							lNewList.splice(n, 1);
							break;
						}
					}
				}
			}
			
			
			// calculate how much the currently highlighted block is worth
			if (_curTileList.length == 1)
			{
				_curTileListValue = -150;
			}
			else
			{
				_curTileListValue = _curTileList.length * _curTileList.length * 10;
			}
			_interfacePanelGraphics._value.text = _curTileListValue.toString();
		}
		
		///* Core Functionality *///
		
		
		/// Event Handlers ///
		
		protected function OnBackClick(event:MouseEvent):void
		{
			_main.ModeSwapGameToTitle();
		}
		
		protected function OnCustomSelectBackClick(event:MouseEvent):void
		{
			_main.ModeSwapGameToCustom();
		}
		
		protected function OnCustomSelectDesignClick(event:MouseEvent):void
		{
			_mode = "levelEditor";
			RepaintInterface();
		}
		
		protected function OnCustomSelectLeftArrowClick(event:MouseEvent):void
		{
			if (_numCustomLevels == 0)
			{
				return;
			}
			
			_curFileIndex--;
			
			if (_curFileIndex < 0)
			{
				_curFileIndex = _numCustomLevels - 1;
			}
			
			InitGridFromFile();
			RepaintGrid();
			RepaintInterface();
		}
		
		protected function OnCustomSelectPlayClick(event:MouseEvent):void
		{
			_mode = "playCustom";
			RepaintInterface();
			this.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
		}
		
		protected function OnCustomSelectRightArrowClick(event:MouseEvent):void
		{
			if (_numCustomLevels == 0)
			{
				return;
			}
			
			_curFileIndex++;
			
			if (_curFileIndex >= _numCustomLevels)
			{
				_curFileIndex = 0;
			}
			
			InitGridFromFile();
			RepaintGrid();
			RepaintInterface();
		}

		protected function OnEditorDoneClick(event:MouseEvent):void
		{
			// save the current puzzle
			SaveGridToFile();
			
			// return to the custom mode screen
			_main.ModeSwapNewCustomToCustom();
		}
		
		protected function OnEditorModeClick(event:MouseEvent):void
		{
			if (_mode == "levelEditor")
			{
				_mode = "levelEditorPlay";
				_gravity = 2;
				LoadSaveGridFromRealGrid();  // save the existing grid
				this.addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
				RepaintInterface();
			}
			else if (_mode == "levelEditorPlay")
			{
				_mode = "levelEditor";
				_cursorLoad = 0;
				LoadRealGridFromSaveGrid();  // restore the original grid
				RepaintGrid();
				this.removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
				RepaintInterface();
			}
		}
		
		protected function OnManageCustomDeleteClick(event:MouseEvent):void
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)
			{
				return;
			}
			else
			{
				saveFile.data.puzzle_data.splice(_curFileIndex, 1);
				_numCustomLevels--;
				if (_curFileIndex == _numCustomLevels && _curFileIndex > 0)
				{
					_curFileIndex--;
				}
				if (_numCustomLevels > 0)
				{
					InitGridFromFile();
				}
				else
				{
					saveFile.data.puzzle_data = null;
					InitGridEmpty();
				}
				RepaintGrid();
				RepaintInterface();
			}
			saveFile.close();
		}
		
		protected function OnManageCustomShiftLeftClick(event:MouseEvent):void
		{
			if (_numCustomLevels < 2)
			{
				return;
			}
			
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)
			{
				return;
			}
			else
			{
				var oShiftArray:Array = new Array(GameSession.MAX_X);
				for (var x:int = 0; x < GameSession.MAX_X; x++)
				{
					oShiftArray[x] = new Array(GameSession.MAX_Y);
					for (var y:int = 0; y < GameSession.MAX_Y; y++)
					{
						oShiftArray[x][y] = saveFile.data.puzzle_data[_curFileIndex][x][y];
					}
				}
				saveFile.data.puzzle_data.splice(_curFileIndex, 1);
				
				if (_curFileIndex == 0)
				{
					saveFile.data.puzzle_data.splice(_numCustomLevels - 1, 0, new Array(GameSession.MAX_X));
					
					for (x = 0; x < GameSession.MAX_X; x++)
					{
						saveFile.data.puzzle_data[_numCustomLevels - 1][x] = new Array(GameSession.MAX_Y);
						
						for (y = 0; y < GameSession.MAX_Y; y++)
						{
							saveFile.data.puzzle_data[_numCustomLevels - 1][x][y] = oShiftArray[x][y];
						}
					}
					_curFileIndex = _numCustomLevels - 1;
				}
				else
				{
					saveFile.data.puzzle_data.splice(_curFileIndex - 1, 0, new Array(GameSession.MAX_X));
					
					for (x = 0; x < GameSession.MAX_X; x++)
					{
						saveFile.data.puzzle_data[_curFileIndex - 1][x] = new Array(GameSession.MAX_Y);
						
						for (y = 0; y < GameSession.MAX_Y; y++)
						{
							saveFile.data.puzzle_data[_curFileIndex - 1][x][y] = oShiftArray[x][y];
						}
					}
					_curFileIndex--;
				}
				
				RepaintInterface();
			}
			
			saveFile.close();
		}
		
		protected function OnManageCustomShiftRightClick(event:MouseEvent):void
		{
			if (_numCustomLevels < 2)
			{
				return;
			}
			
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)
			{
				return;
			}
			else
			{
				var oShiftArray:Array = new Array(GameSession.MAX_X);
				for (var x:int = 0; x < GameSession.MAX_X; x++)
				{
					oShiftArray[x] = new Array(GameSession.MAX_Y);
					for (var y:int = 0; y < GameSession.MAX_Y; y++)
					{
						oShiftArray[x][y] = saveFile.data.puzzle_data[_curFileIndex][x][y];
					}
				}
				saveFile.data.puzzle_data.splice(_curFileIndex, 1);
				
				if (_curFileIndex == _numCustomLevels - 1)
				{					
					saveFile.data.puzzle_data.splice(0, 0, new Array(GameSession.MAX_X));
					
					for (x = 0; x < GameSession.MAX_X; x++)
					{
						saveFile.data.puzzle_data[0][x] = new Array(GameSession.MAX_Y);
						
						for (y = 0; y < GameSession.MAX_Y; y++)
						{
							saveFile.data.puzzle_data[0][x][y] = oShiftArray[x][y];
						}
					}
					_curFileIndex = 0;
				}
				else
				{
					saveFile.data.puzzle_data.splice(_curFileIndex + 1, 0, new Array(GameSession.MAX_X));
					
					for (x = 0; x < GameSession.MAX_X; x++)
					{
						saveFile.data.puzzle_data[_curFileIndex + 1][x] = new Array(GameSession.MAX_Y);
						
						for (y = 0; y < GameSession.MAX_Y; y++)
						{
							saveFile.data.puzzle_data[_curFileIndex + 1][x][y] = oShiftArray[x][y];
						}
					}
					_curFileIndex++;
				}
				RepaintInterface();
			}
			saveFile.close();
		}
		
		protected function OnMouseClick(event:MouseEvent):void
		{
			event.stopPropagation();
			
			if (_animationRunning == true)
			{
				return;
			}
			
			if (_mode == "levelEditor")
			{
				ChangeTileType();
			}
			else
			{
				RemoveTiles();
			}
		}
		
		protected function OnMouseMove(event:MouseEvent):void
		{
			event.stopPropagation();
			
			if (_animationRunning == true)
			{
				return;
			}
			
			// get the current tile we're over
			var iMousePixelX:int = this.mouseX;
			var iMousePixelY:int = this.mouseY;
			var iMouseTileX:int = Math.floor((iMousePixelX - 225) / GameSession.BOXO_SIZE);
			var iMouseTileY:int = Math.floor((iMousePixelY - 25) / GameSession.BOXO_SIZE);
			
			// see if we're on a new tile than we were before
			var oNewLocation:Coord2D = new Coord2D(iMouseTileX, iMouseTileY);
			if (!oNewLocation.Equals(_prevMouseLocation))
			{
				// see if the current tile we're over is in the range of real tiles
				if (iMouseTileX > -1 && iMouseTileX < GameSession.MAX_X && iMouseTileY > -1 && iMouseTileY < GameSession.MAX_Y)
				{
					HideNeighbors();
					ShowNeighbors(oNewLocation);
				}
				else
				{
					HideNeighbors();
					_curTileList = new Array();
					_curTileListValue = 0;
					_interfacePanelGraphics._value.text = "0";
				}
			}
			_prevMouseLocation = oNewLocation;
		}
		
		protected function OnPlayAgainClick(event:MouseEvent):void
		{
			_score = 0;
			this.removeChild(_endGame);
			this.removeChild(_playAgain);
			this.removeChild(_backBtn);
			if (_mode == "arcade")
			{
				InitGridRandom();
			}
			else if (_mode == "puzzle")
			{
				_puzzleLevel = 0;
				InitGridPuzzle();
			}
			else if (_mode == "playAllCustom")
			{
				_curFileIndex = 0;
				InitGridFromFile();
			}
			else if (_mode == "playCustom")
			{
				InitGridFromFile();
			}
			RepaintInterface();
		}
		
		protected function OnDebugBtnClick(event:MouseEvent):void
		{
			trace("");
			trace("");
			
			var line:String = "";
			
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				if (x == 0)
				{
					line = "new Array(new Array(";
				}
				else
				{
					line = "          new Array(";
				}
				
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					if (y < GameSession.MAX_Y - 1)
					{
						line += (_grid[x][y].type + ", ");
					}
					else
					{
						if (x < GameSession.MAX_X - 1)
						{
							line += (_grid[x][y].type + "),");
						}
						else
						{
							line += (_grid[x][y].type + ")");
						}
					}
				}
				trace(line);
			}
			trace("          )");
		}
		
		///* Event Handlers *///
		
		
		/// File I/O ///
		
		//---------------
		//Purpose:		Destroy all custom puzzle data in the external file
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function DestroyAllFileData():void
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			saveFile.data.puzzle_data = null;

			saveFile.close();
		}
		
		//---------------
		//Purpose:		Returns the next available index in the file of custom puzzle data
		//
		//Parameters:
		//	none
		//
		//Returns:		integer value of the next available file index for the custom puzzle data file
		//---------------
		protected function GetNextFileIndex():int
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)
			{
				return 0;
			}
			else
			{
				return saveFile.data.puzzle_data.length;
			}
			saveFile.close();
		}
		
		//---------------
		//Purpose:		Loads data into the grid from the current file index of the custom puzzle data
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function LoadGridFromFile():void
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			
			if (saveFile.data.puzzle_data == null)  // error, no puzzle data!
			{
				trace("Error: no data to load!");
				return;
			}
			else if (_curFileIndex < saveFile.data.puzzle_data.length)  // load existing puzzle data
			{
				for (var x:int = 0; x < GameSession.MAX_X; x++)
				{
					for (var y:int = 0; y < GameSession.MAX_Y; y++)
					{
						_grid[x][y].type = saveFile.data.puzzle_data[_curFileIndex][x][y];
					}
				}
			}
			saveFile.close();
		}
		
		//---------------
		//Purpose:		Sets the grid type from the saved grid values.  Used to reset the grid back to the design state after a test play session
		//				 in the level editor.
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function LoadRealGridFromSaveGrid():void
		{
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					_grid[x][y].type = _saveGrid[x][y];
				}
			}
		}
		
		//---------------
		//Purpose:		Saves off the current grid into a saved grid so that it can be restored later
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function LoadSaveGridFromRealGrid():void
		{
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					_saveGrid[x][y] = _grid[x][y].type;
				}
			}
		}
		
		//---------------
		//Purpose:		Saves the current grid to the next index in the custom puzzle data file
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function SaveGridToFile():void
		{
			var saveFile:SharedObject = SharedObject.getLocal("BoxosCoreData");
			var x:int;
			var y:int;
			
			if (IsGridEmpty())
			{
				return;
			}
			
			if (saveFile.data.puzzle_data == null) // first puzzle in the save file
			{
				saveFile.data.puzzle_data = new Array();
				saveFile.data.puzzle_data[0] = new Array(GameSession.MAX_X);
				for (x = 0; x < GameSession.MAX_X; x++)
				{
					saveFile.data.puzzle_data[0][x] = new Array(GameSession.MAX_Y);
					for (y = 0; y < GameSession.MAX_Y; y++)
					{
						saveFile.data.puzzle_data[0][x][y] = _grid[x][y].type;
					}
				}
			}
			else if (_curFileIndex < saveFile.data.puzzle_data.length) // overwriting an exising puzzle in the save file
			{
				for (x = 0; x < GameSession.MAX_X; x++)
				{
					for (y = 0; y < GameSession.MAX_Y; y++)
					{
						saveFile.data.puzzle_data[_curFileIndex][x][y] = _grid[x][y].type;
					}
				}
			}
			else if (_curFileIndex == saveFile.data.puzzle_data.length) // adding a new puzzle to the end of the existing file
			{
				saveFile.data.puzzle_data[_curFileIndex] = new Array(GameSession.MAX_X);
				for (x = 0; x < GameSession.MAX_X; x++)
				{
					saveFile.data.puzzle_data[_curFileIndex][x] = new Array(GameSession.MAX_Y);
					for (y = 0; y < GameSession.MAX_Y; y++)
					{
						saveFile.data.puzzle_data[_curFileIndex][x][y] = _grid[x][y].type;
					}
				}
				
			}
			saveFile.close();
			_numCustomLevels++;
		}
		
		///* File I/O *///
		
		
		/// Graphics ///
		
		//---------------
		//Purpose:		Remove all graphics for the interface
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function EraseInterface():void
		{
			if (_cursorLoadGraphics != null && this.contains(_cursorLoadGraphics))
			{
				this.removeChild(_cursorLoadGraphics);
			}
			
			if (_editorDoneGraphics != null && this.contains(_editorDoneGraphics))
			{
				this.removeChild(_editorDoneGraphics);
			}
			
			if (_editorModeGraphics != null && this.contains(_editorModeGraphics))
			{
				this.removeChild(_editorModeGraphics);
			}
			
			if (_gravArrowGraphics != null && this.contains(_gravArrowGraphics))
			{
				this.removeChild(_gravArrowGraphics);
			}
			
			if (_customSelectLeftArrowGraphics != null && this.contains(_customSelectLeftArrowGraphics))
			{
				this.removeChild(_customSelectLeftArrowGraphics);
			}
			
			if (_customSelectRightArrowGraphics != null && this.contains(_customSelectRightArrowGraphics))
			{
				this.removeChild(_customSelectRightArrowGraphics);
			}
			
			if (_customSelectPlayGraphics != null && this.contains(_customSelectPlayGraphics))
			{
				this.removeChild(_customSelectPlayGraphics);
			}
			
			if (_customSelectBackGraphics != null && this.contains(_customSelectBackGraphics))
			{
				this.removeChild(_customSelectBackGraphics);
			}
			
			if (_customSelectDesignGraphics != null && this.contains(_customSelectDesignGraphics))
			{
				this.removeChild(_customSelectDesignGraphics);
			}
			
			if (_manageCustomShiftLeftGraphics != null && this.contains(_manageCustomShiftLeftGraphics))
			{
				this.removeChild(_manageCustomShiftLeftGraphics);
			}
			
			if (_manageCustomShiftRightGraphics != null && this.contains(_manageCustomShiftRightGraphics))
			{
				this.removeChild(_manageCustomShiftRightGraphics);
			}
			
			if (_manageCustomDeleteGraphics != null && this.contains(_manageCustomDeleteGraphics))
			{
				this.removeChild(_manageCustomDeleteGraphics);
			}
			
			if (_debugBtnGraphics != null && this.contains(_debugBtnGraphics))
			{
				this.removeChild(_debugBtnGraphics);
			}
		}
		
		//---------------
		//Purpose:		Paint the interface based on all current state
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function PaintInterface():void
		{
			if (_mode == "arcade" || _mode == "puzzle" || _mode == "playAllCustom"  || _mode == "playCustom")
			{
				_interfacePanelGraphics.gotoAndStop(1);
				_interfacePanelGraphics._score.text = _score.toString();
				_interfacePanelGraphics._value.text = "0";
				_gravArrowGraphics = new GravArrow_MC(100, 525, _gravity);
				this.addChild(_gravArrowGraphics);
			}
			else if (_mode == "levelEditor")
			{
				_interfacePanelGraphics.gotoAndStop(2);
				
				_editorDoneGraphics = new EditorFunction_MC(100, 575, EditorFunction_MC.FRAME_SAVE);
				_editorDoneGraphics.addEventListener(MouseEvent.CLICK, OnEditorDoneClick);
				this.addChild(_editorDoneGraphics);
				
				_editorModeGraphics = new EditorFunction_MC(100, 25, EditorFunction_MC.FRAME_TEST);
				_editorModeGraphics.addEventListener(MouseEvent.CLICK, OnEditorModeClick);
				this.addChild(_editorModeGraphics);
				
				_debugBtnGraphics = new EditorFunction_MC(100, 200, EditorFunction_MC.FRAME_DEBUG);
				_debugBtnGraphics.addEventListener(MouseEvent.CLICK, OnDebugBtnClick);
				this.addChild(_debugBtnGraphics);
				
				var tempX:int = 50;
				var tempY:int = 350;
				var tempGraphics:Boxo_MC;
				_cursorLoadGraphics = new MovieClip();  // container
				this.addChild(_cursorLoadGraphics);
				for (var b:int = 0; b <= Boxo.NUM_TYPES; b++)
				{
					tempGraphics = new Boxo_MC(b, tempX, tempY, false);
					tempGraphics.addEventListener(MouseEvent.CLICK, OnLoadCursorClick);
					_cursorLoadGraphics.addChild(tempGraphics);
					tempX += 100;
					if (tempX == 250)
					{
						tempX = 50;
						tempY += 75;
					}
				}
			}
			else if (_mode == "levelEditorPlay")
			{
				_interfacePanelGraphics.gotoAndStop(3);
				_interfacePanelGraphics._score.text = _score.toString();
				_interfacePanelGraphics._value.text = "0";
				
				_editorModeGraphics = new EditorFunction_MC(100, 25, EditorFunction_MC.FRAME_DESIGN);
				_editorModeGraphics.addEventListener(MouseEvent.CLICK, OnEditorModeClick);
				this.addChild(_editorModeGraphics);
				
				_gravArrowGraphics = new GravArrow_MC(100, 525, _gravity);
				this.addChild(_gravArrowGraphics);
			}
			else if (_mode == "playCustomSelect" || _mode == "editCustomSelect")
			{
				_interfacePanelGraphics.gotoAndStop(2);
				
				_customSelectLeftArrowGraphics = new EditorArrow_MC(50, 450, EditorArrow_MC.FRAME_LEFT);
				_customSelectLeftArrowGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectLeftArrowClick);
				this.addChild(_customSelectLeftArrowGraphics);
				
				_customSelectRightArrowGraphics = new EditorArrow_MC(150, 450, EditorArrow_MC.FRAME_RIGHT);
				_customSelectRightArrowGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectRightArrowClick);
				this.addChild(_customSelectRightArrowGraphics);
				
				if (_mode == "playCustomSelect")
				{
					_customSelectPlayGraphics = new EditorFunction_MC(100, 500, EditorFunction_MC.FRAME_PLAY);
					_customSelectPlayGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectPlayClick);
					this.addChild(_customSelectPlayGraphics);
				}
				else if (_mode == "editCustomSelect")
				{
					_customSelectDesignGraphics = new EditorFunction_MC(100, 500, EditorFunction_MC.FRAME_DESIGN);
					_customSelectDesignGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectDesignClick);
					this.addChild(_customSelectDesignGraphics);
				}
				
				_customSelectBackGraphics = new EditorFunction_MC(100, 550, EditorFunction_MC.FRAME_BACK);
				_customSelectBackGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectBackClick);
				this.addChild(_customSelectBackGraphics);
			}
			else if (_mode == "manageCustom")
			{
				_interfacePanelGraphics.gotoAndStop(4);
				if (_numCustomLevels > 0)
				{
					_interfacePanelGraphics._curFile.text = String(_curFileIndex + 1);
				}
				else
				{
					_interfacePanelGraphics._curFile.text = "0";
				}
				_interfacePanelGraphics._maxFiles.text = String(_numCustomLevels);
				
				_manageCustomShiftLeftGraphics = new EditorFunction_MC(100, 250, EditorFunction_MC.FRAME_SHIFT_LEFT);
				_manageCustomShiftLeftGraphics.addEventListener(MouseEvent.CLICK, OnManageCustomShiftLeftClick);
				this.addChild(_manageCustomShiftLeftGraphics);
				
				_manageCustomShiftRightGraphics = new EditorFunction_MC(100, 300, EditorFunction_MC.FRAME_SHIFT_RIGHT);
				_manageCustomShiftRightGraphics.addEventListener(MouseEvent.CLICK, OnManageCustomShiftRightClick);
				this.addChild(_manageCustomShiftRightGraphics);
				
				_manageCustomDeleteGraphics = new EditorFunction_MC(100, 350, EditorFunction_MC.FRAME_DELETE);
				_manageCustomDeleteGraphics.addEventListener(MouseEvent.CLICK, OnManageCustomDeleteClick);
				this.addChild(_manageCustomDeleteGraphics);
				
				_customSelectLeftArrowGraphics = new EditorArrow_MC(50, 450, EditorArrow_MC.FRAME_LEFT);
				_customSelectLeftArrowGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectLeftArrowClick);
				this.addChild(_customSelectLeftArrowGraphics);
				
				_customSelectRightArrowGraphics = new EditorArrow_MC(150, 450, EditorArrow_MC.FRAME_RIGHT);
				_customSelectRightArrowGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectRightArrowClick);
				this.addChild(_customSelectRightArrowGraphics);
				
				_customSelectBackGraphics = new EditorFunction_MC(100, 550, EditorFunction_MC.FRAME_BACK);
				_customSelectBackGraphics.addEventListener(MouseEvent.CLICK, OnCustomSelectBackClick);
				this.addChild(_customSelectBackGraphics);
				
			}
		}
		
		//---------------
		//Purpose:		Update the graphics for all boxos in the current grid
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function RepaintGrid():void
		{
			for (var x:int = 0; x < GameSession.MAX_X; x++)
			{
				for (var y:int = 0; y < GameSession.MAX_Y; y++)
				{
					_grid[x][y].UpdateGraphics();
				}
			}
		}
		
		//---------------
		//Purpose:		Repaint the interface
		//
		//Parameters:
		//	none
		//
		//Returns:		void
		//---------------
		protected function RepaintInterface():void
		{
			EraseInterface();
			PaintInterface();
		}
		
		///* Graphics *///

		//* Protected Functions *//
	}
}