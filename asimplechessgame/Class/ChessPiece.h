//
//  ChessPiece.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-09.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>
@import SpriteKit;

const static NSInteger numberOfChessPieceTypes = 12;

@interface ChessPiece : NSObject

/*
 
 Properties
 
*/

@property (assign, nonatomic) NSInteger cellRow;
@property (assign, nonatomic) NSInteger cellCol;
@property (assign, nonatomic) NSUInteger chessPieceType;
@property (nonatomic) SKSpriteNode *spriteForThisPiece;

/*
 
 init
 
*/

// 2nd init - sets the row, column and chessPieceType is nil
-(instancetype)initWithRow:(NSInteger)row andColumn:(NSInteger)column;

// 3rd init - sets the row, column and chessPieceType
-(instancetype)initWithRow:(NSInteger)row Column:(NSInteger)column andChessPieceType:(NSUInteger)type;

/*
 
 Public Methods
 
*/

// get name of the image that this chess piece is using
-(NSString*) getSpriteImageName;

// updates this Chess Peice location on the memory chess board
-(void)updateCellRow:(NSInteger)row andCellColumn:(NSInteger)column;

@end