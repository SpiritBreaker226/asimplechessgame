//
//  ChessBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessBoard.h"


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

-(NSMutableArray*) clearBoard {
	NSMutableArray* itemsOnTheBaord = [[NSMutableArray alloc] init];
	
	// clears currentBoardBeingPlayed by setting each buty of the block of memory
	// occupied by currentBoardBeingPlayed to zero
	memset(_currentBoardBeingPlayed, 0, sizeof(NSUInteger) * NumOfRows * NumOfCols);
	
	// reapplys the starting postion of all of the chess pieces
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < NumOfRows; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < NumOfCols; indexCol++) {
			// checks if it is the first two row and last two rows
			if(indexRow < 2 || indexRow > 5) {
				// checks if the is 1 or 6 as those rows are where the pawns will go
				if(indexRow == 1) {
					[itemsOnTheBaord addObject:[self createCellState:1 OnRow:indexRow andColumn:indexCol]];
				}// end of if
				else if(indexRow == 6) {
					[itemsOnTheBaord addObject:[self createCellState:7 OnRow:indexRow andColumn:indexCol]];
				}// end of else if
				else if(indexRow == 0) {
					// checks which white chess peices this column will have to display them
					switch (indexCol) {
						case 0:
						case 7:
							[itemsOnTheBaord addObject:[self createCellState:2 OnRow:indexRow andColumn:indexCol]];
							break;
						case 1:
						case 6:
							[itemsOnTheBaord addObject:[self createCellState:3 OnRow:indexRow andColumn:indexCol]];
							break;
						case 2:
						case 5:
							[itemsOnTheBaord addObject:[self createCellState:4 OnRow:indexRow andColumn:indexCol]];
							break;
						case 3:
							[itemsOnTheBaord addObject:[self createCellState:5 OnRow:indexRow andColumn:indexCol]];
							break;
						case 4:
							[itemsOnTheBaord addObject:[self createCellState:6 OnRow:indexRow andColumn:indexCol]];
							break;
					}// end of switch
				}// end of else if
				else {
					// checks which white chess peices this column will have to display them
					switch (indexCol) {
						case 0:
						case 7:
							[itemsOnTheBaord addObject:[self createCellState:8 OnRow:indexRow andColumn:indexCol]];
							break;
						case 1:
						case 6:
							[itemsOnTheBaord addObject:[self createCellState:9 OnRow:indexRow andColumn:indexCol]];
							break;
						case 2:
						case 5:
							[itemsOnTheBaord addObject:[self createCellState:10 OnRow:indexRow andColumn:indexCol]];
							break;
						case 3:
							[itemsOnTheBaord addObject:[self createCellState:11 OnRow:indexRow andColumn:indexCol]];
							break;
						case 4:
							[itemsOnTheBaord addObject:[self createCellState:12 OnRow:indexRow andColumn:indexCol]];
							break;
					}// end of switch
				}// end of else
			}// end of if
			else
				// sets empty chess pieces if there is no peices type at the start in order to make
				// the code a little simplier later one
				[self createCellState:0 OnRow:indexRow andColumn:indexCol];
		}// end of column for loop
	}// end of row for loop

	return itemsOnTheBaord;
}// end of clearBoard()

-(NSMutableArray*)createCellsOnBoard {
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

-(NSMutableArray*) findAllCellState:(NSUInteger)findThisCellState {
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
	NSMutableArray* foundPostionForThisChessPiece = [[NSMutableArray alloc] init];
	NSInteger locationOfDestinationRow = [chessPiece cellRow];
	NSInteger locationOfDestinationCol = [chessPiece cellCol];
	
	// checks which type of chess piece it is
	switch ([chessPiece chessPieceType]) {
		// Black Pawn
		case 1:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
			
			[self checkThereIsADestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol forChessPiece:chessPiece toBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
			
			// checks either side of this pawn is a pawn that did the two column just during their last turn
			if ([[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:([chessPiece cellCol] + 1)] hasThisChessPieceMovedOnce] == 0) {
				// reset the row and column for the next side
				locationOfDestinationRow = [chessPiece cellRow];
				locationOfDestinationCol = [chessPiece cellCol];
				
				[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
				
				[self checkThereIsADestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol forChessPiece:chessPiece toBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
			}// end of if
			else if ([[self getCurrentStateAtRow:[chessPiece cellRow] andColumn:([chessPiece cellCol] - 1)] hasThisChessPieceMovedOnce] == 0) {
				// reset the row and column for the next side
				locationOfDestinationRow = [chessPiece cellRow];
				locationOfDestinationCol = [chessPiece cellCol];
				
				[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
				
				[self checkThereIsADestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol forChessPiece:chessPiece toBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
			}// end of else if
		break;
		// White Pawn
		case 7:
			[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:[chessPiece hasThisChessPieceMovedOnce]];
			
			[self checkThereIsADestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol forChessPiece:chessPiece toBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
		break;
		// Rook
		case 2:
		case 8:
			// gets all of the possible moves for the rook
			
			// goes around getting each rook movements
			for (NSInteger indexSides = 0; indexSides < 4; indexSides++) {
				// checks which side the loop is one and calls that function to get the moves
				switch (indexSides) {
					case 0:
						[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:8];
					break;
					case 1:
						[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:8];
					break;
					case 2:
						[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:8];
					break;
					case 3:
						[_findingMovesForChessPiecesOnChessBoard getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:self forCellType:[chessPiece getChessPieceColour] withAllowedNumberOfMoves:8];
					break;
				}// end of switch
				
				[self checkThereIsADestinationRow:&locationOfDestinationRow andLocationOfDestinationCol:&locationOfDestinationCol forChessPiece:chessPiece toBeAddToFoundPostionForThisChessPiece:foundPostionForThisChessPiece];
			}// end of for loop
		break;
		// Knight
		case 3:
		case 9:
			
		break;
		// Bishop
		case 4:
		case 10:
			
		break;
		// King
		case 5:
		case 11:
			
		break;
		// Queen
		case 6:
		case 12:
			
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

-(void) setCellState:(NSUInteger)newChessPeiceType OnRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	_currentBoardBeingPlayed[row][column] = [[ChessPiece alloc] initWithRow:row Column:column andChessPieceType:newChessPeiceType];
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

// checks to make sure that locationOfDestinationRow and locationOfDestinationCol have change
- (void)checkThereIsADestinationRow:(NSInteger*)locationOfDestinationRow andLocationOfDestinationCol:(NSInteger*)locationOfDestinationCol forChessPiece:(ChessPiece *)chessPiece toBeAddToFoundPostionForThisChessPiece:(NSMutableArray *)foundPostionForThisChessPiece {
	if (*locationOfDestinationRow != [chessPiece cellRow] || *locationOfDestinationCol != [chessPiece cellCol]) {
		// adds to the array with a chessPiece object of that cell
		[foundPostionForThisChessPiece addObject:[self getCurrentStateAtRow:*locationOfDestinationRow andColumn:*locationOfDestinationCol]];

		// reset the row and column for the next side
		*locationOfDestinationRow = [chessPiece cellRow];
		*locationOfDestinationCol = [chessPiece cellCol];
	}// end of if
}// end of checkThereIsADestinationRowAndLocationOfDestinationColForChessPieceToBeAddToFoundPostionForThisChessPiece()

// creates a new Chess Piece
-(ChessPiece*) createCellState:(NSUInteger)newChessPeiceType OnRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	// creates a new version of the chess piece and adds it to the board in memory
	ChessPiece* newChessPiece = [[ChessPiece alloc] initWithRow:row Column:column andChessPieceType:newChessPeiceType];
	_currentBoardBeingPlayed[row][column] = newChessPiece;
	
	return newChessPiece;
}// end of setCellStateOnRowandColumn()

@end
