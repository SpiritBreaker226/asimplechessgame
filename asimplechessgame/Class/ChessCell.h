//
//  ChessCell.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-17.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "SuperClass/ChessBoardParts.h"

const static NSInteger numberOfChessCellTypes = 2;

@interface ChessCell : ChessBoardParts

@property (assign, nonatomic) NSUInteger chessCellType;

/*
 
 init
 
 */

// sets the row, column and chessCellType
-(instancetype)initWithRow:(NSInteger)row Column:(NSInteger)column andChessCellType:(NSUInteger)type;

@end
