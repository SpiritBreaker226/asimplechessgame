//
//  aSimpleChessGame.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessBoard.h"

@interface aSimpleChessGame : ChessBoard

/*
 
 Properties

*/

@property (readonly) NSInteger blackPawnsOut;
@property (readonly) NSInteger blackKnightOut;
@property (readonly) NSInteger blackBishopOut;
@property (readonly) NSInteger blackQueenOut;
@property (readonly) NSInteger whitePawnsOut;
@property (readonly) NSInteger whiteKnightOut;
@property (readonly) NSInteger whiteBishopOut;
@property (readonly) NSInteger whiteQueenOut;

typedef NS_ENUM(NSInteger, currentTurn) {
	whitePeiceTurn = 0,
	blackPeiceTurn = 1
};// end of trype of def

/*
 
 Public Method
 
*/

// sets the game state to memory which incdules loading in the board into memory with the starting postions of the peices
-(void) setInitialGameState;

@end
