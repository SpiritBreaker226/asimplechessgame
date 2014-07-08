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
	NSArray* rowOfChessPeicesOrder = [[NSArray alloc] initWithObjects:@"%@Rook", @"%@Knight", @"%@Bishop", @"%@King", @"%@Queen", @"%@Bishop", @"%@Knight", @"%@Rook", @"%@Pawn", nil];
	
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
			
			// checks if this is row 0-1 or 6-7 as those rows will have chess peices on them when the game starts
			if(indexRowPads < 2 || indexRowPads > 5) {
				int indexCurrentChessPeiceToBeDisplay = indexColPads;
				
				// checks if the is 1 or 6 as those rows are where the pawns will go
				if(indexRowPads == 1 || indexRowPads == 6)
					indexCurrentChessPeiceToBeDisplay = 8;
				
				[self addChessPeicesToBoard:indexRowPads indexRowPadsPostion:indexRowPadsPostion padThatWillBeDisplayPartChessBoard:padThatWillBeDisplayPartChessBoard size:size indexColPadsPostion:indexColPadsPostion nameOfPeice:rowOfChessPeicesOrder[indexCurrentChessPeiceToBeDisplay]];
			}// end of if
		}// end of column for loop
	}// end of row for loop
}// end of addChessBoard()

- (void)addChessPeicesToBoard:(int)indexRowPads indexRowPadsPostion:(int)indexRowPadsPostion padThatWillBeDisplayPartChessBoard:(SKSpriteNode *)padThatWillBeDisplayPartChessBoard size:(CGSize)size indexColPadsPostion:(int)indexColPadsPostion nameOfPeice:(NSString*)chessPeiceName {
	// creates a chess peice
	NSString* chessPeiceColour = @"Black";
	
	// checks if this is the White side of the borad
	if (indexRowPads > 5)
		chessPeiceColour = @"White";
	
	SKSpriteNode* chessPeice = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:chessPeiceName, chessPeiceColour]];
	
	[chessPeice setPosition:CGPointMake((padThatWillBeDisplayPartChessBoard.size.width/2) * indexColPadsPostion,(size.height-(padThatWillBeDisplayPartChessBoard.size.height/2) * indexRowPadsPostion))];
	
	[self addChild:chessPeice];
}// end of addChessPeicesToBoard()

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
