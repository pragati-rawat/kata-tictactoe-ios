//
//  BoardValidationTests.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 05/02/2026.
//

import Testing
@testable import TicTacToe

@Suite("BoardValidation Tests")
struct BoardValidationTests {
    
    @Test("Test board validation when both players has winning pattern")
    func boardThrowsError_whenBothPlayersHaveWinningPattern() {
        let board = Board(
            topLeft: .x, topMiddle: .x, topRight: .x,   // X wins row
            middleLeft: .o, middleMiddle: .o, middleRight: .o, // O wins row
            bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
        )

        #expect(throws: BoardValidationError.bothPlayersWon) {
            try board.validate()
        }
    }
    
    @Test("Test board validation when movecountdifference is greater than 1")
    func boardThrowsError_whenMoveCountDifferenceGreaterThanOne() {
        let board = Board(
            topLeft: .x, topMiddle: .x, topRight: .x,
            middleLeft: .x, middleMiddle: .empty, middleRight: .empty,
            bottomLeft: .o, bottomMiddle: .empty, bottomRight: .empty
        )

        #expect(throws: BoardValidationError.invalidMoveCount) {
            try board.validate()
        }
    }
    
    @Test("Test board validation when O moves more than X")
    func boardThrowsError_whenOMovesMoreThanX() {
        let board = Board(
            topLeft: .o, topMiddle: .o, topRight: .empty,
            middleLeft: .x, middleMiddle: .empty, middleRight: .empty,
            bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
        )

        #expect(throws: BoardValidationError.oPlayedBeforeX) {
            try board.validate()
        }
    }

}
