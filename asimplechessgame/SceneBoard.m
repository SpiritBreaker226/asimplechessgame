//
//  SceneBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "SceneBoard.h"

@implementation SceneBoard

- (void)addChessBoard:(CGSize)size {
	int startCurrentRowWithEvenOrOddNumber = 1;
	
	// goes around adding the chess board with 4 black and 4 white for each row
	for (int indexRowPads = 0, indexRowPadsPostion = 1; indexRowPads < 8; indexRowPads++, indexRowPadsPostion = indexRowPadsPostion + 2) {
		// checks if the current row is an eveb number
		if ((indexRowPads % 2))
			// starts the current row with an even number in order for the row to start with a black pad
			startCurrentRowWithEvenOrOddNumber = 2;
		else
			// starts the current row with an odd number in order for the row to start with a white pad
			startCurrentRowWithEvenOrOddNumber = 1;
		
		// goes around adding the pads for each column
		for (int indexColPads = 0, indexColPadsPostion = 1, indexWhichColourToUse = startCurrentRowWithEvenOrOddNumber; indexColPads < 8; indexColPads++, indexWhichColourToUse++, indexColPadsPostion = indexColPadsPostion + 2) {
			// creates a pad that is either black or whiite colour
			SKSpriteNode* padThatWillBeDisplayPartChessBoard;
			
			// checks if this is an even Number as they will have a black pad on it
			if ((indexWhichColourToUse % 2))
				padThatWillBeDisplayPartChessBoard = [SKSpriteNode spriteNodeWithImageNamed:@"BlackPad"];
			else
				padThatWillBeDisplayPartChessBoard = [SKSpriteNode spriteNodeWithImageNamed:@"WhitePad"];
			
			// sets the properties for this pad
			// because the ios will adds images at the centre of the them postion needs to be times by an odd number in order to move it beside the last pad in
			// order not to be over lapped
			[padThatWillBeDisplayPartChessBoard setPosition:CGPointMake((padThatWillBeDisplayPartChessBoard.size.width/2) * indexColPadsPostion,(size.height-(padThatWillBeDisplayPartChessBoard.size.height/2) * indexRowPadsPostion))];
			
			[self addChild:padThatWillBeDisplayPartChessBoard];
		}// end of column for loop
	}// end of row for loop
}// end of addChessBoard()

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [UIColor colorWithRed:155/255.0f green:187/255.0f blue:14/255.0f alpha:1.0f];
		
		[self addChessBoard:size];
    }// end of if
	
    return self;
}// end of initWithSize()

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}// end of touchesBegan()

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}// end of update()

@end
