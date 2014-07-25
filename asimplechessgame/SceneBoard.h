//
//  SceneBoard.h
//  asimplechessgame
//

//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

@import SpriteKit;

#import "aSimpleChessGame.h"

@interface SceneBoard : SKScene <SKPhysicsContactDelegate>

/*
 
 Propties
 
*/

@property (nonatomic) aSimpleChessGame* gameState;

/*

 Methods
 
*/

// adds the chess cell to the display on the chess board
-(void)addChessCellsToBoard:(NSArray*)itemsBeingAdded;

// adds the chess pieces to the display on a chess board
-(void)addChessPiecesToBoard:(NSArray*)itemmsBeingAdded;

@end