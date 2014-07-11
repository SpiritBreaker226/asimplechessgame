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
	
	// sets the different states in different location on the board to test
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:0];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:1];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:2];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:3];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:4];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:5];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:6];
	[_testChessBoard setCellState:cellHasChessPieceBlackPawn OnRow:1 andColumn:7];
	[_testChessBoard setCellState:cellHasChessPieceBlackRook OnRow:0 andColumn:0];
	[_testChessBoard setCellState:cellHasChessPieceBlackRook OnRow:0 andColumn:7];
	[_testChessBoard setCellState:cellHasChessPieceWhiteRook OnRow:7 andColumn:0];
	[_testChessBoard setCellState:cellHasChessPieceWhiteRook OnRow:7 andColumn:7];
	[_testChessBoard setCellState:cellHasChessPieceBlackKing OnRow:0 andColumn:3];
	[_testChessBoard setCellState:cellHasChessPieceBlackQueen OnRow:0 andColumn:4];
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

- (void)testSearchForCellState_withValidState_shouldFindBothBlackRooks {
	NSMutableArray* findBlackRooks = [_testChessBoard findAllCellState:cellHasChessPieceBlackRook];
	
	XCTAssertEqual(cellHasChessPieceBlackRook, [_testChessBoard getCurrentStateAtRow:[[[findBlackRooks objectAtIndex:0] objectAtIndex:0] intValue] andColumn:[[[findBlackRooks objectAtIndex:0] objectAtIndex:1] intValue]], @"Found The First black rooks");
	XCTAssertEqual(cellHasChessPieceBlackRook, [_testChessBoard getCurrentStateAtRow:[[[findBlackRooks objectAtIndex:1] objectAtIndex:0] intValue] andColumn:[[[findBlackRooks objectAtIndex:0] objectAtIndex:1] intValue]], @"Found The Secord black rooks");
	XCTAssertEqual(2, [findBlackRooks count], @"Found both black rooks by count them");
}// end of testSearchForCellState_withValidState_shouldFindBothRooks()

- (void)testSearchForCellState_withInValidState_shouldFindNoResults {
	NSMutableArray* findWhiteKnight = [_testChessBoard findAllCellState:cellHasChessPieceWhiteKnight];
	
	XCTAssertNotEqual(1, [findWhiteKnight count], @"No White Knight Found by count them");
}// end of testSearchForCellState_withInValidState_shouldFindNoResults()

@end
