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

-(currentState) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column {
	[self checkArrayBoundsForRow:row andColumn:column];
	
	return _currentBoardBeingPlayed[row][column];
}// end of getCurrentStateAtRowandColumn()

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
