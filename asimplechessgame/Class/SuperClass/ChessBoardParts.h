//
//  ChessBoardParts.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-17.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>
@import SpriteKit;

@interface ChessBoardParts : NSObject {
	
}// end of interface

/*
 
 Properties
 
*/

@property (assign, nonatomic) NSInteger cellRow;
@property (assign, nonatomic) NSInteger cellCol;
@property (nonatomic) SKSpriteNode *spriteForThisPiece;

/*
 
 init
 
 */

// sets the row, column and chessPieceType is nil
-(instancetype)initWithRow:(NSInteger)row andColumn:(NSInteger)column;

/*
 
 Public Methods
 
 */

// get name of the image that this chess piece is using
-(NSString*) getSpriteImageName;

// updates this Chess Peice location on the memory chess board
-(void)updateCellRow:(NSInteger)row andCellColumn:(NSInteger)column;

@end
