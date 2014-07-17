//
//  ChessPiece.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-09.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessPiece.h"

@implementation ChessPiece

/* 
 
 init

*/

-(instancetype)initWithRow:(NSInteger)row Column:(NSInteger)column andChessPieceType:(NSUInteger)type {
	// gets self and updates the row and column
	self = [self initWithRow:row andColumn:column];
	
	// checks if chess piece type is under
	NSAssert1(type < numberOfChessPieceTypes, @"Invalid Chess Piece Type: %i", type);
	
	[self setChessPieceType:type];
	
	return self;
}// end of initWithRowColumnAndChessPieceType()

/*
 
 Public Methods

*/

-(NSString*)getSpriteImageName {
	NSString* imageNameOfSprite[] = {
		@"PawnPiece",
		@"RookPiece",
		@"KnightPiece",
		@"BishopPiece",
		@"KingPiece",
		@"QueenPiece",
		@"PawnWhitePiece",
		@"RookWhitePiece",
		@"KnightWhitePiece",
		@"BishopWhitePiece",
		@"KingWhitePiece",
		@"QueenWhitePiece",
	};
	
	// because zero is empty in chessPieceType getting the image name needs to be subtract one
	// to get hte actully image name
	return imageNameOfSprite[self.chessPieceType - 1];
}// end of getSpriteImageName()

/*
 
 Override Methods

*/

- (NSString *)description {
	return [NSString stringWithFormat:@"type:%i cell:(%i, %i)", self.chessPieceType, self.cellRow, self.cellCol];
}// end of description()

@end