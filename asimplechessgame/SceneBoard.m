//
//  SceneBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "SceneBoard.h"

static const CGFloat cellBoardWidth =  40.0;
static const CGFloat cellBoardHeight = 40.0;

@interface SceneBoard()
	@property (nonatomic) SKNode* gameLayer;
	@property (nonatomic) SKNode* boardCellLayer;
	@property (nonatomic) SKNode* boardPeicesLayer;
	@property (assign, nonatomic) NSInteger originSwipeFromRow;
	@property (assign, nonatomic) NSInteger originSwipeFromCol;
@end

// sets the categories for either contact or collion

/*static const uint32_t categoryChessCell		= 0x1;
static const uint32_t categoryWhitePieces	= 0x1 << 1;
static const uint32_t categoryBlackPieces	= 0x1 << 2;
static const uint32_t categoryPawn			= 0x1 << 3;
static const uint32_t categoryRook			= 0x1 << 4;
static const uint32_t categoryKnight		= 0x1 << 5;
static const uint32_t categoryBishop		= 0x1 << 6;
static const uint32_t categoryKing			= 0x1 << 7;
static const uint32_t categoryQueen			= 0x1 << 8;*/

@implementation SceneBoard

/*
 
 Public Methods
 
*/

-(void)addChessCellsToBoard:(NSMutableArray *)itemmsBeingAdded {
	// goes around adding the chess pieces to boardCellsLayer
	for (ChessCell* cellBeingAdd in itemmsBeingAdded) {
		SKSpriteNode* chessCellSpriteBeingAdded = [SKSpriteNode spriteNodeWithImageNamed:[cellBeingAdd getSpriteImageName]];
		
		// sets the proeprtes of the sprite
		[chessCellSpriteBeingAdded setPosition:[self pointForRow:cellBeingAdd.cellRow andColumn:cellBeingAdd.cellCol]];
		
		[self.boardCellLayer addChild:chessCellSpriteBeingAdded];
		
		// adds the SKpriteNode back to the chess piece
		[cellBeingAdd setSpriteForThisPiece:chessCellSpriteBeingAdded];
	}// end of for in loop
}// end of addChessPiecesToBoard()

-(void)addChessPiecesToBoard:(NSMutableArray *)itemmsBeingAdded {
	// goes around adding the chess pieces to boardPiecesLayer
	for (ChessPiece* pieceBeingAdd in itemmsBeingAdded) {
		SKSpriteNode* chessPeiceSpriteBeingAdded = [SKSpriteNode spriteNodeWithImageNamed:[pieceBeingAdd getSpriteImageName]];
		
		// sets the proeprtes of the sprite
		[chessPeiceSpriteBeingAdded setPosition:[self pointForRow:pieceBeingAdd.cellRow andColumn:pieceBeingAdd.cellCol]];

		[self.boardPeicesLayer addChild:chessPeiceSpriteBeingAdded];
		
		// adds the SKpriteNode back to the chess piece
		[pieceBeingAdd setSpriteForThisPiece:chessPeiceSpriteBeingAdded];
	}// end of for in loop
}// end of addChessPiecesToBoard()

/*
 
 Private Methods
 
*/

// converts Tounches into positon of the cell in the sence space
-(BOOL)convertPoint:(CGPoint)point toRow:(NSInteger*)row andColumn:(NSInteger*)column {
	NSParameterAssert(row);
	NSParameterAssert(column);
	
	// checks if this in a valid location inside the chess piece board layer
	if(point.y >= 0 && point.y < (NumOfRows * cellBoardHeight) && point.x >= 0 && point.x < (NumOfCols * cellBoardWidth)){
		// calculate the corresponding row and column
		*row = point.y / cellBoardHeight;
		*column = point.x / cellBoardWidth;
		
		return YES;
	}// end of if
	else {
		// sets the touches properties to not found as it is a invalid location
		*row = NSNotFound;
		*column = NSNotFound;
		
		return NO;
	}// end of else
}// end of covertPointToRowAndColumn()

// returns poistion of the cell in the sence space
- (CGPoint)pointForRow:(NSInteger)row andColumn:(NSInteger)column {
	return CGPointMake((column * cellBoardWidth) + (cellBoardWidth / 2), (row * cellBoardHeight) + (cellBoardHeight / 2));
}// end of pointForRowAndColumn()

/*
 
 Events
 
*/

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
		// sets the properties of the scene
        self.backgroundColor = [UIColor colorWithRed:155/255.0f green:187/255.0f blue:14/255.0f alpha:1.0f];
		
		// creates and adds the game layer which will be the bases for all of the other layers
		// on to the scene
		self.gameLayer = [SKNode node];
		self.gameLayer.position = CGPointMake(size.width/2, size.height-(cellBoardHeight * (NumOfRows / 2)));
		[self addChild:[self gameLayer]];

		// creates the layer for where all of the cells will be on and adds it to game layer
		self.boardCellLayer = [SKNode node];
		self.boardCellLayer.position = CGPointMake(-cellBoardHeight * (NumOfRows / 2), -cellBoardWidth * (NumOfCols / 2));
		[self.gameLayer addChild:self.boardCellLayer];
		
		// creates the layer for where all of the chess peices will beon and adds the to the cell layer since they will be on top of the cells
		self.boardPeicesLayer = [SKNode node];
		self.boardPeicesLayer.zPosition = 1.0;
		[self.boardCellLayer addChild:self.boardPeicesLayer];

		// sets the physic contact to look for the two events from Delegate SKPhysicsContactDelegate in this Game Scene
		self.physicsWorld.contactDelegate = self;
		
		// sets the touches properties to not found
		[self setOriginSwipeFromRow:NSNotFound];
		[self setOriginSwipeFromCol:NSNotFound];
    }// end of if
	
    return self;
}// end of initWithSize()

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSInteger locationOfTounchOnBoradCellRow;
	NSInteger locationOfTounchOnBoradCellColumn;
	
	// checks if the tounch is on the board
	if ([self convertPoint:[[touches anyObject] locationInNode:[self boardPeicesLayer]] toRow:&locationOfTounchOnBoradCellRow andColumn:&locationOfTounchOnBoradCellColumn]) {
		ChessPiece* chessPieceAtTounchLocation = [self.gameState getCurrentStateAtRow:locationOfTounchOnBoradCellRow andColumn:locationOfTounchOnBoradCellColumn];
		
		// checks if the touch is a valid location
		if (chessPieceAtTounchLocation != 0) {
			// sets the touches properties to the location of the touch on the board
			[self setOriginSwipeFromRow:locationOfTounchOnBoradCellRow];
			[self setOriginSwipeFromCol:locationOfTounchOnBoradCellColumn];
		}// end of if
	}// end of if
}// end of touchesBegan()

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}// end of update()

@end
