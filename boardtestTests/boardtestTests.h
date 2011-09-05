//
//  boardtestTests.h
//  boardtestTests
//
//  Created by Joseph Heck on 8/17/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GameBoard.h"
#import "GameMove.h"
#import "Player.h"

@interface boardtestTests : SenTestCase

- (void)testInitialGameBoardPieces;
- (void)testInvalidMoveEmpty;
- (void)testValidMoveAttacker;

@end
