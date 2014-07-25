//
//  ChessMoves.h
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-18.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChessBoard;

@interface ChessMoves : NSObject

/*
 
 Public Methods
 
*/

// finds the location of destination going to the Bottom of the chess piece
-(void)getLocationOfDestinationToTheBottomCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// finds the location of destination going to the Left of the chess piece
-(void)getLocationOfDestinationToTheLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// finds the location of destination going to the right of the chess piece
-(void)getLocationOfDestinationToTheRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// find the location of destination going up rows
-(void)getLocationOfDestinationToTheTopCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

@end