//
//  ChessBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessBoard.h"

typedef NS_ENUM(NSInteger, chessPieceSidesToCheck){
	chessPieceSideTop = 0,
	chessPieceSideRight = 1,
	chessPieceSideBottom = 2,
	chessPieceSideLeft = 3,
	chessPieceSideTopRight = 4,
	chessPieceSideBottomRight = 5,
	chessPieceSideBottomLeft = 6,
	chessPieceSideTopLeft = 7,
	chessPieceSideAll = 8
};// end of eumn

@implementation ChessBoard {
	ChessPiece* _currentBoardBeingPlayed[NumOfRows][NumOfCols];
	ChessMoves* _findingMovesForChessPiecesOnChessBoard;
}// end of implatentation

/*
 
 Init
 
*/

-(instancetype)init {
	if (self = [super init]) {
		_findingMovesForChessPiecesOnChessBoard = [[ChessMoves alloc] init];
	}// end of if
	
	return self;
}// end of default init

/*
 
 Public Methods
 
*/

- (void)checkingKingCheckFromChessPieceStartingAtRow:(NSInteger)startingRow andColumn:(NSInteger)startingColumn {
	NSInteger cellStateMultipler = 0;// holds the multipler in order to both the white chess pieces, which is add 6 to the cell state for the which pieces cell state and the black chess pieces, which is zero since the cell state from 1-6 is for black pieces
	NSArray* locationOfEneimiesKing;// in order to have a quick loop up of the current location of the king in order to tell if they are in troble
	
	// checks who turns it is if white then search for all its pieces
	if ([_currentPlayersTurn isEqualToString:@"White"]) {
		cellStateMultipler = 6;
		locationOfEneimiesKing = [self findAllCellState:11];
	}// end of if
	else {
		cellStateMultipler = 0;
		locationOfEneimiesKing = [self findAllCellState:5];
	}// end of else
	
	_whichPlayerIsInChessCheck = @"White";
}// end of checkingKingCheckFromChessPiece()

-(NSArray*) clearBoardAndSetChessColour:(NSString*)chessColourType {
	NSMutableArray* itemsOnTheBaord = [[NSMutableArray alloc] init];
	NSInteger cellStateMultipler = 0;// holds the multipler in order to both the white chess pieces, which is add 6 to the cell state for the which pieces cell state and the black chess pieces, which is zero since the cell state from 1-6 is for black pieces

	// sets the default properties
	_whichPlayerIsInChessCheck = @"";
	_currentPlayersTurn = chessColourType;
	
	// clears currentBoardBeingPlayed by setting each buty of the block of memory
	// occupied by currentBoardBeingPlayed to zero
	memset(_currentBoardBeingPlayed, 0, sizeof(NSUInteger) * NumOfRows * NumOfCols);
	
	// checks if the chessColourType is White then change cellStateMultipler to 6
	if ([chessColourType isEqualToString:@"White"])
		cellStateMultipler = 6;
	
	// reapplys the starting postion of all of the chess pieces
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < NumOfRows; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0; indexCol < NumOfCols; indexCol++) {
			// checks if it is the first two row and last two rows
			if(indexRow < 2 || indexRow > 5) {
				// checks if indexRow is near the top of the board
				if (indexRow > 5) {
					// checks if the chessColourType is White the flip it to the black chess pieces
					if ([chessColourType isEqualToString:@"White"])
						cellStateMultipler = 0;
					else
						cellStateMultipler = 6;
				}// end of if
				
				// checks if the is 1 or 6 as those rows are where the pawns will go
				if(indexRow == 1 || indexRow == 6) {
					[itemsOnTheBaord addObject:[self setCellState:(1 + cellStateMultipler) OnRow:indexRow andColumn:indexCol]];
				}// end of if
				else {
					// checks which white chess peices this column will have to display them
					switch (indexCol) {
						case 0:
						case 7:
							[itemsOnTheBaord addObject:[self setCellState:(2 + cellStateMultipler) OnRow:indexRow andColumn:indexCol]];
							break;
						case 1:
						case 6:
							[itemsOnTheBaord addObject:[self setCellState:(3 + cellStateMultipler) OnRow:indexRow andColumn:indexCol]];
							break;
						case 2:
						case 5:
							[itemsOnTheBaord addObject:[self setCellState:(4 + cellStateMultipler) OnRow:indexRow andColumn:indexCol]];
							break;
						case 3:
							[itemsOnTheBaord addObject:[self setCellState:(5 + cellStateMultipler) OnRow:indexRow andColumn:indexCol]];
							break;
						case 4:
							[itemsOnTheBaord addObject:[self setCellState:(6 + cellStateMultipler) OnRow:indexRow andColumn:indexCol]];
							break;
					}// end of switch
				}// end of else
			}// end of if
			else {
				// sets empty chess pieces if there is no peices type at the start in order to make
				// the code a little simplier later one
				[self setCellState:0 OnRow:indexRow andColumn:indexCol];
			}// end of else
		}// end of column for loop
	}// end of row for loop

	return itemsOnTheBaord;
}// end of clearBoard()

-(NSArray*)createCellsOnBoard {
	NSMutableArray* cellsOnTheBoard = [[NSMutableArray alloc] init];
	int startCurrentRowWithEvenOrOddNumber = 1;
	
	// the reason this is not in clearBoard() is because clearBoard() can be used to reset the game well this functin will only be used when the game is first loaded
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < NumOfRows; indexRow++) {
		// checks if the current row is an eveb number
		if ((indexRow % 2))
			// starts the current row with an even number in order for the row to start with a black pad
			startCurrentRowWithEvenOrOddNumber = 2;
		else
			// starts the current row with an odd number in order for the row to start with a white pad
			startCurrentRowWithEvenOrOddNumber = 1;
		
		// goes around for each of the column
		for (int indexCol = 0, indexWhichColourToUse = startCurrentRowWithEvenOrOddNumber; indexCol < NumOfCols; indexCol++, indexWhichColourToUse++) {
			NSInteger cellType = 0;// holds which cell type this is
			
			// checks if indexWhichColourToUse column is a odd number
			if (!(indexWhichColourToUse % 2))
				cellType = 1;
			
			[cellsOnTheBoard addObject:[[ChessCell alloc] initWithRow:indexRow Column:indexCol andChessCellType:cellType]];
		}// end of column for loop
	}// end of row for loop
	
	return cellsOnTheBoard;
}// end of createCellsOnBoard()

-(NSArray*) findAllCellState:(NSUInteger)findThisCellState {
	NSMutableArray* foundCellState = [[NSMutableArray alloc] init];
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks this cell is one of the cells the suer is looking for
			if (findThisCellState == [_currentBoardBeingPlayed[indexRow][indexCol] chessPieceType]) {
				
				// adds to foundCellState with an array which will have the row and column of where the state is found
				[foundCellState addObject:[[NSArray alloc] initWithObjects:[NSNumber numberWithInt:indexRow], [NSNumber numberWithInt:indexCol], nil]];
			}// end of if
		}// end of column for loop
	}// end of row for loop
	
	return foundCellState;
}// end of findAllCellState()

-(NSArray *)getAllAllowedMovementForChessPiece:(ChessPiece *)chessPiece {
	if (chessPiece == nil)
		[NSException raise:NSInvalidArgumentException format:@"Invaild chess piece"];
	
	NSMutableArray* foundPostionForThisChessPiece = [[NSMutableArray alloc] init];
	NSInteger locationOfDestinationRow = [chessPiece cellRow];
	NSInteger locationOfDestinationCol = [chessPiece cellCol];
	
	// checks which type of chess piece it is
	switch ([chessPiece chessPieceType]) {
		// Pawn
		case 1:
		case 7:
			// checks if the chess piece is starting at the bottom of the chess board so it need to move up else it needs to move down
			if ([chessPiece startingCellRow] < 4) {
				[self checkPawnKillingOptionsForThisPawn:chessPiece atSartingRow:(locationOfDestinationRow  + 1) andColumn:locationOfDestinationCol thenAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
				
				[_findingMovesForChessPiecesOnChessBoard checkIfTopCellIsEmptyOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
			}// end of if
			else {
				[self checkPawnKillingOptionsForThisPawn:chessPiece atSartingRow:(locationOfDestinationRow - 1) andColumn:locationOfDestinationCol thenAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
				
				[_findingMovesForChessPiecesOnChessBoard checkIfBottomCellIsEmptyOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
			}// end of else
			
			// checks to make sure that locationOfDestinationRow and locationOfDestinationCol have change
			if (locationOfDestinationRow != [chessPiece cellRow] || locationOfDestinationCol != [chessPiece cellCol]) {
				// adds to the array with a chessPiece object of that cell if there is any move ment for the pawn
				[foundPostionForThisChessPiece addObject:[self getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol]];
				
				// reset the row and column for the next
				locationOfDestinationRow = [chessPiece cellRow];
				locationOfDestinationCol = [chessPiece cellCol];
			}// end of if
			
			// checks either side of this pawn is a pawn that did the two column just during their last turn
			if (([chessPiece cellCol]  + 1) < NumOfCols && [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:([chessPiece cellCol] + 1)] hasThisChessPieceMovedOnce] == 0) {
				[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:chessPieceSideRight whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
			}// end of if
			else if (([chessPiece cellCol]  - 1) >= 0 && [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:([chessPiece cellCol] - 1)] hasThisChessPieceMovedOnce] == 0) {
				[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:chessPieceSideLeft whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
			}// end of else if
		break;
		// Rook
		case 2:
		case 8:
			// gets all of the possible moves for the rook
			
			// goes around getting each rook movements
			for (NSInteger indexSides = 0; indexSides < 4; indexSides++) {
				[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:indexSides whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:8];
			}// end of for loop
		break;
		// Knight
		case 3:
		case 9:
			// gets all of the possible moves for the Knight
			
			// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
			for (NSInteger indexSides = 0; indexSides < 4; indexSides++) {
				NSInteger checkThisCellFromCentreCellRow = 0;
				NSInteger checkThisCellFromCentreCellColumn = 0;
				
				// checks which side the loop is order to check each is a valuded move or not
				switch (indexSides) {
					// Top
					case 0:
						checkThisCellFromCentreCellRow = ([chessPiece cellRow] + 2);
						checkThisCellFromCentreCellColumn = ([chessPiece cellCol] +  1);
					break;
					// Right
					case 1:
						checkThisCellFromCentreCellRow = ([chessPiece cellRow] - 1);
						checkThisCellFromCentreCellColumn = ([chessPiece cellCol] +  2);
					break;
					// Bottom
					case 2:
						checkThisCellFromCentreCellRow = ([chessPiece cellRow] - 2);
						checkThisCellFromCentreCellColumn = ([chessPiece cellCol] - 1);
					break;
					// Left
					case 3:
						checkThisCellFromCentreCellRow = ([chessPiece cellRow] + 1);
						checkThisCellFromCentreCellColumn = ([chessPiece cellCol] - 2);
					break;
				}// end of switch
				
				// checks if row and column are in the range of the board if not the skip it
				if(checkThisCellFromCentreCellColumn > 0 && checkThisCellFromCentreCellColumn < (NumOfCols - 1) && checkThisCellFromCentreCellRow > 0 && checkThisCellFromCentreCellRow < (NumOfRows - 1)) {
					ChessPiece* cellsChessPiece = [self getCurrentStateAtRow:checkThisCellFromCentreCellRow andColumn:checkThisCellFromCentreCellColumn];
					
					// checks if this not an empty cell
					if ([cellsChessPiece chessPieceType] != 0) {
						// checks if the cell type is the same colour as the originCell or not
						if (![[cellsChessPiece getChessPieceColour] isEqualToString:[chessPiece getChessPieceColour]]) {
							[foundPostionForThisChessPiece addObject:cellsChessPiece];
						}// end of if
					}// end of if
					else
						[foundPostionForThisChessPiece addObject:cellsChessPiece];
				}// end of if
			}// end of for loop
		break;
		// Bishop
		case 4:
		case 10:
			// gets all of the possible moves for the bishop
			
			// goes around getting each bishop movements
			for (NSInteger indexSides = 4; indexSides < 8; indexSides++) {
				[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:indexSides whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:8];
			}// end of for loop
		break;
		// King
		case 5:
		case 11:
			// gets all of the possible moves for the king
			
			// goes around getting each king movements
			for (NSInteger indexSides = 0; indexSides < 8; indexSides++) {
				[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:indexSides whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:1];
			}// end of for loop
			
			// checks if the King has not move
			if ([chessPiece hasThisChessPieceMovedOnce] == 2) {
				// checks if the right side of the king to see if the Knight, Queen and Bishop have moved
				if ([[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:4] chessPieceType] == 0 && [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:5] chessPieceType] == 0 && [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:6] chessPieceType] == 0) {
					// checks if there the rooks are still in the location
					if([[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:7] chessPieceType] == 2 || [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:7] chessPieceType] == 8) {
						[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:1 whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:2];
					}// end of if
				}// end of if
				
				// checks if the left side is clear of Knight and Bishop
				if ([[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:1] chessPieceType] == 0 && [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:2] chessPieceType] == 0) {
					// checks if there the rooks are still in the location
					if([[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:0] chessPieceType] == 2 || [[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:0] chessPieceType] == 8) {
						[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:3 whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:2];
					}// end of if
				}// end of if
			}// end of if
		break;
		// Queen
		case 6:
		case 12:
			// gets all of the possible moves for the queen
			
			// goes around getting each queen movements
			for (NSInteger indexSides = 0; indexSides < 8; indexSides++) {
				[self findMovesForChessPiece:chessPiece atLocationOfDestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol onThisSideOfChessPiece:indexSides whichWillBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece withAllowedNumberOfMoves:8];
			}// end of for loop
		break;
	}// end of switch
	
	return foundPostionForThisChessPiece;
}// end of getAllAllowedMovementForChessPiece()

-(ChessPiece*) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	return _currentBoardBeingPlayed[row][column];
}// end of getCurrentStateAtRowandColumn()

-(void) moveCellStateFromRow:(NSInteger)fromRow andColumn:(NSInteger)fromColumn toRow:(NSInteger)toRow andColumn:(NSInteger)toColumn {
	// sets the cell of the destion cell with the origin cell state
	// then removes the origin cell state to be empty in order to move it
	[self setCellState:[[self getCurrentStateAtRow:fromRow andColumn:fromColumn] chessPieceType] OnRow:toRow andColumn:toColumn];
	[self setCellState:0 OnRow:fromRow andColumn:fromColumn];
}// end of movreCellStateFromRowAndColumnToRowAndColumn()

-(ChessPiece*) setCellState:(NSUInteger)newChessPeiceType OnRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	// creates a new version of the chess piece and adds it to the board in memory
	ChessPiece* newChessPiece = [[ChessPiece alloc] initWithRow:row Column:column andChessPieceType:newChessPeiceType];
	
	_currentBoardBeingPlayed[row][column] = newChessPiece;
	
	return newChessPiece;
}// end of setCellStateOnRowandColumn()

/*
 
 Private Methods
 
*/

// checks if the row or column are outside the arraoy
-(void)checkArrayBoundsForRow:(NSInteger)row andColumn:(NSInteger)column {
	// checks if row and column are in the range of _currentBoardBeingPlayed
	if(column < 0 || column > (NumOfCols - 1) || row < 0 || row > (NumOfRows - 1))
		[NSException raise:NSRangeException format:@"cell out of bounds"];
}// end of checkArryBonundsForRowandColumn

// checks if this Pawn has enemies dangle
- (void)checkPawnKillingOptionsForThisPawn:(ChessPiece *)chessPiecePawn atSartingRow:(NSInteger)pawnsLocationRow andColumn:(NSInteger)pawnsLocationCol thenAddToFoundPostionForThisChessPiece:(NSMutableArray *)foundPostionForThisChessPiece {
	
	// goes around for both dangle sides in from of chessPiecePawn
	for (NSInteger indexDangleSides = 0; indexDangleSides < 2; indexDangleSides++) {
		ChessPiece* chessPieceCellBeingCheckForEnemies;
		
		//checks if this is on the right side which is 0 or 1 for left
		if (indexDangleSides == 0 && (pawnsLocationCol + 1) < NumOfCols) {
			chessPieceCellBeingCheckForEnemies = [self getCurrentStateAtRow:pawnsLocationRow andColumn:(pawnsLocationCol + 1)];
			
			[_findingMovesForChessPiecesOnChessBoard checkForFriendOrFoeOnRowOrColumn:(pawnsLocationCol + 1) withOriginRowOrColumn:&pawnsLocationCol forCellType:[chessPiecePawn getChessPieceColour] andCellsChessPiece:chessPieceCellBeingCheckForEnemies andAddToRow:NO];
		}// end of if
		else if(indexDangleSides == 1 && (pawnsLocationCol - 1) >= 0) {
			chessPieceCellBeingCheckForEnemies = [self getCurrentStateAtRow:pawnsLocationRow andColumn:(pawnsLocationCol - 1)];
			
			[_findingMovesForChessPiecesOnChessBoard checkForFriendOrFoeOnRowOrColumn:(pawnsLocationCol - 1) withOriginRowOrColumn:&pawnsLocationCol forCellType:[chessPiecePawn getChessPieceColour] andCellsChessPiece:chessPieceCellBeingCheckForEnemies andAddToRow:YES];
		}// end of else
		
		// checks to make sure that locationOfDestinationRow and locationOfDestinationCol have change
		if (pawnsLocationCol != [chessPiecePawn cellCol]) {
			// adds to the array with a chessPiece object of that cell
			[foundPostionForThisChessPiece addObject:[self getCurrentStateAtRow:pawnsLocationRow andColumn:pawnsLocationCol]];
			
			// reset the column for the next
			pawnsLocationCol = [chessPiecePawn cellCol];
		}// end of if
	}// end of for loop
}// end of checkPawnKillingOptionsForThisPawnAtSartingRowAndColumnThenAddToFoundPostionForThisChessPiece()

- (void)findMovesForChessPiece:(ChessPiece *)chessPiece atLocationOfDestinationRow:(NSInteger *)locationOfDestinationRow andLocationOfDestinationCol:(NSInteger *)locationOfDestinationCol onThisSideOfChessPiece:(NSInteger)indexSides whichWillBeAddToFoundPostionForThisChessPiece:(NSMutableArray *)foundPostionForThisChessPiece withAllowedNumberOfMoves:(NSInteger)maxNumberOfMoves {
	// checks which side to check
	switch (indexSides) {
		case 0:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheTopCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 1:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheRightCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 2:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheBottomCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 3:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheLeftCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 4:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheTopRightCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 5:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheBottomRightCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 6:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheBottomLeftCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
		case 7:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheTopLeftCellOnRow:*(&locationOfDestinationRow) andColumn:*(&locationOfDestinationCol) onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:maxNumberOfMoves];
			break;
	}// end of switch
	
	// checks to make sure that locationOfDestinationRow and locationOfDestinationCol have change
	if (*locationOfDestinationRow != [chessPiece cellRow] || *locationOfDestinationCol != [chessPiece cellCol]) {
		// adds to the array with a chessPiece object of that cell
		[foundPostionForThisChessPiece addObject:[self getCurrentStateAtRow:*locationOfDestinationRow andColumn:*locationOfDestinationCol]];
		
		// reset the row and column for the next side
		*locationOfDestinationRow = [chessPiece cellRow];
		*locationOfDestinationCol = [chessPiece cellCol];
	}// end of if
}// end of findMovesForChessPieceAtLocationOfDestinationRowAndLocationOfDestinationColOnThisSideOfChessPieceWhichWillBeAddToFoundPostionForThisChessPieceWithAllowedNumberOfMoves()

@end
