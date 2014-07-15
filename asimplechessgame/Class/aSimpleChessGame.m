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
