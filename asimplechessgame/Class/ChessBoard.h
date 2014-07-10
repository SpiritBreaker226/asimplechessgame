//
//  ChessBoard.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChessBoard : NSObject

/*
	
 Public Properties
 
*/

typedef NS_ENUM(NSInteger, currentState) {
	cellIsEmpty = 0,
	cellHasChessPiece = 1,
	cellHasChessPieceKing = 2,
	cellChessPieceCanMoveHere = 3,
	cellChessPieceCannotMoveHere = 4
};// end of trype of def

/*
 
 Public Methods

*/

// resets all chess cells to empty
- (void) clearBoard;

// gets the current state on column and row
- (currentState) getCurrentStateAtRow:(NSInteger)row andColumn:(NSInteger)column;

// sets cell state to whatever new state on column and row
-(void) setCellState:(currentState)newState OnRow:(NSInteger)row andColumn:(NSInteger)column;
	 
@end
