//
//  constants.h
//  boardtest
//
//  Created by Joseph Heck on 8/21/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#ifndef boardtest_constants_h
#define boardtest_constants_h




// values
#define CFG_PIECEVAL_PAWN    2.5
#define CFG_PIECEVAL_ROOK    6.0
#define CFG_PIECEVAL_KNIGHT  4.0
#define CFG_PIECEVAL_BISHOP  5.0
#define CFG_PIECEVAL_QUEEN   10.0
#define CFG_PIECEVAL_KING    10000.0
#define CFG_PIECEVAL_NONE    0.0
#define CFG_GAMEVAL_WIN      10000.0
#define CFG_GAMEVAL_LOSE     -10000.0

enum Type
{
    None = 0,
    Pawn = 1,
    Rook = 2,
    Knight = 3,
    Bishop = 4,
    Queen = 5,
    King = 6
};

#define BOARD_WIDTH          11
#define BOARD_HEIGHT         11

/*
 void Zobrist::key(const BoardSlot &slot,
 Location location,
 uint64_t &key)
 {
 int type_ndx = 0;
 if(slot.owner()==Player::Player2)
 type_ndx = slot.piece() + 6;
 else
 type_ndx = slot.piece();
 
 key ^= randnums[location.x()][location.y()][type_ndx];
 }
*/

/*
 const int BOARD_SIZE = 8 * 8;   // size of chess board
 const int NUM_PIECES = 6;       // rook, knight, bishop, king, queen, pawn
 const int NUM_COLORS = 2;       // white, black
 
 enum eChessPiece { B_ROOK, B_KNIGHT, B_BISHOP, B_KING, B_QUEEN, B_PAWN,
 W_ROOK, W_KNIGHT, W_BISHOP, W_KING, W_QUEEN, W_PAWN,
 EMPTY };
 enum eColor { BLACK, WHITE };
 
 class ChessBoard
 {
 uint64_t m_aZobristTable[BOARD_SIZE][NUM_PIECES][NUM_COLORS];
 eChessPiece m_aBoard[BOARD_SIZE];
 
 void InitializeZobristTable();
 void PopulateChessBoard();
 
 public:
 ChessBoard();
 uint64_t CalculateZobristKey(eColor sideToMove) const;
 uint64_t UpdateZobristKey(uint64_t oldKey, eChessPiece piece, int oldPos, int newPos) const;
 void MovePiece(int oldPos, int newPos);
 };
 */


#endif
