//
//  Game.m
//  boardtest
//
//  Created by Joseph Heck on 8/20/11.
//  Copyright (c) 2011 Nebula, Inc. All rights reserved.
//

#import "GameBoard.h"

@implementation GameBoard

@synthesize boardPositions;
@synthesize currentPlayer;

-(void)boardStart {
    
    int newBoard[121] = {
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

    int nRows = 11;
    int nColumns = 11;
    unsigned n = nRows*nColumns;
    NSMutableArray *gridcells = [[NSMutableArray alloc] initWithCapacity: n];
    id null = [NSNull null];
    
    for (int x=0; x<11; x++) {
        for (int y=0; y<11; y++) {
            int position = x*nRows+y;
            [gridcells addObject:[NSNumber numberWithInt:newBoard[position]]];
                //NSLog(@" %d, %d is %d", x,y,newBoard[position]);
        }
    }
    while( n-- > 0 )
        [gridcells addObject: null];
    self.boardPositions = (NSArray *)gridcells;
    

}

-(NSNumber *)pieceAtX: (int) x Y: (int) y {
    int position = x*11+y;
    NSNumber *piece = [boardPositions objectAtIndex:position];
    return piece;
}

-(GameMove *) getMoves {
    // returns list of GameMove objects
    return Nil;
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
