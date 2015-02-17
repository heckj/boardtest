//
//  boardtestTests.m
//  boardtestTests
//
//  Created by Joseph Heck on 8/17/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import "boardtestTests.h"

@implementation boardtestTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
//    STFail(@"Unit tests are not implemented yet in boardtestTests");
    XCTAssertTrue(TRUE, @"just sayin...");
}

- (void)testInitialGameBoardPieces
{
    GameBoard *gb = [[GameBoard alloc] init];

    XCTAssertFalse([gb isGameOver], @"default game isn't over");
    [gb boardStart];
    XCTAssertEqual(EMPTY, [[gb pieceAtX:0 Y:0] intValue], @"piece is empty");
    XCTAssertEqual(ATTACKER, [[gb pieceAtX:4 Y:0] intValue], @"piece is attacker");
    XCTAssertEqual(DEFENDER, [[gb pieceAtX:4 Y:4] intValue], @"piece is defender");
    XCTAssertEqual(KING, [[gb pieceAtX:5 Y:5] intValue], @"piece is king");
    XCTAssertEqual(ATTACKING_PLAYER, gb.currentPlayer, @"initial player is attacker");
}

- (void)testInvalidMoveEmpty {
    GameBoard *gb = [[GameBoard alloc] init];
    [gb boardStart];
    
    GameMove *testMove = [[GameMove alloc] init];
    testMove.fromX = 0;
    testMove.fromY = 0;
    testMove.toX = 1;
    testMove.toY = 0;
    
    XCTAssertFalse([gb isValidMove:testMove], @"moving an empty piece is an invalid move");
    GameBoard *newBoard = [gb executeMove:testMove];
    XCTAssertNil(newBoard, @"executing an invalid move results in Nil");
}

- (void)testValidMoveAttacker {
    GameBoard *gb = [[GameBoard alloc] init];
    [gb boardStart];
    
    GameMove *testMove = [[GameMove alloc] init];
    testMove.fromX = 3;
    testMove.fromY = 0;
    testMove.toX = 1;
    testMove.toY = 0;
    
    XCTAssertTrue([gb isValidMove:testMove], @"moving attacker to empty square - valid");
    GameBoard *newBoard = [gb executeMove:testMove];
    XCTAssertNotNil(newBoard, @"Valid move should result in a new board");
    XCTAssertEqual(DEFENDING_PLAYER, newBoard.currentPlayer, @"player on new board should defender");
    NSNumber *oldPlacePiece = [newBoard pieceAtX:3 Y:0];
    NSNumber *newPlacePiece = [newBoard pieceAtX:1 Y:0];
    XCTAssertEqual(EMPTY, [oldPlacePiece intValue], @"old position should now be empty");
    XCTAssertEqual(ATTACKER, [newPlacePiece intValue], @"new position should now be an attacker");

}
@end
