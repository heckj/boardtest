    //
    //  BoardGameView.h
    //  boardtest
    //
    //  Created by Joseph Heck on 8/20/11.
    //  Copyright (c) 2011 Deallus Software. All rights reserved.
    //

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GameBoard.h"
#import "GameMove.h"
#import "constants.h"
#import "BoardPiece.h"

@interface BoardGameView : UIView

@property (strong, nonatomic) GameBoard *board;
@property (strong, nonatomic) NSArray *gridcells;
@property (strong, nonatomic) NSMutableArray *boardpieces;
@property (nonatomic) float squaresize;

    // used for tracking dragging on a board piece
@property (nonatomic) CGPoint startMovePosition;
@property (strong, nonatomic) BoardPiece *pieceBeingMoved; 
    // used for selection of a piece
@property (strong, nonatomic) BoardPiece *pieceSelected;

- (CGPoint) centerForGamePositionX: (int) x Y: (int) y;
- (BoardPiece *) pieceAtBoardLocationX: (int) x Y: (int) y;
- (BoardPiece *) pieceAtCGPoint: (CGPoint) point;

- (void)movePiece:(BoardPiece *)piece withMove:(GameMove *)move;
- (void)initializeView;
- (void)initializePieces:(GameBoard *)board;

- (void)logViewStrucure;


@end
