//
//  ChessCell.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-17.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessCell.h"

@implementation ChessCell

/*
 
 init
 
*/

-(instancetype)initWithRow:(NSInteger)row Column:(NSInteger)column andChessCellType:(NSUInteger)type {
	// gets self and updates the row and column
	self = [self initWithRow:row andColumn:column];
	
	// checks if chess piece type is under
	NSAssert1(type < numberOfChessCellTypes, @"Invalid Chess Cell Type: %li", (long)type);
	
	[self setChessCellType:type];
	
	return self;
}// end of initWithRowColumnAndChessCellType()

/*
 
 Public Methods
 
*/

-(NSString*)getSpriteImageName {
	NSString* imageNameOfSprite[] = {
		@"WhitePad",
		@"BlackPad"
	};
	
	// to gets the actully image name
	return imageNameOfSprite[self.chessCellType];
}// end of getSpriteImageName()

/*
 
 Override Methods
 
 */

- (NSString *)description {
	return [NSString stringWithFormat:@"Cell Type:%li cell:(%li, %li)", (long)self.chessCellType, (long)self.cellRow, (long)self.cellCol];
}// end of description()
@end
