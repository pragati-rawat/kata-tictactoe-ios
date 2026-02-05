//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Pragati RAWAT on 05/02/2026.
//

import Testing
@testable import TicTacToe

@Suite("GameRulesEngine Tests")
struct GameRulesEngineTests {

    let engine = GameRulesEngine()
    
    @Test("Test game is ongoing by default")
    func gameIsOngoing_whenBoardIsFull() {
        // Given
        let boardIsFull = true
        // When
        let isGameOver = engine.evaluateGameState(isBoardFull: boardIsFull)
        // Then
        #expect(isGameOver == .draw, "Failed at evaluating game progress for boardValue \(boardIsFull)")
    }
    
    @Test("Test game is ongoing when board is not full")
    func gameIsOngoing_whenBoardIsNotFull() {
        let boardIsFull = false
        let isGameOver = engine.evaluateGameState(isBoardFull: boardIsFull)
        #expect(isGameOver == .ongoing, "Failed at evaluating boardisNOtFull for boardValue \(boardIsFull)")
    }

    @Test("Test game is over when board is full")
    func gameIsOver_forAnyFullBoard() {
        let inputs = [true, true, true]
        for isFull in inputs {
            #expect(engine.evaluateGameState(isBoardFull: isFull) == .draw)
        }
    }
    
    @Test("Test game is not over when board has empty cells")
    func gameIsNotOver_whenBoardHasEmptyCells() {
        let boardIsFull = false
        let isGameOver = engine.evaluateGameState(isBoardFull: boardIsFull)
        #expect(isGameOver == .ongoing, "Failed at evaluating boardisNOtFull for emptycells \(boardIsFull)")
    }
    
    @Test("Test game is over when top row if filled")
    func gameIsOver_whenTopRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            topLeftFilledByCurrentPlayer: true,
            topMiddleFilledByCurrentPlayer: true,
            topRightFilledByCurrentPlayer: true
        )
        #expect(result == .draw)
    }
    
    @Test("Test game is over when top row if filled")
    func topRowWinGame_whenTopRowIsFillerWithArgs() {
        let cases: [(Bool, Bool, Bool, GameResult)] = [
            (true, true, true, .draw),
            (true, true, false, .ongoing),
            (true, false, true, .ongoing),
            (false, true, true, .ongoing),
            (false, false, false, .ongoing)
        ]
        
        for (left, middle, right, expected) in cases {
            let result = engine.evaluateGameState(
                isBoardFull: false,
                topLeftFilledByCurrentPlayer: left,
                topMiddleFilledByCurrentPlayer: middle,
                topRightFilledByCurrentPlayer: right
            )
            #expect(result == expected)
        }
    }
    
    @Test("Test game is draw when top row is filled andnowin")
    func gameIsDraw_whenBoardIsFull_andNoWin() {
        let result = engine.evaluateGameState(
            isBoardFull: true,
            topLeftFilledByCurrentPlayer: false,
            topMiddleFilledByCurrentPlayer: false,
            topRightFilledByCurrentPlayer: false
        )

        #expect(result == .draw)
    }
    
    @Test("Test game is ongoing when top row is not filled andnowin")
    func gameIsOngoing_whenBoardIsNotFull_andNoWin() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            topLeftFilledByCurrentPlayer: false,
            topMiddleFilledByCurrentPlayer: false,
            topRightFilledByCurrentPlayer: false
        )

        #expect(result == .ongoing)
    }
    
    @Test("Test game is win when top row is filled")
    func gameIsWin_whenTopRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            topLeftFilledByCurrentPlayer: true,
            topMiddleFilledByCurrentPlayer: true,
            topRightFilledByCurrentPlayer: true
        )

        #expect(result == .win)
    }
    
    @Test("Test game is win when second row is filled")
    func gameIsWin_whenSecondRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            topLeftFilledByCurrentPlayer: true,
            topMiddleFilledByCurrentPlayer: true,
            topRightFilledByCurrentPlayer: true
        )

        #expect(result == .win)
    }
}
