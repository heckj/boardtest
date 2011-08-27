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
#import "constants.h"
#import "BoardPiece.h"

@interface BoardGameView : UIView

@property (strong, nonatomic) GameBoard *board;
@property (strong, nonatomic) NSArray *gridcells;
@property (strong, nonatomic) NSMutableArray *boardpieces;
@property (nonatomic) float squaresize;

- (CGPoint) centerForGamePositionX: (int) x Y: (int) y;
- (BoardPiece *) pieceAtX: (int) x Y: (int) y;
- (void)initializeView;
- (void)initializePieces:(GameBoard *)board;

- (void)logViewStrucure;

- (void)tempMovePiece;

@end
