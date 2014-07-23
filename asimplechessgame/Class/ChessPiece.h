//
//  ChessPiece.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-09.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "SuperClass/ChessBoardParts.h"

const static NSInteger numberOfChessPieceTypes = 13;

@interface ChessPiece : ChessBoardParts

@property (assign, nonatomic) NSUInteger chessPieceType;

/*
 
 init
 
*/

// sets the row, column and chessPieceType
-(instancetype)initWithRow:(NSInteger)row Column:(NSInteger)column andChessPieceType:(NSUInteger)type;


/*
 
 Properties
 
*/

/* 
 
leagend for this property

 0 = for Pawn as there is a state the Pawn can be in which the user's oppenant can side remove it on the next turn if they do a 2 jump move
 1 = Has Moved at Least Once
 2 = Has Not Moved at all

*/

@property (nonatomic) NSInteger hasThisChessPieceMovedOnce;

/*
 
 Public Methods
 
*/

// gets the name of the colour this peice is a part of
-(NSString*)getChessPieceColour;

@end