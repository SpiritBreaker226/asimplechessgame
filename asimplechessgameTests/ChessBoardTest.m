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
	
	// clears and applys the starting baord
	[_testChessBoard clearBoard];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	_testChessBoard = nil;
}// end of tearDown()

- (void)testInitialState_shouldBeEmptyInMiddleOfBoard {
	// goes around for each of the row on the board
	for (int indexRow = 2; indexRow < 6; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			XCTAssertNil([_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol], @"There Row: %i, Column: %i is empty on chess board", indexRow, indexCol);
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldBeEmptyInMiddleOfBoard()

- (void)testInitialState_shouldChessPeicesBeLastTwoRows {
	// goes around for each of the row on the board
	for (int indexRow = 6; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks if the is 6 as those rows are where the pawns will go
			if(indexRow == 6) {
				XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"There is a white pawn chess peice on chess board at Row: %i, Column: %i", 6, indexCol);
			}// end of if
			else {
				// checks which chess peices this column will have to display them
				switch (indexCol) {
					case 0:
					case 7:
						XCTAssertEqual(8, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"There is a white rook chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 1:
					case 6:
						XCTAssertEqual(9, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"There is a white knight chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 2:
					case 5:
						XCTAssertEqual(10, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"There is a white bishop chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 3:
						XCTAssertEqual(11, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"There is a white queen chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 4:
						XCTAssertEqual(12, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"There is a white king chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
				}// end of switch
			}// end of else
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldChessPeicesBeLastTwoRows()

- (void)testInitialState_shouldTwoChessPeiceKingsBeAtTheFirstAndLastRow {
	XCTAssertEqual(5, [[_testChessBoard getCurrentStateAtRow:0 andColumn:3] chessPieceType], @"There is a king chess peice on chess board at Row: %i, Column: %i", 0, 3);
	XCTAssertEqual(11, [[_testChessBoard getCurrentStateAtRow:7 andColumn:3] chessPieceType], @"There is a king chess peice on chess board at Row: %i, Column: %i", 7, 3);
}// end of testInitialState_shouldTwoChessPeiceKingsBeAtTheFirstAndLastRow()

- (void)testInitialState_clearBoard_shouldHaveCountOf32ChessPiecess {
	XCTAssertEqual(32, [[_testChessBoard clearBoard] count], @"There are 32 chess peices at the start of the game");
}//end of testInitialState_clearBoard_shouldHaveCountOf32ChessPiecess()

- (void)testSetCellState_withValidCoords_cellStateShouldChange {
	XCTAssertNil([_testChessBoard getCurrentStateAtRow:3 andColumn:6], @"This cell Chess Pirce should be empty");
	
	// sets the state of a cell to White Bishop on the chess board to test
	[_testChessBoard setCellState:10 OnRow:3 andColumn:6];
	
	// It should now be find the current state for that location
	XCTAssertEqual(10, [[_testChessBoard getCurrentStateAtRow:3 andColumn:6] chessPieceType], @"This cell Chess Piece cannot be moved here");
}// end of testSetCellState_withValidCoords_cellStateShouldChange()

- (void)testSetCellState_withInvalidCoords_cellShouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard setCellState:11 OnRow:9 andColumn:8], @"An excetion should have been rised for this cell");
}// end of testSetCellState_withInvalidCoords_cellShouldErrorOut()

- (void)testSearchForCellState_withValidState_shouldFindBothBlackRooks {
	NSMutableArray* findBlackRooks = [_testChessBoard findAllCellState:2];
	
	XCTAssertEqual(2, [[_testChessBoard getCurrentStateAtRow:[[[findBlackRooks objectAtIndex:0] objectAtIndex:0] intValue] andColumn:[[[findBlackRooks objectAtIndex:0] objectAtIndex:1] intValue]] chessPieceType], @"Found The First black rooks");
	XCTAssertEqual(2, [[_testChessBoard getCurrentStateAtRow:[[[findBlackRooks objectAtIndex:1] objectAtIndex:0] intValue] andColumn:[[[findBlackRooks objectAtIndex:0] objectAtIndex:1] intValue]] chessPieceType], @"Found The Secord black rooks");
	XCTAssertEqual(2, [findBlackRooks count], @"Found both black rooks by count them");
}// end of testSearchForCellState_withValidState_shouldFindBothRooks()

- (void)testSearchForCellState_withInValidState_shouldFindNoResults {
	NSMutableArray* findWhiteKnight = [_testChessBoard findAllCellState:9];
	
	XCTAssertNotEqual(1, [findWhiteKnight count], @"No White Knight Found by count them");
}// end of testSearchForCellState_withInValidState_shouldFindNoResults()

- (void)testMovingCellState_withVaildCoordsForBothOriginDest_shouldReturnTrue {
	[_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:2 andColumn:5];
	 
	// it should have black queen at row 2 column 5 and be empty at row 0 column 4
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:2 andColumn:5] chessPieceType], @"This cell should have black queen");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:0 andColumn:4] chessPieceType], @"This cell should be empty as the queen was here");
}// end of testMovingCellState_withVaildCoordsForBothOriginDest_shouldReturnDestCoords()

- (void)testMovingCellState_withInVaildCoordsForBothOriginDest_shouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard moveCellStateFromRow:20 andColumn:4 toRow:22 andColumn:5], @"An excetion should have been rised when trying to move cell state");
}// end of testMovingCellState_withInVaildCoordsForBothOriginDest_shouldReturnDestCoords()

- (void)testMovingCellState_withInVaildCoordsForOrigin_shouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard moveCellStateFromRow:20 andColumn:4 toRow:2 andColumn:5], @"An excetion should have been rised when trying to move cell state");
}// end of testMovingCellState_withInVaildCoordsForBothOriginDest_shouldReturnDestCoords()

- (void)testMovingCellState_withInVaildCoordsForDest_shouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:22 andColumn:5], @"An excetion should have been rised when trying to move cell state");
}// end of testMovingCellState_withInVaildCoordsForBothOriginDest_shouldReturnDestCoords()

@end
