//
//  ChessBoard.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ChessMoves.h"
#import "ChessPiece.h"
#import "ChessCell.h"

static const NSInteger NumOfRows = 8;
static const NSInteger NumOfCols = 8;

@interface ChessBoard : NSObject

/*
 
 Public Methods

*/

// resets all chess board in memory to empty and re loads the peices into it
- (NSArray*) clearBoard;

// creates each of the cells that will be used to  the all of the cells
- (NSArray*) createCellsOnBoard;

// finds all types of a cell state on board
- (NSArray*) findAllCellState:(NSUInteger)findThisCellState;

// finds all moves for a chess peice
- (NSArray*) getAllAllowedMovementForChessPiece:(ChessPiece*)chessPiece;

// gets the current state on column and row
- (ChessPiece*) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column;

// moves the cell state from one cell to another
-(void) moveCellStateFromRow:(NSInteger)fromRow andColumn:(NSInteger)fromColumn toRow:(NSInteger)toRow andColumn:(NSInteger)toColumn;

// updates a cell state to whatever new state on column and row
-(void) setCellState:(NSUInteger)newChessPeiceType OnRow:(NSInteger)row andColumn:(NSInteger)column;
	 
@end
