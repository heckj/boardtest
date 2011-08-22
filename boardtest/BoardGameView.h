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

@interface BoardGameView : UIView

@property (strong, nonatomic) GameBoard *board;
@property (strong, nonatomic) NSArray *gridcells;
@property (nonatomic) float squaresize;

- (void)initializeView;
- (void)displayGameBoard:(GameBoard *)board;

@end
