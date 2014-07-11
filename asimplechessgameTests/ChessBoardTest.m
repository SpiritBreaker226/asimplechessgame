//
//  ChessBoardTest.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-10.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChessBoard.h"

@interface ChessBoardTest : XCTestCase
	@property(nonatomic) ChessBoard* testChessBoard;
@end

@implementation ChessBoardTest

- (void)setUp {
    [super setUp];
	
    // Put setup code here. This method is called before the invocation of each test method in the class.
	_testChessBoard = [[ChessBoard alloc] init];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	_testChessBoard = nil;
}// end of tearDown()

- (void)testSetCellState_withValidCoords_cellStateShouldChange {
	XCTAssertEqual(cellIsEmpty, [_testChessBoard getCurrentStateAtRow:3 andColumn:6], @"This cell Chess Pirce should be empty");
	
	// sets the state of a cell on the chess board to test
	[_testChessBoard setCellState:cellChessPieceCannotMoveHereWhite OnRow:3 andColumn:6];
	
	// It should now be find the current state for that location
	XCTAssertEqual(cellChessPieceCannotMoveHereWhite, [_testChessBoard getCurrentStateAtRow:3 andColumn:6], @"This cell Chess Piece cannot be moved here");
}// end of testSetCellState_withValidCoords_cellStateShouldChange()

- (void)testSetCellState_withInvalidCoords_cellShouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard setCellState:cellIsEmpty OnRow:20 andColumn:8], @"An excetion should have been rised for this cell");
}// end of testSetCellState_withInvalidCoords_cellShouldErrorOut()

@end
