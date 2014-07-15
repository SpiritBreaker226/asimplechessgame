//
//  ChessBoard.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSInteger NumOfRows = 8;
static const NSInteger NumOfCols = 8;

@interface ChessBoard : NSObject

/*
	
 Properties
 
*/

typedef NS_ENUM(NSInteger, currentState) {
	cellIsEmpty = 0,
	cellChessPieceCanMoveHereBlack = 1,
	cellChessPieceCanMoveHereWhite = 2,
	cellChessPieceCannotMoveHereBlack = 3,
	cellChessPieceCannotMoveHereWhite = 4,
	cellHasChessPieceBlackPawn = 5,
	cellHasChessPieceBlackBishop = 6,
	cellHasChessPieceBlackKnight = 7,
	cellHasChessPieceBlackRook = 8,
	cellHasChessPieceBlackQueen = 9,
	cellHasChessPieceBlackKing = 10,
	cellHasChessPieceWhitePawn = 11,
	cellHasChessPieceWhiteBishop = 12,
	cellHasChessPieceWhiteKnight = 13,
	cellHasChessPieceWhiteRook = 14,
	cellHasChessPieceWhiteQueen = 15,
	cellHasChessPieceWhiteKing = 16
};// end of trype of def

/*
 
 Public Methods

*/

// resets all chess cells to empty
- (void) clearBoard;

// finds all types of a cell state on board
- (NSMutableArray*) findAllCellState:(currentState)findThisCellState;

// gets the current state on column and row
- (currentState) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column;

// moves the cell state from one cell to another
-(void) moveCellStateFromRow:(NSInteger)fromRow andColumn:(NSInteger)fromColumn toRow:(NSInteger)toRow andColumn:(NSInteger)toColumn;

// sets cell state to whatever new state on column and row
-(void) setCellState:(currentState)newState OnRow:(NSInteger)row andColumn:(NSInteger)column;
	 
@end
