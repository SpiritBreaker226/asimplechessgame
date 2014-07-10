//
//  aSimpleChessGame.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "aSimpleChessGame.h"

@implementation aSimpleChessGame

-(instancetype) init {
	if (self = [super init]) {
		[self setToInitialState];
	}// end of if
	
	return self;
}// end of init

-(void) setToInitialState {
	// clears the board from memory
	[super clearBoard];
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks if it is the first two row and last two rows
			if(indexRow < 2 || indexRow > 5) {
				// checks if this row and column are the kings as they are special
				// peices where the game will end
				if ((indexRow == 0 && indexCol == 3) || (indexRow == 7 && indexCol == 3))
					// adds the the chess peice for this row
					[super setCellState:cellHasChessPieceKing OnRow:indexRow andColumn:indexCol];
				else
					// adds the the chess peice for this row
					[super setCellState:cellHasChessPiece OnRow:indexRow andColumn:indexCol];
			}// end of if
		}// end of column for loop
	}// end of row for loop
	
	// sets the defaults for all of the proeprties
	_blackPawnsOut = 0;
	_blackKnightOut = 0;
	_blackBishopOut = 0;
	_blackQueenOut = 0;
	_whitePawnsOut = 0;
	_whiteKnightOut = 0;
	_whiteBishopOut = 0;
	_whiteQueenOut = 0;
}// end of setToInitialState()

@end
