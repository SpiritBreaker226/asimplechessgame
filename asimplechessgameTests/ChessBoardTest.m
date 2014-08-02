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
	[_testChessBoard clearBoardAndSetChessColour:@"Black"];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	_testChessBoard = nil;
}// end of tearDown()

/*
 
 Iniitial State Test
 
*/

- (void)testInitialState_shouldBeEmptyInMiddleOfBoard {
	// goes around for each of the row on the board
	for (int indexRow = 2; indexRow < 6; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There Row: %i, Column: %i is empty on chess board", indexRow, indexCol);
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldBeEmptyInMiddleOfBoard()

- (void)testInitialState_shouldChessPeicesBeLastTwoRowsShouldBeWhite {
	// goes around for each of the row on the board
	for (int indexRow = 6; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks if the is 6 as those rows are where the pawns will go
			if(indexRow == 6) {
				XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a white pawn chess peice on chess board at Row: %i, Column: %i", 6, indexCol);
			}// end of if
			else {
				// checks which chess peices this column will have to display them
				switch (indexCol) {
					case 0:
					case 7:
						XCTAssertEqual(8, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a white rook chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 1:
					case 6:
						XCTAssertEqual(9, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a white knight chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 2:
					case 5:
						XCTAssertEqual(10, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a white bishop chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 3:
						XCTAssertEqual(11, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a white king chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 4:
						XCTAssertEqual(12, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a white queen chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
				}// end of switch
			}// end of else
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldChessPeicesBeLastTwoRowsShouldBeWhite()

- (void)testInitialState_shouldChessPeicesBeLastTwoRowsShouldBeBlack {
	// clears and applys the starting baord for White colour
	[_testChessBoard clearBoardAndSetChessColour:@"White"];
	
	// goes around for each of the row on the board
	for (int indexRow = 6; indexRow < 8; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0 ; indexCol < 8; indexCol++) {
			// checks if the is 6 as those rows are where the pawns will go
			if(indexRow == 6) {
				XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a black pawn chess peice on chess board at Row: %i, Column: %i", 6, indexCol);
			}// end of if
			else {
				// checks which chess peices this column will have to display them
				switch (indexCol) {
					case 0:
					case 7:
						XCTAssertEqual(2, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a black rook chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 1:
					case 6:
						XCTAssertEqual(3, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a black knight chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 2:
					case 5:
						XCTAssertEqual(4, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a black bishop chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 3:
						XCTAssertEqual(5, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a black king chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
					case 4:
						XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType], @"Chess Board Initial State: There is a black queen chess peice on chess board at Row: %i, Column: %i", indexRow, indexCol);
						break;
				}// end of switch
			}// end of else
		}// end of column for loop
	}// end of row for loop
}// end of testInitialState_shouldChessPeicesBeLastTwoRowsShouldBeBlack()

- (void)testInitialState_shouldTwoChessPeiceKingsBeAtTheFirstAndLastRow {
	XCTAssertEqual(5, [[_testChessBoard getCurrentStateAtRow:0 andColumn:3] chessPieceType], @"Chess Board Initial State: There is a king chess peice on chess board at Row: %i, Column: %i", 0, 3);
	XCTAssertEqual(11, [[_testChessBoard getCurrentStateAtRow:7 andColumn:3] chessPieceType], @"Chess Board Initial State: There is a king chess peice on chess board at Row: %i, Column: %i", 7, 3);
}// end of testInitialState_shouldTwoChessPeiceKingsBeAtTheFirstAndLastRow()

- (void)testInitialState_clearBoard_shouldHaveCountOf32ChessPiecesWhenUserSelectsWhite {
	XCTAssertEqual(32, [[_testChessBoard clearBoardAndSetChessColour:@"White"] count], @"Chess Board Initial State: There are 32 chess peices at the start of the game when user selects white");
}//end of testInitialState_clearBoard_shouldHaveCountOf32ChessPiecesWhenUserSelectsWhite()

- (void)testInitialState_clearBoard_shouldHaveCountOf32ChessPiecesWhenUserSelectsBlack {
	XCTAssertEqual(32, [[_testChessBoard clearBoardAndSetChessColour:@"Black"] count], @"Chess Board Initial State: There are 32 chess peices at the start of the game when user selects black");
}//end of testInitialState_clearBoard_shouldHaveCountOf32ChessPiecesWhenUserSelectsBlack()

- (void)testInitialState_createCellsOnBoard_shouldHaveCountOf64ChessCells {
	XCTAssertEqual(64, [[_testChessBoard createCellsOnBoard] count], @"Chess Board Initial State: There are 64 chess board cells in the game");
}//end of testInitialState_createCellsOnBoard_shouldHaveCountOf64ChessCells()

/*
 
 Cell State Test
 
*/

- (void)testSetCellState_withValidCoords_cellStateShouldChange {
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:3 andColumn:6] chessPieceType], @"Chess Board Set Cell State: This cell Chess Pirce should be empty");
	
	// sets the state of a cell to White Bishop on the chess board to test
	[_testChessBoard setCellState:10 OnRow:3 andColumn:6];
	
	// It should now be find the current state for that location
	XCTAssertEqual(10, [[_testChessBoard getCurrentStateAtRow:3 andColumn:6] chessPieceType], @"Chess Board Set Cell State: This cell Chess Piece cannot be moved here");
}// end of testSetCellState_withValidCoords_cellStateShouldChange()

- (void)testSetCellState_withInvalidCoords_cellShouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard setCellState:11 OnRow:9 andColumn:8], @"Chess Board Set Cell State: An excetion should have been rised for this cell");
}// end of testSetCellState_withInvalidCoords_cellShouldErrorOut()

- (void)testSearchForCellState_withValidState_shouldFindBothBlackRooks {
	NSArray* findBlackRooks = [_testChessBoard findAllCellState:2];
	
	XCTAssertEqual(2, [findBlackRooks count], @"Chess Board Search For Cell State: Found both black rooks by count them");
	XCTAssertEqual(2, [[_testChessBoard getCurrentStateAtRow:[[[findBlackRooks objectAtIndex:0] objectAtIndex:0] intValue] andColumn:[[[findBlackRooks objectAtIndex:0] objectAtIndex:1] intValue]] chessPieceType], @"Chess Board Search For Cell State: Found The First black rooks");
	XCTAssertEqual(2, [[_testChessBoard getCurrentStateAtRow:[[[findBlackRooks objectAtIndex:1] objectAtIndex:0] intValue] andColumn:[[[findBlackRooks objectAtIndex:0] objectAtIndex:1] intValue]] chessPieceType], @"Chess Board Search For Cell State: Found The Secord black rooks");
}// end of testSearchForCellState_withValidState_shouldFindBothRooks()

- (void)testSearchForCellState_withInValidState_shouldFindNoResults {
	NSArray* findWhiteKnight = [_testChessBoard findAllCellState:9];
	
	XCTAssertNotEqual(1, [findWhiteKnight count], @"Chess Board Search For Cell State: No White Knight Found by count them");
}// end of testSearchForCellState_withInValidState_shouldFindNoResults()

- (void)testMovingCellState_withVaildCoordsForBothOriginDest_shouldReturnTrue {
	[_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:2 andColumn:5];
	 
	// it should have black queen at row 2 column 5 and be empty at row 0 column 4
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:2 andColumn:5] chessPieceType], @"Chess Board Moving Cell State: This cell should have black queen");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:0 andColumn:4] chessPieceType], @"Chess Board Moving Cell State: This cell should be empty as the queen was here");
}// end of testMovingCellState_withVaildCoordsForBothOriginDest_shouldReturnDestCoords()

- (void)testMovingCellState_withInVaildCoordsForBothOriginDest_shouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard moveCellStateFromRow:20 andColumn:4 toRow:22 andColumn:5], @"Chess Board Moving Cell State: An excetion should have been rised when trying to move cell state");
}// end of testMovingCellState_withInVaildCoordsForBothOriginDest_shouldReturnDestCoords()

- (void)testMovingCellState_withInVaildCoordsForOrigin_shouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard moveCellStateFromRow:20 andColumn:4 toRow:2 andColumn:5], @"Chess Board Moving Cell State: An excetion should have been rised when trying to move cell state");
}// end of testMovingCellState_withInVaildCoordsForBothOriginDest_shouldReturnDestCoords()

- (void)testMovingCellState_withInVaildCoordsForDest_shouldErrorOut {
	// it should error out
	XCTAssertThrows([_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:22 andColumn:5], @"Chess Board Moving Cell State: An excetion should have been rised when trying to move cell state");
}// end of testMovingCellState_withInVaildCoordsForBothOriginDest_shouldReturnDestCoords()

/*
 
 General Get Movment Test
 
*/

-(void)testGetAllMovmentOnFourQueensAtEachCouner_withValidChessPieceType_eachShouldGiveThreePostionsToMoveTo {
	// goes around removes all other chess types from the board as they are not need for the test
	for (int indexRow = 0; indexRow < NumOfRows; indexRow++) {
		// goes around for each of the column
		for (int indexCol = 0; indexCol < NumOfCols; indexCol++) {
			// checks if this is not a queen piece
			if([[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType] != 6 && [[_testChessBoard getCurrentStateAtRow:indexRow andColumn:indexCol] chessPieceType] != 12)
				[_testChessBoard setCellState:0 OnRow:indexRow andColumn:indexCol];
		}// end of column for loop
	}// end of row for loop
	
	[_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:0 andColumn:0];
	[_testChessBoard setCellState:12 OnRow:0 andColumn:7];
	[_testChessBoard moveCellStateFromRow:7 andColumn:4 toRow:7 andColumn:7];
	[_testChessBoard setCellState:6 OnRow:7 andColumn:0];
	
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:0 andColumn:0] chessPieceType], @"Chess Board Four Queen Test: There is a black queen in couner Row 0, Col: 0");
	XCTAssertEqual(12, [[_testChessBoard getCurrentStateAtRow:0 andColumn:7] chessPieceType], @"Chess Board Four Queen Test: There is a white queen in couner Row 0, Col: 7");
	XCTAssertEqual(12, [[_testChessBoard getCurrentStateAtRow:7 andColumn:7] chessPieceType], @"Chess Board Four Queen Test: There is a white queen in couner Row 7, Col: 7");
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:7 andColumn:0] chessPieceType], @"Chess Board Four Queen Test: There is a black queen in couner Row 7, Col: 0");
	
	// in order to make sure all movements are working since the queen can almost move any where be having four
	// queens on each corner this will test if out of bonads anrea as well as if it can pick their friends as well as the foe chess piece
	
	NSArray* allPostionsAllowedForThisQueen = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:0]];
	
	// it should return an array of three for black queen
	XCTAssertEqual(3, [allPostionsAllowedForThisQueen count], @"Chess Board Four Queen Test: There should be three move");
	XCTAssertEqual(6, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellRow], @"Chess Board Four Queen Test: The top destionasion can go up to row at 6");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellCol], @"Chess Board Four Queen Test: The top destionasion can go up to col at 0");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:0] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Empty Space");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellRow], @"Chess Board Four Queen Test: The right destionasion can go up to row at 0");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellCol], @"Chess Board Four Queen Test: The right destionasion can go up to col at 7");
	XCTAssertEqual(12, [[allPostionsAllowedForThisQueen objectAtIndex:1] chessPieceType], @"Chess Board Four Queen Test: Cell Type is White Queen");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellRow], @"Chess Board Four Queen Test: The top right destionasion can go up to row at 7");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellCol], @"Chess Board Four Queen Test: The top right destionasion can go up to col at 7");
	XCTAssertEqual(12, [[allPostionsAllowedForThisQueen objectAtIndex:2] chessPieceType], @"Chess Board Four Queen Test: Cell Type is White Queen");
	
	// resets allPostionsAllowedForThisQueen for next queen piece
	allPostionsAllowedForThisQueen = nil;
	
	allPostionsAllowedForThisQueen = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:7]];
	
	// it should return an array of three for white queen
	XCTAssertEqual(3, [allPostionsAllowedForThisQueen count], @"Chess Board Four Queen Test: There should be three move");
	XCTAssertEqual(6, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellRow], @"Chess Board Four Queen Test: The top destionasion can go up to row at 6");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellCol], @"Chess Board Four Queen Test: The top destionasion can go up to col at 7");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:0] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Empty Space");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellRow], @"Chess Board Four Queen Test: The left destionasion can go up to row at 0");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellCol], @"Chess Board Four Queen Test: The left destionasion can go up to col at 0");
	XCTAssertEqual(6, [[allPostionsAllowedForThisQueen objectAtIndex:1] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Black Queen");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellRow], @"Chess Board Four Queen Test: The top left destionasion can go up to row at 7");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellCol], @"Chess Board Four Queen Test: The top left destionasion can go up to col at 0");
	XCTAssertEqual(6, [[allPostionsAllowedForThisQueen objectAtIndex:2] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Black Queen");
	
	// resets allPostionsAllowedForThisQueen for next queen piece
	allPostionsAllowedForThisQueen = nil;
	
	allPostionsAllowedForThisQueen = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:7 andColumn:7]];
	
	// it should return an array of three for white queen
	XCTAssertEqual(3, [allPostionsAllowedForThisQueen count], @"Chess Board Four Queen Test: There should be three move");
	XCTAssertEqual(1, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellRow], @"Chess Board Four Queen Test: The bottom destionasion can go up to row at 1");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellCol], @"Chess Board Four Queen Test: The bottom destionasion can go up to col at 7");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:0] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Empty Space");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellRow], @"Chess Board Four Queen Test: The left destionasion can go up to row at 7");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellCol], @"Chess Board Four Queen Test: The left destionasion can go up to col at 0");
	XCTAssertEqual(6, [[allPostionsAllowedForThisQueen objectAtIndex:1] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Black Queen");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellRow], @"Chess Board Four Queen Test: The bottom left destionasion can go up to row at 0");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellCol], @"Chess Board Four Queen Test: The bottom left destionasion can go up to col at 0");
	XCTAssertEqual(6, [[allPostionsAllowedForThisQueen objectAtIndex:2] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Black Queen");

	// resets allPostionsAllowedForThisQueen for next queen piece
	allPostionsAllowedForThisQueen = nil;
	
	allPostionsAllowedForThisQueen = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:7 andColumn:0]];
	
	// it should return an array of three for black queen
	XCTAssertEqual(3, [allPostionsAllowedForThisQueen count], @"Chess Board Four Queen Test: There should be three move");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellRow], @"Chess Board Four Queen Test: The bottom destionasion can go up to row at 7");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:0] cellCol], @"Chess Board Four Queen Test: The bottom destionasion can go up to col at 7");
	XCTAssertEqual(12, [[allPostionsAllowedForThisQueen objectAtIndex:0] chessPieceType], @"Chess Board Four Queen Test: Cell Type is White Queen");
	XCTAssertEqual(1, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellRow], @"Chess Board Four Queen Test: The right destionasion can go up to row at 1");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:1] cellCol], @"Chess Board Four Queen Test: The right destionasion can go up to col at 0");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:1] chessPieceType], @"Chess Board Four Queen Test: Cell Type is Empty Space");
	XCTAssertEqual(0, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellRow], @"Chess Board Four Queen Test: The bottom right destionasion can go up to row at 0");
	XCTAssertEqual(7, [[allPostionsAllowedForThisQueen objectAtIndex:2] cellCol], @"Chess Board Four Queen Test: The bottom right destionasion can go up to col at 7");
	XCTAssertEqual(12, [[allPostionsAllowedForThisQueen objectAtIndex:2] chessPieceType], @"Chess Board Four Queen Test: Cell Type is White Queen");
}// end of testGetAllMovmentOnFourQueensAtEachCouner_withValidChessPieceType_eachShouldGiveThreePostionsToMoveTo()

- (void)testGetAllowMovement_withInValidChessPieceType_shouldErrorOut {
	XCTAssertThrows([_testChessBoard getAllAllowedMovementForChessPiece:nil], @"Chess Board InValid Chess Piece Type Test: No Valid Type");
}// end of testGetAllowMovement_withInValidChessPieceType_shouldErrorOut()

/*
 
 Pawn Test
 
*/

- (void)testGetAllowMovementForThisBlackPawn_withVaildChessPieceType_shouldGiveOnePointToMoveUp {
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:1 andColumn:5]];
	
	// it should return an array of one since it just move one positon up
	XCTAssertEqual(1, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Pawn: There should be one move for this chess piece");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Pawn: The destionasion can go up to row at 3");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Pawn: The destionasion can go up to column at 5");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] chessPieceType], @"Chess Board Get Allow Movement For This Black Pawn: Location of Destionation On Cell Type is Empty");
}// end of testGetAllowMovementForThisBlackPawn_withVaildChessPieceType_shouldGiveOnePointToMoveUp()

- (void)testGetAllowMovementForThisBlackPawnWhenItAlreadyMoved_withVaildChessPieceType_shouldThenMoveOnlyOneMove {
	[_testChessBoard moveCellStateFromRow:1 andColumn:5 toRow:2 andColumn:5];
	[[_testChessBoard getCurrentStateAtRow:2 andColumn:5] setHasThisChessPieceMovedOnce:1];
	
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:2 andColumn:5] chessPieceType], @"Chess Board Get Allow Movement For This Black Pawn: There is a black Pawn who has already moved");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:2 andColumn:5]];
	
	// it should return an array of one since it just move one positon up
	XCTAssertEqual(1, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Pawn: There should be one move for this chess piece");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Pawn: The destionasion can go up to row at 3");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Pawn: The destionasion can go up to column at 5");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] chessPieceType], @"Chess Board Get Allow Movement For This Black Pawn: Location of Destionation On Cell Type is Empty");
}// end of testGetAllowMovementForThisBlackPawnWhenItAlreadyMoved_withVaildChessPieceType_shouldThenMoveOnlyOneMove()

- (void)testGetAllowMovementForThisWhitePawn_withVaildChessPieceType_shouldGiveOnePointToMoveUp {
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:6 andColumn:5]];
	
	// it should return an array of one since it just move one positon up
	XCTAssertEqual(1, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This White Pawn: There should be one move for this chess piece");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This White Pawn: The destionasion can go up to row at 4");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This White Pawn: The destionasion can go up to column at 5");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] chessPieceType], @"Chess Board Get Allow Movement For This White Pawn: Location of Destionation On Cell Type is Empty");
}// end of testGetAllowMovementForThisWhitePawn_withVaildChessPieceType_shouldGiveOnePointToMoveUp()

- (void)testGetAllowMovementForThisWhitePawnWhenItAlreadyMoved_withVaildChessPieceType_shouldThenMoveOnlyOneMove {
	[_testChessBoard moveCellStateFromRow:6 andColumn:5 toRow:5 andColumn:5];
	[[_testChessBoard getCurrentStateAtRow:5 andColumn:5] setHasThisChessPieceMovedOnce:1];
	
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:5 andColumn:5] chessPieceType], @"Chess Board Get Allow Movement For This White Pawn: There is a White Pawn who has already moved");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:5 andColumn:5]];
	
	// it should return an array of one since it just move one positon up
	XCTAssertEqual(1, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This White Pawn: There should be one move for this chess piece");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This White Pawn: The destionasion can go up to row at 4");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This White Pawn: The destionasion can go up to column at 5");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] chessPieceType], @"Chess Board Get Allow Movement For This White Pawn: Location of Destionation On Cell Type is Empty");
}// end of testGetAllowMovementForThisWhitePawnWhenItAlreadyMoved_withVaildChessPieceType_shouldThenMoveOnlyOneMove()

- (void)testDoingEnPassant_withVaildChessPieceTypes_shouldGiveOptionToAttackTheWhitePawnOnRightSide {
	/*
	  En Passant
	 
	  If a pawn moves out two squares on its first move, and by doing so lands to the side of an opponent’s pawn (effectively jumping past the other pawn’s ability to capture it), that other pawn has the option of capturing the first pawn as it passes by. This special move must be done immediately after the first pawn has moved past, otherwise the option to capture it is no longer available.
	*/
	
	[_testChessBoard moveCellStateFromRow:6 andColumn:4 toRow:3 andColumn:4];
	[_testChessBoard moveCellStateFromRow:1 andColumn:3 toRow:3 andColumn:3];
	[[_testChessBoard getCurrentStateAtRow:3 andColumn:3] setHasThisChessPieceMovedOnce:1];
	
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:3 andColumn:4] chessPieceType], @"Chess Board Doing En Passant: There is a White Pawn which just made a two column move");
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:3 andColumn:3] chessPieceType], @"Chess Board Doing En Passant: There is a Black Pawn in the row beside the white pawn");
	
	NSArray* movesForBlackPawn = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:3]];
	
	// It should return one move that for the black pawn
	XCTAssertEqual(1, [movesForBlackPawn count], @"Chess Board Doing En Passant: Before The White Pawn Has Moved Twice There Will Be Two Moves avaiable");
	XCTAssertEqual(4, [[movesForBlackPawn objectAtIndex:0] cellRow], @"Chess Board Doing En Passant: The destionasion can go up to row at 4");
	XCTAssertEqual(3, [[movesForBlackPawn objectAtIndex:0] cellCol], @"Chess Board Doing En Passant: The destionasion can go up to col at 3");
	
	[[_testChessBoard getCurrentStateAtRow:3 andColumn:4] setHasThisChessPieceMovedOnce:0];
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:3 andColumn:4] hasThisChessPieceMovedOnce], @"Chess Board Doing En Passant: This Pawn Move Two Columns");
	
	movesForBlackPawn = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:3]];
	
	// it should return an array of two that there is on to move up and other
	XCTAssertEqual(2, [movesForBlackPawn count], @"Chess Board Doing En Passant: After The White Pawn Has Moved Twice There Will Be Two Moves avaiable");
	XCTAssertEqual(4, [[movesForBlackPawn objectAtIndex:0] cellRow], @"Chess Board Doing En Passant: The destionasion can go up to row at 4");
	XCTAssertEqual(3, [[movesForBlackPawn objectAtIndex:0] cellCol], @"Chess Board Doing En Passant: The destionasion can go up to col at 3");
	XCTAssertEqual(3, [[movesForBlackPawn objectAtIndex:1] cellRow], @"Chess Board Doing En Passant: The destionasion can go to right to row at 3");
	XCTAssertEqual(4, [[movesForBlackPawn objectAtIndex:1] cellCol], @"Chess Board Doing En Passant: The destionasion can go to right to col at 4");
}// end of testDoingEnPassant_withVaildChessPieceTypes_shouldGiveOptionToAttackTheWhitePawnOnRightSide()

- (void)testDoingEnPassant_withVaildChessPieceTypes_shouldGiveOptionToAttackTheWhitePawnOnLeftSide {
	[_testChessBoard moveCellStateFromRow:6 andColumn:4 toRow:3 andColumn:2];
	[_testChessBoard moveCellStateFromRow:1 andColumn:3 toRow:3 andColumn:3];
	[[_testChessBoard getCurrentStateAtRow:3 andColumn:3] setHasThisChessPieceMovedOnce:1];
	
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:3 andColumn:2] chessPieceType], @"Chess Board Doing En Passant: There is a White Pawn which just made a two column move");
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:3 andColumn:3] chessPieceType], @"Chess Board Doing En Passant: There is a Black Pawn in the row beside the white pawn");
	
	NSArray* movesForBlackPawn = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:3]];
	
	// It should return one move that for the black pawn
	XCTAssertEqual(1, [movesForBlackPawn count], @"Chess Board Doing En Passant: Before The White Pawn Has Moved Twice There Will Be Two Moves avaiable");
	XCTAssertEqual(4, [[movesForBlackPawn objectAtIndex:0] cellRow], @"Chess Board Doing En Passant: The destionasion can go up to row at 4");
	XCTAssertEqual(3, [[movesForBlackPawn objectAtIndex:0] cellCol], @"Chess Board Doing En Passant: The destionasion can go up to col at 3");
	
	[[_testChessBoard getCurrentStateAtRow:3 andColumn:2] setHasThisChessPieceMovedOnce:0];
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:3 andColumn:2] hasThisChessPieceMovedOnce], @"Chess Board Doing En Passant: This Pawn Move Two Columns");
	
	movesForBlackPawn = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:3]];
	
	// it should return an array of two that there is on to move up and other
	XCTAssertEqual(2, [movesForBlackPawn count], @"Chess Board Doing En Passant: After The White Pawn Has Moved Twice There Will Be Two Moves avaiable");
	XCTAssertEqual(4, [[movesForBlackPawn objectAtIndex:0] cellRow], @"Chess Board Doing En Passant: The destionasion can go up to row at 4");
	XCTAssertEqual(3, [[movesForBlackPawn objectAtIndex:0] cellCol], @"Chess Board Doing En Passant: The destionasion can go up to col at 3");
	XCTAssertEqual(3, [[movesForBlackPawn objectAtIndex:1] cellRow], @"Chess Board Doing En Passant: The destionasion can go to right to row at 3");
	XCTAssertEqual(2, [[movesForBlackPawn objectAtIndex:1] cellCol], @"Chess Board Doing En Passant: The destionasion can go to left to col at 2");
}// end of testDoingEnPassant_withVaildChessPieceTypes_shouldGiveOptionToAttackTheWhitePawnOnLeftSide()

/*-(void)testGetMovementForChessPiecePawn_withVaildChessPieceInFrontOfPawn_shouldNotBeAbleToMove {
	[_testChessBoard moveCellStateFromRow:6 andColumn:3 toRow:2 andColumn:3];
	
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:2 andColumn:3] chessPieceType], @"Get Movement For Chess Piece Pawn: There is a White Pawn which is front of pawn");
	
	// it should not be able to move
	XCTAssertEqual(0, [[_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:1 andColumn:3]] count], @"Get Movement For Chess Piece Pawn: The Black Pawn is not able to move");
}// end of testGetMovementChessPieceInFrontOfPawn_withVaildChessPieceInFrontOfPawn_shouldNotBeAbleToMove()*/

/*
 
 Rook Test
 
*/

- (void)testGetAllowMovementForThisBlackRook_withMoveToCenterOfBoard_shouldGiveFourPointsToMove {
	// moves the black rook to row 4 column 6
	[_testChessBoard moveCellStateFromRow:0 andColumn:0 toRow:4 andColumn:6];
	
	// there should be a black rook at row 4 column 6
	XCTAssertEqual(2, [[_testChessBoard getCurrentStateAtRow:4 andColumn:6] chessPieceType], @"Chess Board Get Allow Movement For This Black Rook: There is a black rook in the center of the chess board for testing getting alloed movments");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:4 andColumn:6]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(4, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Rook: There should be four move for the rook");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Rook: The top destionasion can go up to row at 6");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Rook: The top destionasion can go up to col at 6");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black Rook: The right destionasion can go up to row at 4");
	XCTAssertEqual(7, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black Rook: The right destionasion can go up to col at 7");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellRow], @"Chess Board Get Allow Movement For This Black Rook: The bottom destionasion can go up to row at 2");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellCol], @"Chess Board Get Allow Movement For This Black Rook: The bottom destionasion can go up to col at 6");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellRow], @"Chess Board Get Allow Movement For This Black Rook: The Left destionasion can go up to row at 4");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellCol], @"Chess Board Get Allow Movement For This Black Rook: The Left destionasion can go up to col at 0");
}// end of testGetAllowMovementForThisBlackRook_withMoveToCenterOfBoard_shouldGiveFourPointsToMove()

- (void)testGetAllowMovementForThisBlackRook_withCounerTestOfBoard_shouldGiveTopPointsToMoveTopAndRight {
	[_testChessBoard moveCellStateFromRow:1 andColumn:0 toRow:4 andColumn:2];
	[_testChessBoard moveCellStateFromRow:0 andColumn:1 toRow:4 andColumn:6];
	
	// there should be a black Pawn to row 4 column 2 and a black knight to row 4 column 6
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:4 andColumn:2] chessPieceType], @"Chess Board Get Allow Movement For This Black Rook: There is a black pawn which will be out of the way for this test");
	XCTAssertEqual(3, [[_testChessBoard getCurrentStateAtRow:4 andColumn:6] chessPieceType], @"Chess Board Get Allow Movement For This Black Rook: There is a black pawn which will be out of the way for this test");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:0]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(2, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Rook: There should be two move for the rook");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Rook: The top destionasion can go up to row at 6");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Rook: The top destionasion can go up to col at 0");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black Rook: The right destionasion can go up to row at 0");
	XCTAssertEqual(1, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black Rook: The right destionasion can go up to col at 1");
}// end of testGetAllowMovementForThisBlackRook_withMoveToCenterOfBoard_shouldGiveFourPointsToMove()

- (void)testGetAllowMovementForThisBlackRook_withInStartingPostion_shouldGiveNoOpions {
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:7]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(0, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Rook: There should be no moves for right");
	
	// resets the postion fro the left rook
	allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:0]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(0, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Rook: There should be no moves for left");
}// end of testGetAllowMovementForThisBlackRook_withMoveToCenterOfBoard_shouldGiveFourPointsToMove()

/*
 
 Bishop Test
 
*/

- (void)testGetAllowMovementForThisBlackBishop_withMoveToCenterOfBoard_shouldGiveFourPointsToMove {
	// moves the black rook to row 4 column 6
	[_testChessBoard moveCellStateFromRow:0 andColumn:2 toRow:3 andColumn:4];
	
	// there should be a black bishop at row 3 column 4
	XCTAssertEqual(4, [[_testChessBoard getCurrentStateAtRow:3 andColumn:4] chessPieceType], @"Chess Board Get Allow Movement For This Black Bishop: There is a black bishop in the center of the chess board for testing getting alloed movments");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:4]];
	
	// it should return an array of four for all four main couners sides
	XCTAssertEqual(4, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Bishop: There should be four move for the bishop");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Bishop: The top right destionasion can go up to row at 6");
	XCTAssertEqual(7, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Bishop: The top right destionasion can go up to col at 7");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black Bishop: The bottom right destionasion can go up to row at 2");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black Bishop: The bottom right destionasion can go up to col at 5");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellRow], @"Chess Board Get Allow Movement For This Black Bishop: The bottom left destionasion can go up to row at 2");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellCol], @"Chess Board Get Allow Movement For This Black Bishop: The bottom left destionasion can go up to col at 3");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellRow], @"Chess Board Get Allow Movement For This Black Bishop: The top Left destionasion can go up to row at 6");
	XCTAssertEqual(1, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellCol], @"Chess Board Get Allow Movement For This Black Bishop: The top Left destionasion can go up to col at 1");
}// end of testGetAllowMovementForThisBlackBishop_withMoveToCenterOfBoard_shouldGiveFourPointsToMove()

- (void)testGetAllowMovementForThisBlackBishop_withInStartingPostion_shouldGiveNoOpions {
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:2]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(0, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Bishop: There should be no moves for the bishop");
}// end of testGetAllowMovementForThisBlackBishop_withInStartingPostion_shouldGiveNoOpions()

- (void)testGetAllowMovementForThisWhiteBishop_withInStartingPostion_shouldGiveNoOpions {
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:7 andColumn:2]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(0, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This White Bishop: There should be no moves for the bishop");
}// end of testGetAllowMovementForThisWhiteBishop_withInStartingPostion_shouldGiveNoOpions()

/*
 
 Queen Test
 
*/

- (void)testGetAllowMovementForThisBlackQueen_withMoveToCenterOfBoard_shouldGiveEightPointsToMove {
	// moves the black rook to row 4 column 6
	[_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:3 andColumn:4];
	
	// there should be a black queen at row 3 column 4
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:3 andColumn:4] chessPieceType], @"Chess Board Get Allow Movement For This Black Queen: There is a black Queen in the center of the chess board for testing getting alloed movments");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:4]];
	
	// it should return an array of Eight for all eight sides
	XCTAssertEqual(8, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black Queen: There should be eight move for the queen");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The top destionasion can go up to row at 6");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The top destionasion can go up to col at 4");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The right destionasion can go up to row at 3");
	XCTAssertEqual(7, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The right destionasion can go up to col at 7");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The bottom destionasion can go up to row at 2");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The bottom destionasion can go up to col at 4");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The Left destionasion can go up to row at 3");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The Left destionasion can go up to col at 0");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:4] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The top right destionasion can go up to row at 6");
	XCTAssertEqual(7, [[allPostionsAllowedForThisChessPiece objectAtIndex:4] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The top right destionasion can go up to col at 7");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:5] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The bottom right destionasion can go up to row at 2");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:5] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The bottom right destionasion can go up to col at 5");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:6] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The bottom left destionasion can go up to row at 2");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:6] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The bottom left destionasion can go up to col at 3");
	XCTAssertEqual(6, [[allPostionsAllowedForThisChessPiece objectAtIndex:7] cellRow], @"Chess Board Get Allow Movement For This Black Queen: The top Left destionasion can go up to row at 6");
	XCTAssertEqual(1, [[allPostionsAllowedForThisChessPiece objectAtIndex:7] cellCol], @"Chess Board Get Allow Movement For This Black Queen: The top Left destionasion can go up to col at 1");
}// end of testGetAllowMovementForThisBlackQueen_withMoveToCenterOfBoard_shouldGiveEightPointsToMove()

/*
 
 King Test
 
 */

- (void)testGetAllowMovementForThisBlackKing_withMoveToCenterOfBoard_shouldGiveEightPointsToMove {
	// moves the black rook to row 4 column 6
	[_testChessBoard moveCellStateFromRow:0 andColumn:3 toRow:3 andColumn:4];
	
	// there should be a black King at row 3 column 4
	XCTAssertEqual(5, [[_testChessBoard getCurrentStateAtRow:3 andColumn:4] chessPieceType], @"Chess Board Get Allow Movement For This Black King: There is a black King in the center of the chess board for testing getting alloed movments");
	
	// sets the King piece as move in order not to infer with other test
	[[_testChessBoard getCurrentStateAtRow:3 andColumn:4] setHasThisChessPieceMovedOnce:1];
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:3 andColumn:4]];
	
	// it should return an array of Eight for all eight sides
	XCTAssertEqual(8, [allPostionsAllowedForThisChessPiece count], @"Chess Board Get Allow Movement For This Black King: There should be eight move for the King");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black King: The top destionasion can go up to row at 3");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black King: The top destionasion can go up to col at 4");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black King: The right destionasion can go up to row at 3");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black King: The right destionasion can go up to col at 5");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellRow], @"Chess Board Get Allow Movement For This Black King: The bottom destionasion can go up to row at 2");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellCol], @"Chess Board Get Allow Movement For This Black King: The bottom destionasion can go up to col at 4");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellRow], @"Chess Board Get Allow Movement For This Black King: The Left destionasion can go up to row at 3");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellCol], @"Chess Board Get Allow Movement For This Black King: The Left destionasion can go up to col at 3");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:4] cellRow], @"Chess Board Get Allow Movement For This Black King: The top right destionasion can go up to row at 4");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:4] cellCol], @"Chess Board Get Allow Movement For This Black King: The top right destionasion can go up to col at 5");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:5] cellRow], @"Chess Board Get Allow Movement For This Black King: The bottom right destionasion can go up to row at 2");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:5] cellCol], @"Chess Board Get Allow Movement For This Black King: The bottom right destionasion can go up to col at 5");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:6] cellRow], @"Chess Board Get Allow Movement For This Black King: The bottom left destionasion can go up to row at 2");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:6] cellCol], @"Chess Board Get Allow Movement For This Black King: The bottom left destionasion can go up to col at 3");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:7] cellRow], @"Chess Board Get Allow Movement For This Black King: The top Left destionasion can go up to row at 4");
	XCTAssertEqual(3, [[allPostionsAllowedForThisChessPiece objectAtIndex:7] cellCol], @"Chess Board Get Allow Movement For This Black King: The top Left destionasion can go up to col at 3");
}// end of testGetAllowMovementForThisBlackKing_withMoveToCenterOfBoard_shouldGiveEightPointsToMove()

-(void)testCastlingMoveForBothSides_withVaildBlackKing_shouldProvideFourOptions {
	// moves both Kinights, Queen and Bishops to allow the King to do the castling
	[_testChessBoard moveCellStateFromRow:0 andColumn:1 toRow:3 andColumn:1];
	[_testChessBoard moveCellStateFromRow:0 andColumn:2 toRow:3 andColumn:2];
	[_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:3 andColumn:4];
	[_testChessBoard moveCellStateFromRow:0 andColumn:5 toRow:3 andColumn:5];
	[_testChessBoard moveCellStateFromRow:0 andColumn:6 toRow:3 andColumn:6];
	
	// there should be both Kinights, Queen and Bishops to allow the King to do the castling
	XCTAssertEqual(3, [[_testChessBoard getCurrentStateAtRow:3 andColumn:1] chessPieceType], @"Chess Board Castling For This Black King: There is a black Knight out of the way");
	XCTAssertEqual(4, [[_testChessBoard getCurrentStateAtRow:3 andColumn:2] chessPieceType], @"Chess Board Castling For This Black King: There is a black Bishop out of the way");
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:3 andColumn:4] chessPieceType], @"Chess Board Castling For This Black King: There is a black Queen out of the way");
	XCTAssertEqual(4, [[_testChessBoard getCurrentStateAtRow:3 andColumn:5] chessPieceType], @"Chess Board Castling For This Black King: There is a black Bishop out of the way");
	XCTAssertEqual(3, [[_testChessBoard getCurrentStateAtRow:3 andColumn:6] chessPieceType], @"Chess Board Castling For This Black King: There is a black Knight out of the way");
	
	NSArray* allPostionsAllowedForThisChessPiece = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:0 andColumn:3]];
	
	// it should be four Postions fir two are for normal moving then one to the the left where the knight was, for the Kingside castling and to the right where the bishop was for the Queenside castling
	XCTAssertEqual(4, [allPostionsAllowedForThisChessPiece count], @"Chess Board Castling For This Black King: There should be four move for the King");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black King: The right destionasion can go up to row at 0");
	XCTAssertEqual(4, [[allPostionsAllowedForThisChessPiece objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black King: The right destionasion can go up to col at 4");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black King: The left destionasion can go up to row at 0");
	XCTAssertEqual(2, [[allPostionsAllowedForThisChessPiece objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black King: The left destionasion can go up to col at 2");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellRow], @"Chess Board Get Allow Movement For This Black King: The right caslting option row at 0");
	XCTAssertEqual(5, [[allPostionsAllowedForThisChessPiece objectAtIndex:2] cellCol], @"Chess Board Get Allow Movement For This Black King: The right caslting option col at 5");
	XCTAssertEqual(0, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellRow], @"Chess Board Get Allow Movement For This Black King: The left caslting option row at 0");
	XCTAssertEqual(1, [[allPostionsAllowedForThisChessPiece objectAtIndex:3] cellCol], @"Chess Board Get Allow Movement For This Black King: The left caslting option col at 1");
}// end of testCastlingMoveForBothSides_withVaildBlackKing_shouldProvideFourOptions()

/*
 
 Knight test
 
*/

-(void)testCheckAllFourMainSides_withValidCentrePostion_shouldReturnFourOptions {
	// moves the black knight to row 4 column 4
	[_testChessBoard moveCellStateFromRow:0 andColumn:1 toRow:4 andColumn:4];
	
	// there should be a black knight at row 4 column 4
	XCTAssertEqual(3, [[_testChessBoard getCurrentStateAtRow:4 andColumn:4] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: There is a black Knight in the center of the chess board for testing getting alloed movments");
	
	NSArray* allPostionsAllowedForCentreCell = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:4 andColumn:4]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(4, [allPostionsAllowedForCentreCell count], @"Chess Board Get Allow Movement For This Black Knight: There should be four move");
	XCTAssertEqual(6, [[allPostionsAllowedForCentreCell objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Knight: The top destionasion can go up to row at 6");
	XCTAssertEqual(5, [[allPostionsAllowedForCentreCell objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Knight: The top destionasion can go up to col at 5");
	XCTAssertEqual(7, [[allPostionsAllowedForCentreCell objectAtIndex:0] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: Location of Destionation On Cell Type is Empty Space");
	
	XCTAssertEqual(3, [[allPostionsAllowedForCentreCell objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black Knight: The right destionasion can go up to row at 3");
	
	XCTAssertEqual(6, [[allPostionsAllowedForCentreCell objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black Knight: The right destionasion can go up to col at 6");
	XCTAssertEqual(0, [[allPostionsAllowedForCentreCell objectAtIndex:1] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: Location of Destionation On Cell Type is Empty Space");
	
	XCTAssertEqual(2, [[allPostionsAllowedForCentreCell objectAtIndex:2] cellRow], @"Chess Board Get Allow Movement For This Black Knight: The bottom destionasion can go up to row at 2");
	XCTAssertEqual(3, [[allPostionsAllowedForCentreCell objectAtIndex:2] cellCol], @"Chess Board Get Allow Movement For This Black Knight: The bottom destionasion can go up to col at 3");
	XCTAssertEqual(0, [[allPostionsAllowedForCentreCell objectAtIndex:2] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: Location of Destionation On Cell Type is Empty Space");
	
	XCTAssertEqual(5, [[allPostionsAllowedForCentreCell objectAtIndex:3] cellRow], @"Chess Board Get Allow Movement For This Black Knight: The Left destionasion can go up to row at 5");
	XCTAssertEqual(2, [[allPostionsAllowedForCentreCell objectAtIndex:3] cellCol], @"Chess Board Get Allow Movement For This Black Knight: The Left destionasion can go up to col at 2");
	XCTAssertEqual(0, [[allPostionsAllowedForCentreCell objectAtIndex:3] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckAllFourMainSides_withVaildBlackKing_shouldProvideFourOptions()

-(void)testCheckAllFourMainSides_withValidCentrePostionOnVaildBoard_shouldReturnFourOptions {
	// moves the black knight to row 4 column 0
	[_testChessBoard moveCellStateFromRow:0 andColumn:1 toRow:4 andColumn:0];
	
	// there should be a black knight at row 4 column 0
	XCTAssertEqual(3, [[_testChessBoard getCurrentStateAtRow:4 andColumn:0] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: There is a black Knight in the center of the chess board for testing getting alloed movments");
	
	NSArray* allPostionsAllowedForCentreCell = [_testChessBoard getAllAllowedMovementForChessPiece:[_testChessBoard getCurrentStateAtRow:4 andColumn:0]];
	
	// it should return an array of four for all four main sides top, right, bottom and left
	XCTAssertEqual(2, [allPostionsAllowedForCentreCell count], @"Chess Board Get Allow Movement For This Black Knight: There should be four move for the Knight");
	XCTAssertEqual(6, [[allPostionsAllowedForCentreCell objectAtIndex:0] cellRow], @"Chess Board Get Allow Movement For This Black Knight: The top destionasion can go up to row at 6");
	XCTAssertEqual(1, [[allPostionsAllowedForCentreCell objectAtIndex:0] cellCol], @"Chess Board Get Allow Movement For This Black Knight: The top destionasion can go up to col at 1");
	XCTAssertEqual(7, [[allPostionsAllowedForCentreCell objectAtIndex:0] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: Location of Destionation On Cell Type is White Pawn");
	XCTAssertEqual(3, [[allPostionsAllowedForCentreCell objectAtIndex:1] cellRow], @"Chess Board Get Allow Movement For This Black Knight: The right destionasion can go up to row at 3");
	XCTAssertEqual(2, [[allPostionsAllowedForCentreCell objectAtIndex:1] cellCol], @"Chess Board Get Allow Movement For This Black Knight: The right destionasion can go up to col at 2");
	XCTAssertEqual(0, [[allPostionsAllowedForCentreCell objectAtIndex:1] chessPieceType], @"Chess Board Get Allow Movement For This Black Knight: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckAllFourMainSides_withValidCentrePostionOnVaildBoard_shouldReturnFourOptions()

@end
