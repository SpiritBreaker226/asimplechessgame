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
	NSAssert1(type < numberOfChessPieceTypes, @"Invalid Chess Piece Type: %li", (long)type);
	
	[self setChessPieceType:type];
	[self setHasThisChessPieceMovedOnce:2];
	
	// sets the starting Row and Column to tell which side the chess pice is on at the start of the game
	_startingCellRow = row;
	_startingCellCol = column;
	
	return self;
}// end of initWithRowColumnAndChessPieceType()

/*
 
 Public Methods

*/

-(NSString*)getChessPieceColour {
	// checks if the chess peices is below 7 meaning it is a black piece
	if ([self chessPieceType] < 7)
		return @"Black";
	else
		return @"White";
}// end of getChessPieceColour()

// from Chess Parts
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
	return [NSString stringWithFormat:@"type:%li cell:(%li, %li)", (long)self.chessPieceType, (long)self.cellRow, (long)self.cellCol];
}// end of description()

@end