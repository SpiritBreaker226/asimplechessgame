//
//  ChessBoardParts.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-17.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessBoardParts.h"

@implementation ChessBoardParts

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

/*
 
 Public Methods
 
*/

-(NSString*) getSpriteImageName {
	return @"";
}// end of getSpriteImageName()

-(void)updateCellRow:(NSInteger)row andCellColumn:(NSInteger)column {
	[self setCellRow:row];
	[self setCellCol:column];
}// end of updateCellRowAndCellColumn()

@end
