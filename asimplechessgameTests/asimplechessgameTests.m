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
	[_currentGameState setInitialGameState];
}// end of setUp()

- (void)tearDown {
    [super tearDown];
	
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	_currentGameState = nil;
}// end of tearDown()

@end
