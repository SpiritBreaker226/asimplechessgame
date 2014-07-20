//
//  ChessMoves.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-07-18.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ChessMoves.h"

#import "ChessBoard.h"
#import "ChessPiece.h"

@implementation ChessMoves

/*
 
 Public Methods
 
*/


-(void)getLocationOfDestinationToTheBottomCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexRow = (*originRow - 1); indexRow >= 0; indexRow--) {
		ChessPiece* cellsChessPiece = [chessBoard getCurrentStateAtRow:indexRow andColumn:*originColumn];
		
		if([self checkForFriendOrFoeOnRowOrColumn:indexRow withOriginRowOrColumn:originRow forCellType:cellType andCellsChessPiece:cellsChessPiece andAddToRow:YES] == YES)
			break;
		
		if([self checksMaxNumberOfRowsColumns:indexRow withOriginRowColumn:originRow andNumberOfMoves:numberOfMoves andNumberOfRowsOrColumns:NumOfRows] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheBottomCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexCol = (*originColumn - 1); indexCol >= 0; indexCol--) {
		ChessPiece* cellsChessPiece = [chessBoard getCurrentStateAtRow:*originRow andColumn:indexCol];
		
		if([self checkForFriendOrFoeOnRowOrColumn:indexCol withOriginRowOrColumn:originColumn forCellType:cellType andCellsChessPiece:cellsChessPiece andAddToRow:YES] == YES)
			break;
		
		if([self checksMaxNumberOfRowsColumns:indexCol withOriginRowColumn:originColumn andNumberOfMoves:numberOfMoves andNumberOfRowsOrColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheLeftCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexCol = (*originColumn + 1); indexCol < NumOfCols; indexCol++) {
		ChessPiece* cellsChessPiece = [chessBoard getCurrentStateAtRow:*originRow andColumn:indexCol];
		
		if([self checkForFriendOrFoeOnRowOrColumn:indexCol withOriginRowOrColumn:originColumn forCellType:cellType andCellsChessPiece:cellsChessPiece andAddToRow:NO] == YES)
			break;
		
		if([self checksMaxNumberOfRowsColumns:indexCol withOriginRowColumn:originColumn andNumberOfMoves:numberOfMoves andNumberOfRowsOrColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheRightCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheTopCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexRow = (*originRow + 1); indexRow < NumOfRows; indexRow++) {
		ChessPiece* cellsChessPiece = [chessBoard getCurrentStateAtRow:indexRow andColumn:*originColumn];
		
		if([self checkForFriendOrFoeOnRowOrColumn:indexRow withOriginRowOrColumn:originRow forCellType:cellType andCellsChessPiece:cellsChessPiece andAddToRow:NO] == YES)
			break;
		
		if([self checksMaxNumberOfRowsColumns:indexRow withOriginRowColumn:originRow andNumberOfMoves:numberOfMoves andNumberOfRowsOrColumns:NumOfRows] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheTopCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

/*
 
 Private Methods
 
*/

// checks if this cell is either friend or Foe
- (bool)checkForFriendOrFoeOnRowOrColumn:(NSInteger)indexRowColumn withOriginRowOrColumn:(NSInteger *)origin forCellType:(NSString *)cellType andCellsChessPiece:(ChessPiece *)cellsChessPiece andAddToRow:(bool)addToRow {
	// checks if this not an empty cell
	if ([cellsChessPiece chessPieceType] != 0) {
		// checks if the cell type is the same colour as the originCell or not
		if ([[cellsChessPiece getChessPieceColour] isEqualToString:cellType]) {
			// goes back one as this cell is the same colour as the originCell
			if (addToRow == YES)
				indexRowColumn++;
			else
				indexRowColumn--;
		}// end of if
		
		// updates originRow
		*origin = indexRowColumn;
		
		return YES;
	}// end of if
	else
		return NO;
}// end of checkForFriendOrFoeOnRowOrColumnWithOriginRowOrColumnForCellTypeAndCellsChessPiece()

// checks if there is this is a vaild board
- (void)checkForVaildChessBoard:(ChessBoard *)chessBoard {
	if (chessBoard == nil)
		[NSException raise:NSInvalidArgumentException format:@"Invaild chess board being pass"];
}// end of checkForVaildChessBoard()

// checks if the number of Moves is in the bonads of the chess board
- (void)checkForVaildNumberOfMoves:(NSInteger)numberOfMoves {
	if (numberOfMoves < 0 || numberOfMoves > NumOfCols || numberOfMoves > NumOfRows)
		[NSException raise:NSRangeException format:@"Number of Moves is out of bounds on the Board"];
}// end of checkForVaildNumberOfMoves()

// checks if this is last row if so then updates originRow as the chess piece cannot go any further or if the max number of moves have been used up
- (bool)checksMaxNumberOfRowsColumns:(NSInteger)indexRowColumn withOriginRowColumn:(NSInteger *)origin andNumberOfMoves:(NSInteger)numberOfMoves andNumberOfRowsOrColumns:(NSInteger)maxNumberOfRowsColumns{
	if (indexRowColumn == (maxNumberOfRowsColumns - 1) || indexRowColumn == 0 || (indexRowColumn - *origin) == numberOfMoves) {
		*origin = indexRowColumn;
		
		return YES;
	}// end of if
	else
		return NO;
}// end of checksMaxNumberOfRowsColumnsWithOriginRowOrColumnsAndNumberOfMoves()

@end
