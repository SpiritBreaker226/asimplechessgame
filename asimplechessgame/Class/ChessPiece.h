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
 
 Public Methods
 
 gets the name of the colour this peice is a part of
*/

-(NSString*)getChessPieceColour;

@end