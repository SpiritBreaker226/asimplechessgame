//
//  ChessPiecesTest.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-09.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ChessPiece.h"

@interface ChessPiecesTest : XCTestCase
	@property ChessPiece* testChessPiece;
@end

@implementation ChessPiecesTest

- (void)setUp {
    [super setUp];
	
	_testChessPiece = [ChessPiece node];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}// end of tearDown()

- (void)testCellLocation_withValidCoords_shouldBeATThoseCoords {
	[_testChessPiece updateCellRow:4 andCellColumn:3];
	
	cellLocationOnBoard testingCellLocation;
	cellLocationOnBoard testObjectCellLocation = [_testChessPiece getLocationOnChessBoard];
	
	// set dump data
	testingCellLocation.cellRow = 4;
	testingCellLocation.cellCol = 3;

	// checks if the testdata and the object data are the same
	if (testingCellLocation.cellRow == testObjectCellLocation.cellRow && testingCellLocation.cellCol == testObjectCellLocation.cellCol)
		XCTAssert(@"Find Location of Test Chess Piece");
	else
		XCTFail(@"Unable To Find Location of Test Chess Piece");
}// end of testCellLocation_withValidCoords_shouldBeATThoseCoords()

@end
