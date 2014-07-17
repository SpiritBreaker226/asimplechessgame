//
//  ChessBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessBoard.h"

@implementation ChessBoard {

/*

 Private Properties

*/

ChessPiece* _currentBoardBeingPlayed[NumOfRows][NumOfCols];

}// end of implatentation

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

// creates a new Chess Piece
-(ChessPiece*) createCellState:(NSUInteger)newChessPeiceType OnRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	// creates a new version of the chess piece and adds it to the board in memory
	ChessPiece* newChessPiece = [[ChessPiece alloc] initWithRow:row Column:column andChessPieceType:newChessPeiceType];
	_currentBoardBeingPlayed[row][column] = newChessPiece;
	
	return newChessPiece;
}// end of setCellStateOnRowandColumn()

@end
