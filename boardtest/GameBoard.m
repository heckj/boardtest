//
//  Game.m
//  boardtest
//
//  Created by Joseph Heck on 8/20/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import "GameBoard.h"

@implementation GameBoard

@synthesize boardPositions;
@synthesize currentPlayer;

-(void)boardStart {
    NSMutableArray *gridcells = [[NSMutableArray alloc] initWithCapacity: (BOARD_HEIGHT*BOARD_WIDTH)];

    int startingGameBoard[BOARD_WIDTH*BOARD_HEIGHT] = {
        0,0,0,1,1,1,1,1,0,0,0,
        0,0,0,0,0,1,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,
        1,0,0,0,0,2,0,0,0,0,1,
        1,0,0,0,2,2,2,0,0,0,1,
        1,1,0,2,2,3,2,2,0,1,1,
        1,0,0,0,2,2,2,0,0,0,1,
        1,0,0,0,0,2,0,0,0,0,1,
        0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,1,0,0,0,0,0,
        0,0,0,1,1,1,1,1,0,0,0
    };

    for (int x=0; x<BOARD_WIDTH; x++) {
        for (int y=0; y<BOARD_HEIGHT; y++) {
            int position = x+y*BOARD_HEIGHT;
            [gridcells addObject:[NSNumber numberWithInt:startingGameBoard[position]]];
            //NSLog(@" %d, %d is %d", x,y,newBoard[position]);
        }
    }
    self.boardPositions = (NSArray *)gridcells;

}

-(NSNumber *)pieceAtX: (int) x Y: (int) y {
    int position = positionXY;
    NSNumber *piece = [boardPositions objectAtIndex:position];
    return piece;
}

-(GameMove *) getMoves {
    // returns list of GameMove objects
    return Nil;
}

-(BOOL) isValidMove: (GameMove *)move {
    return NO;
}

-(GameBoard *)makeMove: (GameMove *)move {
    //returns a new gameboard
    return Nil;
}

-(float)evaluate: (Player *)player {
    return 0.0;
}

-(BOOL)isGameOver {
    return NO;
}

@end
