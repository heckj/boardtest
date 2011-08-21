//
//  BoardGameView.h
//  boardtest
//
//  Created by Joseph Heck on 8/20/11.
//  Copyright (c) 2011 Nebula, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GameBoard.h"
#import "constants.h"

@interface BoardGameView : UIView

@property (strong, nonatomic) GameBoard *board;

- (void)displayGameBoard:(GameBoard *)board;

@end
