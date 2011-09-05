    //
    //  Game.h
    //  boardtest
    //
    //  Created by Joseph Heck on 8/20/11.
    //  Copyright (c) 2011 Deallus Software. All rights reserved.
    //

#import <Foundation/Foundation.h>
#import "GameMove.h"
#import "Player.h"
#import "constants.h"

#define ATTACKING_PLAYER    1
#define DEFENDING_PLAYER    0

#define EMPTY       0
#define ATTACKER    1
#define DEFENDER    2
#define KING        3

@interface GameBoard : NSObject

    // 11x11 hnefatafl board
/*
 .... 0   1   2   3   4   5   6   7   8   9   10
 ..
 .. +---+---+---+---+---+---+---+---+---+---+---+
 0  | X |   |   | A | A | A | A | A |   |   | X |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 1  |   |   |   |   |   | A |   |   |   |   |   |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 2  |   |   |   |   |   |   |   |   |   |   |   |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 3  | A |   |   |   |   | D |   |   |   |   | A |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 4  | A |   |   |   | D | D | D |   |   |   | A |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 5  | A | A |   | D | D | K | D | D |   | A | A |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 6  | A |   |   |   | D | D | D |   |   |   | A |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 7  | A |   |   |   |   | D |   |   |   |   | A |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 8  |   |   |   |   |   |   |   |   |   |   |   |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 9  |   |   |   |   |   | A |   |   |   |   |   |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 10 | X |   |   | A | A | A | A | A |   |   | X |
 .. +---+---+---+---+---+---+---+---+---+---+---+
 
 */
@property (strong, nonatomic) NSArray *boardPositions;
@property (nonatomic) NSInteger currentPlayer;

-(void)boardStart;

-(NSNumber *)pieceAtX: (int) x Y: (int) y;
-(GameMove *) getMoves; // returns list of GameMove objects
-(BOOL) isValidMove: (GameMove *)move;
-(GameBoard *)executeMove: (GameMove *)move; //returns a new gameboard
-(float)evaluate: (NSInteger) player;
-(NSArray *) validMovesForPlayerAtX: (int) x Y: (int) y;

-(BOOL)isGameOver;


@end
