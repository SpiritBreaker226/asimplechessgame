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
		
		if([self checksMaxNumberOfRowsColumns:indexRow withOriginRowColumn:originRow andThereIsDIffForMaxNumberOfMoves:((*originRow - indexRow) == numberOfMoves)  andNumberOfRowsOrColumns:NumOfRows] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheBottomCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheBottomLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexRow = (*originRow - 1), indexColumn = (*originColumn - 1); indexRow < NumOfRows && indexRow >= 0 && indexColumn >= 0; indexRow--, indexColumn--) {
		if([self checkForFriendOrFoeOnRow:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn forCellType:cellType andCellsChessPiece:[chessBoard getCurrentStateAtRow:indexRow andColumn:indexColumn] andGoingBackToWhichCell:6] == YES)
			break;
		
		if([self checksMaxNumberOfRows:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn andThereIsDIffForMaxNumberOfMoves:((*originRow - indexRow) == numberOfMoves) andNumberOfRows:NumOfRows numberOfColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheBottomLeftCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheBottomRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexRow = (*originRow - 1), indexColumn = (*originColumn + 1); indexRow < NumOfRows && indexRow >= 0; indexRow--, indexColumn++) {
		if([self checkForFriendOrFoeOnRow:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn forCellType:cellType andCellsChessPiece:[chessBoard getCurrentStateAtRow:indexRow andColumn:indexColumn] andGoingBackToWhichCell:4] == YES)
			break;
		
		if([self checksMaxNumberOfRows:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn andThereIsDIffForMaxNumberOfMoves:((*originRow - indexRow) == numberOfMoves) andNumberOfRows:NumOfRows numberOfColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheBottomRightCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexCol = (*originColumn - 1); indexCol >= 0; indexCol--) {
		ChessPiece* cellsChessPiece = [chessBoard getCurrentStateAtRow:*originRow andColumn:indexCol];
		
		if([self checkForFriendOrFoeOnRowOrColumn:indexCol withOriginRowOrColumn:originColumn forCellType:cellType andCellsChessPiece:cellsChessPiece andAddToRow:YES] == YES)
			break;
		
		if([self checksMaxNumberOfRowsColumns:indexCol withOriginRowColumn:originColumn  andThereIsDIffForMaxNumberOfMoves:((*originColumn - indexCol) == numberOfMoves)  andNumberOfRowsOrColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheLeftCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexCol = (*originColumn + 1); indexCol < NumOfCols && indexCol >= 0; indexCol++) {
		ChessPiece* cellsChessPiece = [chessBoard getCurrentStateAtRow:*originRow andColumn:indexCol];
		
		if([self checkForFriendOrFoeOnRowOrColumn:indexCol withOriginRowOrColumn:originColumn forCellType:cellType andCellsChessPiece:cellsChessPiece andAddToRow:NO] == YES)
			break;
		
		if([self checksMaxNumberOfRowsColumns:indexCol withOriginRowColumn:originColumn andThereIsDIffForMaxNumberOfMoves:((indexCol - *originColumn) == numberOfMoves)  andNumberOfRowsOrColumns:NumOfCols] == YES)
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
		
		if([self checksMaxNumberOfRowsColumns:indexRow withOriginRowColumn:originRow andThereIsDIffForMaxNumberOfMoves:((indexRow - *originRow) == numberOfMoves) andNumberOfRowsOrColumns:NumOfRows] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheTopCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheTopLeftCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexRow = (*originRow + 1), indexColumn = (*originColumn - 1); indexRow < NumOfRows && indexColumn >= 0; indexRow++, indexColumn--) {
		if([self checkForFriendOrFoeOnRow:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn forCellType:cellType andCellsChessPiece:[chessBoard getCurrentStateAtRow:indexRow andColumn:indexColumn] andGoingBackToWhichCell:0] == YES)
			break;
		
		if([self checksMaxNumberOfRows:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn andThereIsDIffForMaxNumberOfMoves:((indexRow - *originRow) == numberOfMoves) andNumberOfRows:NumOfRows numberOfColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheTopLeftCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

-(void)getLocationOfDestinationToTheTopRightCellOnRow:(NSInteger*)originRow andColumn:(NSInteger*)originColumn onBoard:(ChessBoard *)chessBoard forCellType:(NSString*)cellType withAllowedNumberOfMoves:(NSInteger)numberOfMoves {
	// checks if the arugments are valid
	[self checkForVaildChessBoard:chessBoard];
	[self checkForVaildNumberOfMoves:numberOfMoves];
	
	// goes around for each row chcking if there is a chess peice on it and if so can this cell type remove it
	for (NSInteger indexRow = (*originRow + 1), indexColumn = (*originColumn + 1); indexRow < NumOfRows; indexRow++, indexColumn++) {
		if([self checkForFriendOrFoeOnRow:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn forCellType:cellType andCellsChessPiece:[chessBoard getCurrentStateAtRow:indexRow andColumn:indexColumn] andGoingBackToWhichCell:2] == YES)
			break;
		
		if([self checksMaxNumberOfRows:indexRow andColumn:indexColumn withOriginRow:originRow andColumn:originColumn andThereIsDIffForMaxNumberOfMoves:((indexRow - *originRow) == numberOfMoves) andNumberOfRows:NumOfRows numberOfColumns:NumOfCols] == YES)
			break;
	}// end of for loop
}// end of getLocationOfDestinationToTheTopRightCellOnRowAndColumnOnBoardForCellTypeWithAllowedNumberOfMoves()

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
}// end of checkForFriendOrFoeOnRowOrColumnWithOriginRowOrColumnForCellTypeAndCellsChessPieceAndAddToRow()

// checks if this cell is either friend or Foe
- (bool)checkForFriendOrFoeOnRow:(NSInteger)indexRow andColumn:(NSInteger)indexColumn withOriginRow:(NSInteger *)originRow andColumn:(NSInteger*)originColumn forCellType:(NSString *)cellType andCellsChessPiece:(ChessPiece *)cellsChessPiece andGoingBackToWhichCell:(NSInteger)whichDiangleMovementToGoBackTo {
	// checks if this not an empty cell
	if ([cellsChessPiece chessPieceType] != 0) {
		// checks if the cell type is the same colour as the originCell or not
		if ([[cellsChessPiece getChessPieceColour] isEqualToString:cellType]) {
			// because diagonal movement uses two numbers in order to go back both the indexRow and index column will need to change and some times in different directions so go back: 0 = top left, 2, top right, 4 = bottom right and 6 = bottom left
			switch (whichDiangleMovementToGoBackTo) {
				// top left
				case 0:
					indexRow--;
					indexColumn++;
				break;
				// top right
				case 2:
					indexRow--;
					indexColumn--;
				break;
				// bottom right
				case 4:
					indexRow++;
					indexColumn--;
				break;
				// bottom left
				case 6:
					indexRow++;
					indexColumn++;
				break;
			}// end of switch
		}// end of if
		
		// both updates originRow and originColumn
		*originRow = indexRow;
		*originColumn = indexColumn;
		
		return YES;
	}// end of if
	else
		return NO;
}// end of checkForFriendOrFoeOnRowAndColumnWithOriginRowAndColumnForCellTypeAndCellsChessPieceAndGoingBackToWhichCell()

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
- (bool)checksMaxNumberOfRowsColumns:(NSInteger)indexRowColumn withOriginRowColumn:(NSInteger *)origin andThereIsDIffForMaxNumberOfMoves:(BOOL)isThereDiffForNumberOfMoves andNumberOfRowsOrColumns:(NSInteger)maxNumberOfRowsColumns {
	if (indexRowColumn == (maxNumberOfRowsColumns - 1) || indexRowColumn == 0 || isThereDiffForNumberOfMoves == YES) {
		*origin = indexRowColumn;
		
		return YES;
	}// end of if
	else
		return NO;
}// end of checksMaxNumberOfRowsColumnsWithOriginRowOrColumnsAndThereIsDIffForMaxNumberOfMovesAndNumberOfRowsOrColumns()

// checks if this is last row if so then updates originRow and originColumn as the chess piece cannot go any further or if the max number of moves have been used up
- (bool)checksMaxNumberOfRows:(NSInteger)indexRow andColumn:(NSInteger)indexColumn withOriginRow:(NSInteger *)originRow andColumn:(NSInteger *)originColumn andThereIsDIffForMaxNumberOfMoves:(BOOL)isThereDiffForNumberOfMoves andNumberOfRows:(NSInteger)maxNumberOfRows numberOfColumns:(NSInteger)maxNumberOfColumns {
	if (indexRow == (maxNumberOfRows - 1) || indexRow == 0 || indexColumn == (maxNumberOfColumns - 1) || indexColumn == 0 || isThereDiffForNumberOfMoves == YES) {
		*originRow = indexRow;
		*originColumn = indexColumn;
		
		return YES;
	}// end of if
	else
		return NO;
}// end of checksMaxNumberOfRowsAndColumnsWithOriginRowAndColumnsAndThereIsDIffForMaxNumberOfMovesAndNumberOfRowsNumberofColumns()

@end
