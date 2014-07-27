//
//  ChessMovesTest.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-18.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ChessMoves.h"
#import "ChessBoard.h"

@interface ChessMovesTest : XCTestCase
	@property(nonatomic) ChessMoves* testChessMoves;
	@property(nonatomic) ChessBoard* testChessBoard;
@end

@implementation ChessMovesTest

-(void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
	_testChessMoves = [[ChessMoves alloc] init];
	_testChessBoard = [[ChessBoard alloc] init];
	
	// clears and applys the starting baord
	[_testChessBoard clearBoardAndSetChessColour:@"Black"];
}// end of setUp()

-(void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
	
	_testChessMoves = nil;
	_testChessBoard = nil;
}// end of tearDown

/*
 
 Get Cells To the Top test
 
*/

-(void)testCheckCellsToTheTop_withVaildCoordsOnVaildBoard_shouldRetunLocationOfWhitePawn {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 6;
	
	[_testChessMoves getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a White Pawn
	XCTAssertEqual(6, locationOfDestinationRow, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Row 6");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Column 6");
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Type is White Pawn");
}// end of testCheckCellsToTheTop_withVaildCoordsOnVaildBoard_shouldRetunLocationOfWhitePawn()

-(void)testCheckCellsToTheTop_withVaildCoordsForPawnsFirstMoveOnVaildBoard_shouldRetunLocationOfEmpty {
	NSInteger locationOfDestinationRow = 1;
	NSInteger locationOfDestinationCol = 4;
	
	[_testChessMoves getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:2];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(3, locationOfDestinationRow, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Row 3");
	XCTAssertEqual(4, locationOfDestinationCol, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Column 4");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Type is Empty");
}// end of testCheckCellsToTheTop_withVaildCoordsForPawnsFirstMoveOnVaildBoard_shouldRetunLocationOfEmpty()

-(void)testCheckCellsToTheTop_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;

	[_testChessBoard moveCellStateFromRow:6 andColumn:4 toRow:4 andColumn:2];
	[_testChessBoard moveCellStateFromRow:7 andColumn:4 toRow:4 andColumn:6];
	
	// there should be a while Pawn to row 4 column 2 and a while queen to row 4 column 6
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:4 andColumn:2] chessPieceType], @"Chess Moves Check Cells To The Top: There is a white pawn in that is out of the way for testing if it will stop at boards border");
	XCTAssertEqual(12, [[_testChessBoard getCurrentStateAtRow:4 andColumn:6] chessPieceType], @"Chess Moves Check Cells To The Top: There is a white queen in that is out of the way for testing if it will stop at boards border");
	
	[_testChessMoves getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(7, locationOfDestinationRow, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Row 7");
	XCTAssertEqual(4, locationOfDestinationCol, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Column 4");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheTop_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheTop_withVaildCoordsWithSameColourPawnInFrontOfRowOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 3;
	NSInteger locationOfDestinationCol = 6;

	[_testChessBoard moveCellStateFromRow:1 andColumn:6 toRow:5 andColumn:6];
	
	// there should be a black Pawn at row 5 column 6
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:5 andColumn:6] chessPieceType], @"Chess Moves Check Cells To The Top: There is a black pawn in the frount of the row being checked");
	
	[_testChessMoves getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty at Row 4 Column 6
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Row 4");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Column 6");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheTop_withVaildCoordsWithSameColourPawnInFrontOfRowOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheTop_withVaildCoordsOnInVaildBoard_shouldErrorOut {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:nil forCellType:@"Black" withAllowedNumberOfMoves:8], @"Chess Moves Check Cells To The Top: Error not a valid board");
}// end of testCheckCellsToTheTop_withInVaildCoordsOnVaildBoard_shouldErrorOut()

-(void)testCheckCellsToTheTop_withInVaildAllowedNumbersOnVaildBoard_shouldNotErrorOut {
	NSInteger locationOfDestinationRow = 20;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheTopCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:10], @"Chess Moves Check Cells To The Top: Error Outside Of Board");
}// end of testCheckCellsToTheTop_withInVaildCoordsOnVaildBoard_shouldNotErrorOut()

/*
 
 Get Cells To the Right test
 
*/

-(void)testCheckCellsToTheRight_withVaildCoordsOnVaildBoard_shouldRetunLocationEmpty {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	[_testChessMoves getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Row 4");
	XCTAssertEqual(7, locationOfDestinationCol, @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Column 7");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheRight_withVaildCoordsOnVaildBoard_shouldRetunLocationEmpty()

-(void)testCheckCellsToTheRight_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfWhitePawn {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;

	[_testChessBoard moveCellStateFromRow:6 andColumn:4 toRow:4 andColumn:6];
	
	// there should be a while Pawn to row 4 column 4
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:4 andColumn:6] chessPieceType], @"Chess Moves Check Cells To The Right: There is a white pawn in that is out of the way for testing if it will stop at boards border");
	
	[_testChessMoves getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a White Pawn
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Row 4");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Column 6");
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheRight_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfWhitePawn()

-(void)testCheckCellsToTheRight_withVaildCoordsWithSameColourPawnColOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 3;
	NSInteger locationOfDestinationCol = 4;

	[_testChessBoard moveCellStateFromRow:1 andColumn:6 toRow:3 andColumn:6];
	
	// there should be a black Pawn at row 5 column 6
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:3 andColumn:6] chessPieceType], @"Chess Moves Check Cells To The Right: There is a black pawn in the frount of the row being checked");
	
	[_testChessMoves getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty at Row 3 Column 6
	XCTAssertEqual(3, locationOfDestinationRow, @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Row 3");
	XCTAssertEqual(5, locationOfDestinationCol, @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Column 6");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheRight_withVaildCoordsWithSameColourPawnColOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheRight_withVaildCoordsOnInVaildBoard_shouldErrorOut {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:nil forCellType:@"Black" withAllowedNumberOfMoves:8], @"Chess Moves Check Cells To The Right: Error not a valid board");
}// end of testCheckCellsToTheRight_withInVaildCoordsOnVaildBoard_shouldErrorOut()

-(void)testCheckCellsToTheRight_withInVaildAllowedNumbersOnVaildBoard_shouldNotErrorOut {
	NSInteger locationOfDestinationRow = 20;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:10], @"Chess Moves Check Cells To The Right: Error Outside Of Board");
}// end of testCheckCellsToTheRight_withInVaildCoordsOnVaildBoard_shouldNotErrorOut()

/*
 
 Get Cells To the Bottom test
 
*/

-(void)testCheckCellsToTheBottom_withVaildCoordsOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 6;
	
	[_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(2, locationOfDestinationRow, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Row 2");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Column 6");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Type is White Pawn");
}// end oftestCheckCellsToTheBottom_withVaildCoordsOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheBottom_withVaildCoordsForCenterMoveDownOnVaildBoard_shouldRetunLocationOfEmpty {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	[_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:2];
	
	// should be one point and on that point it should be a Space
	XCTAssertEqual(2, locationOfDestinationRow, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Row 2");
	XCTAssertEqual(4, locationOfDestinationCol, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Column 4");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Type is Empty");
}// end of testCheckCellsToTheTop_withVaildCoordsForPawnsFirstMoveOnVaildBoard_shouldRetunLocationOfEmpty()

-(void)testCheckCellsToTheBottom_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;

	[_testChessBoard moveCellStateFromRow:1 andColumn:4 toRow:4 andColumn:2];
	[_testChessBoard moveCellStateFromRow:0 andColumn:4 toRow:4 andColumn:6];
	
	// there should be a while Pawn to row 4 column 2 and a while queen to row 4 column 6
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:4 andColumn:2] chessPieceType], @"Chess Moves Check Cells To The Bottom: There is a white pawn in that is out of the way for testing if it will stop at boards border");
	XCTAssertEqual(6, [[_testChessBoard getCurrentStateAtRow:4 andColumn:6] chessPieceType], @"Chess Moves Check Cells To The Bottom: There is a white queen in that is out of the way for testing if it will stop at boards border");
	
	[_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty
	XCTAssertEqual(0, locationOfDestinationRow, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Row 0");
	XCTAssertEqual(4, locationOfDestinationCol, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Column 4");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheBottom_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheBottom_withVaildChessPieceType_shouldGiveOnePointToMoveUp {
	NSInteger locationOfDestinationRow = 6;
	NSInteger locationOfDestinationCol = 4;
		
	[_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"White" withAllowedNumberOfMoves:2];
	
	// it should return an array of one since it just move one positon up
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Bottom: The destionasion can go up to row at 4");
	XCTAssertEqual(4, locationOfDestinationCol, @"Chess Moves Check Cells To The Bottom: The destionasion can go up to column at 4");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Type is Empty");
}// end of testGetAllowMovementForThisWhitePawn_withVaildChessPieceType_shouldGiveOnePointToMoveUp()

-(void)testCheckCellsToTheBottom_withRemoveBlackKingOnVaildBoard_shouldDestinationRow0ForPawn {
	NSInteger locationOfDestinationRow = 1;
	NSInteger locationOfDestinationCol = 3;
	
	[_testChessBoard moveCellStateFromRow:0 andColumn:3 toRow:4 andColumn:4];
	
	// there should be nothing on the black kings spot Row 0 column 3
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:0 andColumn:3] chessPieceType], @"Chess Moves Check Cells To The Bottom: There is a white pawn in that is out of the way for testing if it will stop at boards border");
	
	[_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:1];
	
	// should be one point on Row 0, Column 3
	XCTAssertEqual(0, locationOfDestinationRow, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Row 0");
	XCTAssertEqual(3, locationOfDestinationCol, @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Column 3");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Bottom: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheBottom_withRemoveKingOnVaildBoard_shouldDestinationRow0ForPawn()

-(void)testCheckCellsToTheBottom_withVaildCoordsOnInVaildBoard_shouldErrorOut {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:nil forCellType:@"Black" withAllowedNumberOfMoves:8], @"Chess Moves Check Cells To The Bottom: Error not a valid board");
}// end of testCheckCellsToTheBottom_withInVaildCoordsOnVaildBoard_shouldErrorOut()

-(void)testCheckCellsToTheBottom_withInVaildAllowedNumbersOnVaildBoard_shouldNotErrorOut {
	NSInteger locationOfDestinationRow = 20;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheBottomCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:10], @"Chess Moves Check Cells To The Bottom: Error Outside Of Board");
}// end of testCheckCellsToTheBottom_withInVaildCoordsOnVaildBoard_shouldNotErrorOut()

/*
 
 Get Cells To the Left test
 
*/

-(void)testCheckCellsToTheLeft_withVaildCoordsOnVaildBoard_shouldRetunLocationEmpty {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	[_testChessMoves getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Row 4");
	XCTAssertEqual(0, locationOfDestinationCol, @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Column 0");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheLeft_withVaildCoordsOnVaildBoard_shouldRetunLocationEmpty()

-(void)testCheckCellsToTheLeft_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfWhitePawn {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;

	[_testChessBoard moveCellStateFromRow:6 andColumn:4 toRow:4 andColumn:2];
	
	// there should be a while Pawn to row 4 column 2
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:4 andColumn:2] chessPieceType], @"Chess Moves Check Cells To The Left: There is a white pawn in that is out of the way for testing if it will stop at boards border");
	
	[_testChessMoves getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a White Pawn
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Row 4");
	XCTAssertEqual(2, locationOfDestinationCol, @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Column 2");
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheLeft_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfWhitePawn()

-(void)testCheckCellsToTheLeft_withVaildCoordsWithSameColourPawnColOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 3;
	NSInteger locationOfDestinationCol = 4;

	[_testChessBoard moveCellStateFromRow:1 andColumn:6 toRow:3 andColumn:1];
	
	// there should be a black Pawn at row 5 column 6
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:3 andColumn:1] chessPieceType], @"Chess Moves Check Cells To The Left: There is a black pawn in the frount of the row being checked");
	
	[_testChessMoves getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty at Row 3 Column 6
	XCTAssertEqual(3, locationOfDestinationRow, @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Row 3");
	XCTAssertEqual(2, locationOfDestinationCol, @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Column 1");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Left: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheLeft_withVaildCoordsWithSameColourPawnColOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheLeft_withVaildCoordsOnInVaildBoard_shouldErrorOut {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:nil forCellType:@"Black" withAllowedNumberOfMoves:8], @"Chess Moves Check Cells To The Left: Error not a valid board");
}// end of testCheckCellsToTheLeft_withInVaildCoordsOnVaildBoard_shouldErrorOut()

-(void)testCheckCellsToTheLeft_withInVaildAllowedNumbersOnVaildBoard_shouldNotErrorOut {
	NSInteger locationOfDestinationRow = 20;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheLeftCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:10], @"Chess Moves Check Cells To The Left: Error Outside Of Board");
}// end of testCheckCellsToTheLeft_withInVaildCoordsOnVaildBoard_shouldNotErrorOut()

/*
 
 Get Cells To the Top Right test
 
*/

-(void)testCheckCellsToTheTopRight_withVaildCoordsOnVaildBoard_shouldRetunLocationOfEmpty {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 6;
	
	[_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(5, locationOfDestinationRow, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Row 5");
	XCTAssertEqual(7, locationOfDestinationCol, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Column 7");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheTopRight_withVaildCoordsOnVaildBoard_shouldRetunLocationOfWhitePawn()

-(void)testCheckCellsToTheTopRight_withVaildCoordsForPawnsFirstMoveOnVaildBoard_shouldRetunLocationOfEmpty {
	NSInteger locationOfDestinationRow = 1;
	NSInteger locationOfDestinationCol = 4;
	
	[_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:2];
	
	// should be one point and on that point it should be a Empty Space
	XCTAssertEqual(3, locationOfDestinationRow, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Row 3");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Column 6");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheTopRight_withVaildCoordsForPawnsFirstMoveOnVaildBoard_shouldRetunLocationOfEmpty()

-(void)testCheckCellsToTheTopRight_withVaildCoordsOnVaildBoard_shouldRetunLocationOfWhotePawn {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	[_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a White Pawn
	XCTAssertEqual(6, locationOfDestinationRow, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Row 6");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Column 6");
	XCTAssertEqual(7, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Type is White Pawn");
}// end of testCheckCellsToTheTopRight_withVaildCoordsUntilEndOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheTopRight_withVaildCoordsWithSameColourPawnInFrontOfRowOnVaildBoard_shouldRetunLocationOfEmptySpace {
	NSInteger locationOfDestinationRow = 3;
	NSInteger locationOfDestinationCol = 6;
	
	[_testChessBoard moveCellStateFromRow:1 andColumn:6 toRow:5 andColumn:6];
	
	// there should be a black Pawn at row 5 column 6
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:5 andColumn:6] chessPieceType], @"Chess Moves Check Cells To The Top Right: There is a black pawn in the frount of the row being checked");
	
	[_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be a Empty at Row 4 Column 7
	XCTAssertEqual(4, locationOfDestinationRow, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Row 4");
	XCTAssertEqual(7, locationOfDestinationCol, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Column 7");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheTopRight_withVaildCoordsWithSameColourPawnInFrontOfRowOnVaildBoard_shouldRetunLocationOfEmptySpace()

-(void)testCheckCellsToTheTopRight_withVaildCoordsWithSameColourPawnInFrontOfRowOnVaildBoard_shouldRetunSameLocation {
	NSInteger locationOfDestinationRow = 3;
	NSInteger locationOfDestinationCol = 6;
	
	[_testChessBoard moveCellStateFromRow:1 andColumn:6 toRow:4 andColumn:7];
	
	// there should be a black Pawn at row 4 column 7
	XCTAssertEqual(1, [[_testChessBoard getCurrentStateAtRow:4 andColumn:7] chessPieceType], @"Chess Moves Check Cells To The Top Right: There is a black pawn in the frount of the row being checked");
	
	[_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:8];
	
	// should be one point and on that point it should be the same location as when it started
	XCTAssertEqual(3, locationOfDestinationRow, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Row 3");
	XCTAssertEqual(6, locationOfDestinationCol, @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Column 6");
	XCTAssertEqual(0, [[_testChessBoard getCurrentStateAtRow:locationOfDestinationRow andColumn:locationOfDestinationCol] chessPieceType], @"Chess Moves Check Cells To The Top Right: Location of Destionation On Cell Type is Empty Space");
}// end of testCheckCellsToTheTopRight_withVaildCoordsWithSameColourPawnInFrontOfRowOnVaildBoard_shouldRetunSameLocation()

-(void)testCheckCellsToTheTopRight_withVaildCoordsOnInVaildBoard_shouldErrorOut {
	NSInteger locationOfDestinationRow = 4;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:nil forCellType:@"Black" withAllowedNumberOfMoves:8], @"Chess Moves Check Cells To The Top Right: Error not a valid board");
}// end of testCheckCellsToTheTopRight_withInVaildCoordsOnVaildBoard_shouldErrorOut()

-(void)testCheckCellsToTheTopRight_withInVaildAllowedNumbersOnVaildBoard_shouldNotErrorOut {
	NSInteger locationOfDestinationRow = 20;
	NSInteger locationOfDestinationCol = 4;
	
	XCTAssertThrows([_testChessMoves getLocationOfDestinationToTheTopRightCellOnRow:&locationOfDestinationRow andColumn:&locationOfDestinationCol onBoard:_testChessBoard forCellType:@"Black" withAllowedNumberOfMoves:10], @"Chess Moves Check Cells To The Top Right: Error Outside Of Board");
}// end of testCheckCellsToTheTopRight_withInVaildCoordsOnVaildBoard_shouldNotErrorOut()

@end
