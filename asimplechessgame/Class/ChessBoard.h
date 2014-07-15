//
//  ChessBoard.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChessPiece.h"

static const NSInteger NumOfRows = 8;
static const NSInteger NumOfCols = 8;

@interface ChessBoard : NSObject

/*
 
 Public Methods

*/

// resets all chess cells to empty
- (void) clearBoard;

// finds all types of a cell state on board
- (NSMutableArray*) findAllCellState:(NSUInteger)findThisCellState;

// gets the current state on column and row
- (ChessPiece*) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column;

// sets the initial state of the board
-(void) initChessBoardState;

// moves the cell state from one cell to another
-(void) moveCellStateFromRow:(NSInteger)fromRow andColumn:(NSInteger)fromColumn toRow:(NSInteger)toRow andColumn:(NSInteger)toColumn;

// updates a cell state to whatever new state on column and row
-(void) setCellState:(NSUInteger)newChessPeiceType OnRow:(NSInteger)row andColumn:(NSInteger)column;
	 
@end
