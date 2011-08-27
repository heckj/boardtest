//
//  BoardPiece.h
//  boardtest
//
//  Created by Joseph Heck on 8/27/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardPiece : UIImageView

@property (nonatomic) int X;
@property (nonatomic) int Y;
    // type of piecetype to be the same as the type stored in
    // GameBoard.boardPostions
@property (strong, nonatomic) NSNumber *piecetype;
@property (nonatomic) BOOL captured;

@end
