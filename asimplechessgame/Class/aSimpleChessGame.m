//
//  aSimpleChessGame.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "aSimpleChessGame.h"

@implementation aSimpleChessGame

/*
 
 Init
 
*/

-(instancetype) init {
	if (self = [super init]) {
		[self setInitialGameState];
	}// end of if
	
	return self;
}// end of init

/*
 
 Public Methods
 
*/

-(void) setInitialGameState {
	// clears the board from memory
	[super clearBoard];
	
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks if it is the first two row and last two rows
			if(indexRow < 2 || indexRow > 5) {
				// checks if the is 1 or 6 as those rows are where the pawns will go
				if(indexRow == 1) {
					[super setCellState:cellHasChessPieceBlackPawn OnRow:indexRow andColumn:indexCol];
				}// end of if
				else if(indexRow == 6) {
					[super setCellState:cellHasChessPieceWhitePawn OnRow:indexRow andColumn:indexCol];
				}// end of else if
				else if(indexRow == 0) {
					// checks which white chess peices this column will have to display them
					switch (indexCol) {
						case 0:
						case 7:
							[super setCellState:cellHasChessPieceBlackRook OnRow:indexRow andColumn:indexCol];
							break;
						case 1:
						case 6:
							[super setCellState:cellHasChessPieceBlackKnight OnRow:indexRow andColumn:indexCol];
							break;
						case 2:
						case 5:
							[super setCellState:cellHasChessPieceBlackBishop OnRow:indexRow andColumn:indexCol];
							break;
						case 3:
							[super setCellState:cellHasChessPieceBlackKing OnRow:indexRow andColumn:indexCol];
							break;
						case 4:
							[super setCellState:cellHasChessPieceBlackQueen OnRow:indexRow andColumn:indexCol];
							break;
					}// end of switch
				}// end of else if
				else {
					// checks which white chess peices this column will have to display them
					switch (indexCol) {
						case 0:
						case 7:
							[super setCellState:cellHasChessPieceWhiteRook OnRow:indexRow andColumn:indexCol];
						break;
						case 1:
						case 6:
							[super setCellState:cellHasChessPieceWhiteKnight OnRow:indexRow andColumn:indexCol];
						break;
						case 2:
						case 5:
							[super setCellState:cellHasChessPieceWhiteBishop OnRow:indexRow andColumn:indexCol];
						break;
						case 3:
							[super setCellState:cellHasChessPieceWhiteKing OnRow:indexRow andColumn:indexCol];
						break;
						case 4:
							[super setCellState:cellHasChessPieceWhiteQueen OnRow:indexRow andColumn:indexCol];
						break;
					}// end of switch
				}// end of else
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
}// end of setInitialGameState()

/*
 
 Private Methods
 
*/


@end
