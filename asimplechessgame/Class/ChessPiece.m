//
//  ChessPiece.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-09.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessPiece.h"

@implementation ChessPiece {
	cellLocationOnBoard currentLocationOfCellOnChessBoard;
}// end of implementation

/* 
 
 init

*/

-(instancetype)init {
	if (self = [super init])
		[self updateCellRow:0 andCellColumn:0];
	
	return self;
}// end of init

/*
 
 Public Medthods

*/

-(cellLocationOnBoard)getLocationOnChessBoard {
	return currentLocationOfCellOnChessBoard;
}// end of gtLocationOnChessBoard()

-(void)updateCellRow:(NSInteger)row andCellColumn:(NSInteger)column {
	currentLocationOfCellOnChessBoard.cellRow = row;
	currentLocationOfCellOnChessBoard.cellCol = column;
}// end of updateCellRowAndCellColumn()

@end