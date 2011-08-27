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
@synthesize boardpieces;

@synthesize blah;

@synthesize startMovePosition;
@synthesize pieceBeingMoved;
@synthesize movingAPiece;

/*
 * what piece is at location (x,y)
 * hit test to find piece from touch
 * 
 * UI: player moves piece
 *  - makes "move" object
 *  - is valid move? (gameboard+move)
 *  - IF YES:
 *    - finish animation of move
 *    - make move (update gameboard)
 *    - get effect of move (other piece captured)?
 *    - display effects
 *    - update game, next player's turn
 */

/*
 *   app -> gameboard
 * BoardViewController -> BoardGameView -> UIImageView Array (gridcells) for board
 *                              |      \-> UIImageView Array (boardpieces) for pieces
 *                              +--> touches logic
 */


- (void)tempMovePiece {
    int x = 4; 
    int y = 0;
    if (self.blah == 0) {
        //verify piece
//        NSNumber *piece = [self.board pieceAtX:x Y:y];
//        NSLog(@"Piece at %d x %d is %@", x, y, piece);
        
        self.blah = 1;
        BoardPiece *pieceToMove = [self pieceAtBoardLocationX:x Y:y];
//        NSLog(@"Piece at %d x %d is %@", x, y, pieceToMove);
        if (pieceToMove != nil) {
            pieceToMove.X = 4;
            pieceToMove.Y = 2;
            [UIView animateWithDuration:1.0 animations:^{
                pieceToMove.center = [self centerForGamePositionX:4 Y:2];
            }];            
        }
    } else {
        x = 4;
        y = 2;
        self.blah = 0;
        BoardPiece *pieceToMove = [self pieceAtBoardLocationX:x Y:y];
//        NSLog(@"Piece at %d x %d is %@", x, y, pieceToMove);
        if (pieceToMove != nil) {
            pieceToMove.X = 4;
            pieceToMove.Y = 0;
            [UIView animateWithDuration:1.0 animations:^{
                pieceToMove.center = [self centerForGamePositionX:4 Y:0];
            }];            
        }
    }
}

- (BoardPiece *) pieceAtBoardLocationX: (int) x Y: (int) y {
        // yes - this sucks - it's the full tablescan of all the pieces...
    for (BoardPiece *piece in self.boardpieces) {
            //NSLog(@"Piece %@ [%d,%d] is %@", piece, piece.X, piece.Y, piece.piecetype);
        if (piece.X == x) {
            if (piece.Y == y) {
                return piece;
            }
        }
    }
    return nil;
}

- (BoardPiece *) pieceAtCGPoint: (CGPoint) point {
    //converts view based CGPoint into an X, Y location and returns the piece
    //at that location.
    int x = floor(point.x / squaresize);
    int y = floor(point.y / squaresize);
    return [self pieceAtBoardLocationX:x Y:y];
}

- (CGPoint) centerForGamePositionX: (int) x Y: (int) y {
    return CGPointMake(x*squaresize+(squaresize/2), y*squaresize+(squaresize/2));
}

- (void)logViewStrucure {
    NSLog(@"SUBVIEWS...");
    for (int ii=0; ii < [self.subviews count]; ii++){
        UIView *aView = [self.subviews objectAtIndex:ii];
        NSLog(@"view[%d]:  %@", ii, aView);
    }
//    for (UIView *aView in self.subviews) {
//        
//    }
}

#pragma mark - 
#pragma mark Initialization

- (id) initWithCoder:(NSCoder *)aCoder
{
    // initializes from NIB
    if(self = [super initWithCoder:aCoder]){
        [self initializeView];
        self.boardpieces = [[NSMutableArray alloc] initWithCapacity:36];
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
            int position = positionXY;
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
    
    self.blah = 0;
    
    self.movingAPiece = NO;
}

- (void)initializePieces:(GameBoard *)newBoard
{
    self.board = newBoard;
    UIImage *redPieceImage = [UIImage imageNamed:@"ball-red.png"];
    UIImage *whitePieceImage = [UIImage imageNamed:@"ball-white.png"];
    UIImage *blackPieceImage = [UIImage imageNamed:@"ball-black.png"];
    for (int y=0; y<BOARD_HEIGHT; y++) {
        for (int x=0; x<BOARD_WIDTH; x++) {
            int position = positionXY;
            
            NSNumber *piecetype = [self.board.boardPositions objectAtIndex:position];
            if ([piecetype intValue]>0) {
                BoardPiece *newpiece = [[BoardPiece alloc] initWithImage:whitePieceImage];
                if ([piecetype intValue] == 2) {
                        // defender
                    newpiece.image = blackPieceImage;
                } 
                if ([piecetype intValue] == 3) {
                        // king
                    newpiece.image = redPieceImage;
                }
                newpiece.bounds = CGRectMake(0, 0, squaresize, squaresize);
                newpiece.piecetype = piecetype;
                newpiece.X = x;
                newpiece.Y = y;                
                [self addSubview:newpiece];
                [self bringSubviewToFront:newpiece];
                [self.boardpieces addObject:newpiece];
                newpiece.center = [self centerForGamePositionX:x Y:y];
            }
        }
    }
}

#pragma mark Custom Drawing

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark Touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touchesBegan");
//    NSLog(@"Touches had %d touch objects in the set", [touches count]);
    UITouch *touch = touches.anyObject;
//    NSLog(@"Touch %@", touch);
//    NSLog(@"Tap count: %d", touch.tapCount);

    
    self.startMovePosition = [touch locationInView:self];
//    NSLog(@"Start move position is [%f,%f]", self.startMovePosition.x, self.startMovePosition.y);
    
    BoardPiece *maybe = [self pieceAtCGPoint:self.startMovePosition];
//    NSLog(@"TOUCH: Working on piece: %@", maybe);
    self.pieceBeingMoved = maybe;
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touchesMoved");
//    NSLog(@"Touches had %d touch objects in the set", [touches count]);
//    NSLog(@"Touch %@", touch);
//    NSLog(@"Tap count: %d", touch.tapCount);
    if (self.pieceBeingMoved != nil) {
        UITouch *touch = touches.anyObject;
        CGPoint currentPosition = [touch locationInView:self];
//        [UIView animateWithDuration:0.5 animations:^{
        self.pieceBeingMoved.center = currentPosition;
//        }];
//        NSLog(@"TOUCH: Now at [%f,%f]", currentPosition.x, currentPosition.y);
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
//    NSLog(@"Touches had %d touch objects in the set", [touches count]);
//    NSLog(@"Touch %@", touch);
    CGPoint currentPosition = [touch locationInView:self];
//    NSLog(@"TOUCH END at [%f,%f]", currentPosition.x, currentPosition.y);
//    NSLog(@"TOUCH: Tap count: %d", touch.tapCount);
    if (self.pieceBeingMoved != nil) {
        int boardX = floor(currentPosition.x / squaresize);
        int boardY = floor(currentPosition.y / squaresize);
            // piece still has original X, Y coordinates - use this combination
            // to create a move object and see if it's valid by the gameboard
        if ([self pieceAtCGPoint:currentPosition] == nil) {
                // checking to make sure nothing is there now
            [UIView animateWithDuration:0.5 animations:^{
                self.pieceBeingMoved.center = [self centerForGamePositionX:boardX Y:boardY];
            }];
            self.pieceBeingMoved.X = boardX;
            self.pieceBeingMoved.Y = boardY;
        } else {
                //invalid move - revert...
            [UIView animateWithDuration:0.5 animations:^{
                self.pieceBeingMoved.center = [self centerForGamePositionX:pieceBeingMoved.X Y:pieceBeingMoved.Y];
            }];
        }
    }
//    NSLog(@"--------------------------------");
    self.pieceBeingMoved = nil;
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
        // touches cancelled
        // clean up - animate back to starting position
}
@end
