//
//  SceneBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "SceneBoard.h"
#import "ChessPiece.h"

@interface SceneBoard()
@end

@implementation SceneBoard

// sets the categories for either contact or collion
	
static const uint32_t categoryChessPad		= 0x1;
static const uint32_t categoryWhitePieces	= 0x1 << 1;
static const uint32_t categoryBlackPieces	= 0x1 << 2;
static const uint32_t categoryPawn			= 0x1 << 3;
static const uint32_t categoryRook			= 0x1 << 4;
static const uint32_t categoryKnight		= 0x1 << 5;
static const uint32_t categoryBishop		= 0x1 << 6;
static const uint32_t categoryKing			= 0x1 << 7;
static const uint32_t categoryQueen			= 0x1 << 8;

/*
 
 Private Methods
 
*/

- (void)addChessBoardToDisplayForSize:(CGSize)size {
	int startCurrentRowWithEvenOrOddNumber = 1;
	NSArray* rowOfChessPiecesOrder = [[NSArray alloc] initWithObjects:@"Rook", @"Knight", @"Bishop", @"King", @"Queen", @"Bishop", @"Knight", @"Rook", @"Pawn", nil];
	
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
			SKSpriteNode* padThatWillBeDisplayPartChessBoard = [SKSpriteNode spriteNodeWithImageNamed:@"WhitePad"];
			
			// checks if this is an even Number as they will have a black pad on it
			if ((indexWhichColourToUse % 2))
				padThatWillBeDisplayPartChessBoard = [SKSpriteNode spriteNodeWithImageNamed:@"BlackPad"];
			
			// sets the properties for this pad
			
			// sets the category for this node
			[[padThatWillBeDisplayPartChessBoard physicsBody] setCategoryBitMask:categoryChessPad];
			
			// sets the postion
			// because the ios will adds images at the centre of the them postion needs to be times by an odd number in order to move it beside the last pad in
			// order not to be over lapped
			[padThatWillBeDisplayPartChessBoard setPosition:CGPointMake((padThatWillBeDisplayPartChessBoard.size.width/2) * indexColPadsPostion,(size.height-(padThatWillBeDisplayPartChessBoard.size.height/2) * indexRowPadsPostion))];
			
			[self addChild:padThatWillBeDisplayPartChessBoard];
			
			// checks if this is row 0-1 or 6-7 as those rows will have chess Pieces on them when the game starts
			if(indexRowPads < 2 || indexRowPads > 5) {
				int indexCurrentChessPiecesToBeDisplay = indexColPads;
				NSString* colourOfPiece = @"Black";
				
				// checks if the is 1 or 6 as those rows are where the pawns will go
				if(indexRowPads == 1 || indexRowPads == 6)
					indexCurrentChessPiecesToBeDisplay = 8;
				
				// checks if this is the White side of the borad
				if (indexRowPads > 5)
					colourOfPiece = @"White";
				
				[self addChild:[self addChessPiecesToBoard:CGPointMake((padThatWillBeDisplayPartChessBoard.size.width/2) * indexColPadsPostion,(size.height-(padThatWillBeDisplayPartChessBoard.size.height/2) * indexRowPadsPostion)) currentRow:indexRowPads currentCol:indexColPads colourOfPiece:colourOfPiece andNameOfPiece:rowOfChessPiecesOrder[indexCurrentChessPiecesToBeDisplay]]];
			}// end of if
		}// end of column for loop
	}// end of row for loop
}// end of addChessBoardToDisplayForSize()

- (ChessPiece*)addChessPiecesToBoard:(CGPoint)currentLocationOfChessPieceOnBoard currentRow:(NSInteger)rowOfPiece currentCol:(NSInteger)colOfPiece colourOfPiece:(NSString*)colourOfPiece andNameOfPiece:(NSString*)chessPieceName {
	// creates a chess Pieces
	SKSpriteNode* chessPiece = [SKSpriteNode spriteNodeWithImageNamed:[colourOfPiece stringByAppendingString:chessPieceName]];
	ChessPiece* chessPieceNode = [ChessPiece node];
	uint32_t categoryOfChessPiece = categoryPawn;
	
	// checks which type of chess Pieces it is in order to tell which on it is later on when the game begins
	if ([chessPieceName isEqual: @"Rook"])
		categoryOfChessPiece = categoryRook;
	else if ([chessPieceName isEqual: @"Knight"])
		categoryOfChessPiece = categoryKnight;
	else if ([chessPieceName isEqual: @"Bishop"])
		categoryOfChessPiece = categoryBishop;
	else if ([chessPieceName isEqual: @"King"])
		categoryOfChessPiece = categoryKing;
	else if ([chessPieceName isEqual: @"Queen"])
		categoryOfChessPiece = categoryQueen;
	
	// checks if this is the White side of the borad
	if ([colourOfPiece isEqualToString:@"White"]) {
		// sets the categories for this node as well as what categories will this node interactwith
		[[chessPieceNode physicsBody] setCategoryBitMask:categoryWhitePieces | categoryOfChessPiece];
		[[chessPieceNode physicsBody] setContactTestBitMask:categoryBlackPieces];
	}// end of if
	else {
		// sets the categories for this node as well as what categories will this node interactwith
		[[chessPieceNode physicsBody] setCategoryBitMask:categoryBlackPieces | categoryOfChessPiece];
		[[chessPieceNode physicsBody] setContactTestBitMask:categoryWhitePieces];
	}// end of else
	
	// sets the properties for this chess piece
	[chessPieceNode setName:chessPieceName];
	[chessPieceNode setPosition:currentLocationOfChessPieceOnBoard];
	[chessPieceNode updateCellRow:rowOfPiece andCellColumn:colOfPiece];
	
	// sets the physic body of this pieces in order to interactive with other game elements
	chessPieceNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:chessPiece.frame.size];
	[[chessPieceNode physicsBody] setDynamic:NO];
	
	// adds the chess pieces to be a child of the chessPieceNode in order to have it
	[chessPieceNode addChild:chessPiece];
	
	return chessPieceNode;
}// end of addChessPiecesToBoard()

/*
 
 Events
 
*/

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [UIColor colorWithRed:155/255.0f green:187/255.0f blue:14/255.0f alpha:1.0f];
		
		// sets the physic contact to look for the two events from Delegate SKPhysicsContactDelegate in this Game Scene
		self.physicsWorld.contactDelegate = self;
		
		[self addChessBoardToDisplayForSize:size];
    }// end of if
	
    return self;
}// end of initWithSize()

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}// end of touchesBegan()

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}// end of update()

@end
