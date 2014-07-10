//
//  asimplechessgameTests.m
//  asimplechessgameTests
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "aSimpleChessGame.h"

@interface asimplechessgameTests : XCTestCase
	@property aSimpleChessGame* currentGameState;
@end

@implementation asimplechessgameTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
	_currentGameState = [[aSimpleChessGame alloc] init];
	
	// sets the initial sets of the game
	[_currentGameState setToInitialState];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	_currentGameState = nil;
}// end of tearDown()

- (void)testInitialState_shouldChessPeicesBeFirstTwoRows {
	// goes around for each of the row on the board
	for (int indexRow = 0; indexRow < 2; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checkis if this is not the king chess peices column
			if(indexRow != 0 && indexCol != 3)
				XCTAssertEqual(cellHasChessPiece, [_currentGameState getCurrentStateAtRow:indexRow andColumn:indexCol], @"There is a chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldChessPeicesBeFirstTwoRows()

- (void)testInitialState_shouldBeEmptyInMiddleOfBoard {
	// goes around for each of the row on the board
	for (int indexRow = 2; indexRow < 6; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			XCTAssertEqual(cellIsEmpty, [_currentGameState getCurrentStateAtRow:indexRow andColumn:indexCol], @"There Row: %i, Column: %i is empty on chess board", indexRow, indexCol);
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldBeEmptyInMiddleOfBoard()

- (void)testInitialState_shouldChessPeicesBeLastTwoRows {
	// goes around for each of the row on the board
	for (int indexRow = 6; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// check is if this is not the king chess peices column
			if(indexRow != 7 && indexCol != 3)
				XCTAssertEqual(cellHasChessPiece, [_currentGameState getCurrentStateAtRow:indexRow andColumn:indexCol], @"There is a chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldChessPeicesBeLastTwoRows()

- (void)testInitialState_shouldTwoChessPeiceKingsBeAtTheFirstAndLastRow {
	XCTAssertEqual(cellHasChessPieceKing, [_currentGameState getCurrentStateAtRow:0 andColumn:3], @"There is a king chess peice on chess board at Row: %i, Column: %i", 0, 3);
		XCTAssertEqual(cellHasChessPieceKing, [_currentGameState getCurrentStateAtRow:7 andColumn:3], @"There is a king chess peice on chess board at Row: %i, Column: %i", 7, 3);
}// end of testInitialState_shouldTwoChessPeiceKingsBeAtTheFirstAndLastRow()

@end
