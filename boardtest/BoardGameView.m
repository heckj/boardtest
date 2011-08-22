//
//  BoardGameView.m
//  boardtest
//
//  Created by Joseph Heck on 8/20/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import "BoardGameView.h"


@implementation BoardGameView

@synthesize board;
@synthesize gridcells;
@synthesize squaresize;

- (void)displayGameBoard:(GameBoard *)newBoard
{
    self.board = newBoard;
    UIImage *redPiece = [UIImage imageNamed:@"ball-red.png"];
    UIImage *whitePiece = [UIImage imageNamed:@"ball-white.png"];
    UIImage *blackPiece = [UIImage imageNamed:@"ball-black.png"];
    NSLog(@"Board has %d positions", [self.board.boardPositions count]);
    for (int ii=0; ii < [self.board.boardPositions count]; ii++) {
        NSNumber *piece = [self.board.boardPositions objectAtIndex:ii];
        NSLog(@"displaying position %d", ii);
        if ([piece intValue]>0) {
            CALayer *gamepiecelayer = [CALayer layer];            
            gamepiecelayer.bounds = CGRectMake(0, 0, self.squaresize, self.squaresize);
            gamepiecelayer.position = CGPointMake(self.squaresize/2.0, self.squaresize/2);
            if ([piece intValue] == 1) {
                    // attacker
                gamepiecelayer.contents = (id)[whitePiece CGImage];
            } else {
                if ([piece intValue] == 2) {
                    // defender
                    gamepiecelayer.contents = (id)[blackPiece CGImage];
                } else {
                    // king
                    gamepiecelayer.contents = (id)[redPiece CGImage];
                }
            }
            gamepiecelayer.masksToBounds = YES;
            UIImageView *gridcell = [gridcells objectAtIndex:ii];
            [gridcell.layer addSublayer:gamepiecelayer];
        }
    }
        // iterate through the board, putting in pieces
        // where appropriate...
}

- (void)initializeView
{
    // determine the size of the squares of the board
    // based on the bounds of this view...
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:(BOARD_HEIGHT*BOARD_WIDTH)];
    if (self.bounds.size.width > self.bounds.size.height) {
        self.squaresize = self.bounds.size.height/BOARD_HEIGHT;
    } else {
        self.squaresize = self.bounds.size.width/BOARD_HEIGHT;
    }
        //NSLog(@"SQUARESIZE IS: %f", squaresize);
        // add the subviews that make up the background of the board
    for (int y=0; y<BOARD_HEIGHT; y++) {
        for (int x=0; x<BOARD_WIDTH; x++) {
            int position = x+y*BOARD_HEIGHT;
            NSString *cell_image = [NSString stringWithString:@"wood_red_64.png"];
            if ((position % 2)==0) {
                cell_image = [NSString stringWithString:@"wood_light_64.png"];
            }            
            UIImageView *gridcell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:cell_image]];
            // keep a handy reference to those subviews in an array...
            [newArray insertObject:gridcell atIndex:position];
            [self addSubview:gridcell];
            gridcell.frame = CGRectMake(x*squaresize, y*squaresize, squaresize, squaresize);
        }
    }
    self.gridcells = newArray;
    [self setNeedsDisplay];
}

- (id) initWithCoder:(NSCoder *)aCoder
{
    // initializes from NIB
    if(self = [super initWithCoder:aCoder]){
        [self initializeView];
    }
   return self;
}
               
- (id)initWithFrame:(CGRect)frame
{
    // initializes programatically
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeView];
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
