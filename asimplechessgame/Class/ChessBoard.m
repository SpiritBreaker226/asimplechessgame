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
	
NSInteger _currentBoardBeingPlayed[8][8];
	
}// end of implatentation

/*
 
 Init
 
*/

-(instancetype)init {
	if (self = [super init])
		[self clearBoard];
	
	return self;
}// end of init

/*
 
 Public Methods
 
*/

-(void) clearBoard {
	// clears currentBoardBeingPlayed by setting each buty of the block of memory
	// occupied by currentBoardBeingPlayed to zero
	memset(_currentBoardBeingPlayed, 0, sizeof(NSUInteger) * 8 * 8);
}// end of clearBoard()

-(NSMutableArray*) findAllCellState:(currentState)findThisCellState {
	NSMutableArray* foundCellState = [[NSMutableArray alloc] init];
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks this cell is one of the cells the suer is looking for
			if (findThisCellState == _currentBoardBeingPlayed[indexRow][indexCol]) {
				
				// adds to foundCellState with an array which will have the row and column of where the state is found
				[foundCellState addObject:[[NSArray alloc] initWithObjects:[NSNumber numberWithInt:indexRow], [NSNumber numberWithInt:indexCol], nil]];
			}// end of if
		}// end of column for loop
	}// end of row for loop
	
	return foundCellState;
}// end of findAllCellState()

-(currentState) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	return _currentBoardBeingPlayed[row][column];
}// end of getCurrentStateAtRowandColumn()

-(void) moveCellStateFromRow:(NSInteger)fromRow andColumn:(NSInteger)fromColumn toRow:(NSInteger)toRow andColumn:(NSInteger)toColumn {
	
	// sets the cell of the destion cell with the origin cell state
	// then removes the origin cell state to be empty in order to move it
	[self setCellState:[self getCurrentStateAtRow:fromRow andColumn:fromColumn] OnRow:toRow andColumn:toColumn];
	[self setCellState:cellIsEmpty OnRow:fromRow andColumn:fromColumn];
}// end of movreCellStateFromRowAndColumnToRowAndColumn()

-(void) setCellState:(currentState)newState OnRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	_currentBoardBeingPlayed[row][column] = newState;
}// end of setCellStateOnRowandColumn()

/*
 
 Private Methods
 
*/

-(void)checkArrayBoundsForRow:(NSInteger)row andColumn:(NSInteger)column {
	// checks if row and column are in the range of _currentBoardBeingPlayed
	if(column < 0 || column > 7 || row < 0 || row > 7)
		[NSException raise:NSRangeException format:@"cell out of bounds"];
}// end of checkArryBonundsForRowandColumn

@end
