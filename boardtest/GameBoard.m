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
    /* 
     * Initializes a gameboard to the starting position for the game 
     */
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
    if ([[self pieceAtX:move.toX Y:move.toY] intValue] != 0) {
            //another piece is at that location - not a valid move
        return NO;
    }
    if ((move.toX != move.fromX) && (move.toY != move.fromY)) {
            //attempted to move other than just vertical or horizontal
        return NO;
    }
        // check to make sure the path between the locations 
        // is unobstructed (i.e. can't jump other pieces
    if (move.toX == move.fromX) {
            // moving along Y axis - check along that line
        if (move.fromY > move.toY) { // from=6, to=3
                // moving DOWN y axis
            for (int ypos=move.toY; ypos < move.fromY; ypos++) {
                int position = move.fromX+ypos*11;
                if ([[self.boardPositions objectAtIndex:position] intValue] != 0) {
                    return NO;
                }
            }
            return YES;
        } else {
                // moving UP y axis from=3, to=6
            for (int ypos=move.toY; ypos > move.fromY; ypos--) {
                int position = move.fromX+ypos*11;
                if ([[self.boardPositions objectAtIndex:position] intValue] != 0) {
                    return NO;
                }
            }
            return YES;
        }
    } else {
            // moving along X axis
        if (move.fromX > move.toX) { // from=6, to=3
                                     // moving DOWN x axis
            for (int xpos=move.toX; xpos < move.fromX; xpos++) {
                int position = xpos+move.fromY*11;
                if ([[self.boardPositions objectAtIndex:position] intValue] != 0) {
                    return NO;
                }
            }
            return YES;
        } else {
                // moving UP X axis from=3, to=6
            for (int xpos=move.toX; xpos > move.fromX; xpos--) {
                int position = xpos+move.fromY*11;
                if ([[self.boardPositions objectAtIndex:position] intValue] != 0) {
                    return NO;
                }
            }
            return YES;
        }
    }
    return NO;
}

-(GameBoard *)makeMove: (GameMove *)move {
    if ([self isValidMove:move]) {
            // create a new board
        GameBoard *newBoard = [[GameBoard alloc] init];
            // initialize with existing piece structure
        NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.boardPositions];
        int oldposition = move.fromX+move.fromY*BOARD_HEIGHT;
        int newposition = move.toX+move.toY*BOARD_HEIGHT;
        NSNumber *pieceGettingMoved = [newArray objectAtIndex:oldposition];
        [newArray replaceObjectAtIndex:oldposition withObject:[NSNumber numberWithInt:0]];
        [newArray replaceObjectAtIndex:newposition withObject:pieceGettingMoved];
        newBoard.boardPositions = newArray;
            // TODO: deal with any captures...
            // TODO: change player to other player
        return newBoard;
    }
        // move isn't valid - return nil
    return Nil;
}

-(float)evaluate: (Player *)player {
    return 0.0;
}

-(BOOL)isGameOver {
    return NO;
}

@end
