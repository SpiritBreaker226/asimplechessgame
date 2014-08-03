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

// check if the cell is empty for the bottom if so then return the location of destination
-(BOOL)checkIfBottomCellIsEmptyOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// check if the cell is empty for the top if so then return the location of destination
-(BOOL)checkIfTopCellIsEmptyOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// check if the cell is empty and an emeny for the top left if not then return the location of destination
-(void)checkIfTopLeftCellIsNotEmptyOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType;

// check if the cell is empty and an emeny for the top right if not then return the location of destination
-(void)checkIfTopRightCellIsNotEmptyOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType;

// finds the location of destination going to the bottom of the chess piece
-(void)getLocationOfDestinationToTheBottomCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// find the location of destination going bottom and to the right
-(void)getLocationOfDestinationToTheBottomRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// find the location of destination going bottom and to the left
-(void)getLocationOfDestinationToTheBottomLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// finds the location of destination going to the left of the chess piece
-(void)getLocationOfDestinationToTheLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// finds the location of destination going to the right of the chess piece
-(void)getLocationOfDestinationToTheRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// find the location of destination going up rows
-(void)getLocationOfDestinationToTheTopCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// find the location of destination going up and to the left
-(void)getLocationOfDestinationToTheTopLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

// find the location of destination going up and to the right
-(void)getLocationOfDestinationToTheTopRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard*)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves;

@end
