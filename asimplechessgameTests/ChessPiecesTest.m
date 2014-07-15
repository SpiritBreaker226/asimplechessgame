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
	
	_testChessPiece = [[ChessPiece alloc] init];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
    // Put teardown code here. This method is called after the invocation of each test method in the class.
	_testChessPiece = nil;
}// end of tearDown()

@end
