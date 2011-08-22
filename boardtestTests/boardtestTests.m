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
    STAssertTrue(TRUE, @"just sayin...");
}

- (void)testGameBoardPieces
{
    GameBoard *gb = [[GameBoard alloc] init];

    STAssertFalse([gb isGameOver], @"default game isn't over");
    [gb boardStart];
    STAssertEquals(0, [[gb pieceAtX:0 Y:0] intValue], @"piece is empty");
    STAssertEquals(1, [[gb pieceAtX:4 Y:0] intValue], @"piece is attacker");
    STAssertEquals(2, [[gb pieceAtX:4 Y:4] intValue], @"piece is defender");
    STAssertEquals(3, [[gb pieceAtX:5 Y:5] intValue], @"piece is king");
    
}
@end
