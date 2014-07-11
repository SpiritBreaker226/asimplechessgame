//
//  ChessPiece.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-09.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ChessPiece : SKNode
/*
 
 Properties
 
 the cells are need in order to know where the peices are on the baord in memory and which will make finding the peice on the board quicker
*/

typedef struct {
	NSInteger cellRow;
	NSInteger cellCol;
} cellLocationOnBoard;

/*
 
 Public Methods
 
*/

// gets the coodend using for thsi chess peice
-(cellLocationOnBoard)getLocationOnChessBoard;

// updates this Chess Peice location on the memory chess board
-(void)updateCellRow:(NSInteger)row andCellColumn:(NSInteger)column;

@end