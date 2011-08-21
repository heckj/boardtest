//
//  BoardGameView.m
//  boardtest
//
//  Created by Joseph Heck on 8/20/11.
//  Copyright (c) 2011 Nebula, Inc. All rights reserved.
//

#import "BoardGameView.h"


@implementation BoardGameView

@synthesize board;

- (void)displayGameBoard:(GameBoard *)newBoard
{
    self.board = newBoard;
    
    float squaresize = 0.0;
    if (self.bounds.size.width > self.bounds.size.height) {
        squaresize = self.bounds.size.height/BOARD_HEIGHT;
    } else {
        squaresize = self.bounds.size.width/BOARD_HEIGHT;
    }
    NSLog(@"SQUARESIZE IS: %f", squaresize);
    
    for (int x=0; x<BOARD_WIDTH; x++) {
        for (int y=0; y<BOARD_HEIGHT; y++) {
            int position = x+y*BOARD_HEIGHT;
            NSString *cell_image = [NSString stringWithString:@"wood_red_64.png"];
            if ((position % 2)==0) {
                cell_image = [NSString stringWithString:@"wood_light_64.png"];
            }            
            UIImageView *gridcell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:cell_image]];
            [self addSubview:gridcell];
            gridcell.frame = CGRectMake(x*squaresize, y*squaresize, squaresize, squaresize);
                //NSLog(@" %d, %d is %d", x,y,newBoard[position]);
        }
    }
    [self setNeedsDisplay];
//    CALayer *aSquare = [CALayer layer];
//    aSquare.bounds = CGRectMake(0, 0, squaresize, squaresize);
//    UIImage *foo = [UIImage imageNamed:@"wood_red_64.png"]; //wood_light_64.png
//    aSquare.contents = (id)[foo CGImage];
//    aSquare.masksToBounds = YES;
//    aSquare.position = CGPointMake(44, 23);
//    [boardGameView.layer addSublayer:aSquare];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
