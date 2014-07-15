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

-(instancetype)init {
	return [self initWithRow:0 andColumn:0];
}// end of init

-(instancetype)initWithRow:(NSInteger)row andColumn:(NSInteger)column {
	if (self = [super init]) {
		[self updateCellRow:row andCellColumn:column];
	}// end of if
	
	return self;
}// end of initWithRowAndColumn()

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
		@"BlackPawn",
		@"BlackRook",
		@"BlackKnight",
		@"BlackBishop",
		@"BlackKing",
		@"BlackQueen",
		@"WhitePawn",
		@"WhiteRook",
		@"WhiteKnight",
		@"WhiteBishop",
		@"WhiteKing",
		@"WhiteQueen",
	};
	
	// because zero is empty in chessPieceType getting the image name needs to be subtract one
	// to get hte actully image name
	return imageNameOfSprite[self.chessPieceType - 1];
}// end of getSpriteImageName()

-(void)updateCellRow:(NSInteger)row andCellColumn:(NSInteger)column {
	[self setCellRow:row];
	[self setCellCol:column];
}// end of updateCellRowAndCellColumn()

/*
 
 Override Methods

*/

- (NSString *)description {
	return [NSString stringWithFormat:@"type:%i cell:(%i, %i)", self.chessPieceType,
			_cellRow, _cellCol];
}// end of description()

@end