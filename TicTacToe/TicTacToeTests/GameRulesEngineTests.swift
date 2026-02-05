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
        let isGameOver = engine.evaluateGameState(
            isBoardFull: boardIsFull,
            currentPlayer: .x,
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        // Then
        #expect(isGameOver == .draw, "Failed at evaluating game progress for boardValue \(boardIsFull)")
    }
    
    @Test("Test game is ongoing when board is not full")
    func gameIsOngoing_whenBoardIsNotFull() {
        let boardIsFull = false
        let isGameOver = engine.evaluateGameState(
            isBoardFull: boardIsFull,
            currentPlayer: .x,
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        #expect(isGameOver == .ongoing, "Failed at evaluating boardisNOtFull for boardValue \(boardIsFull)")
    }
    
    @Test("Test game is over when board is full")
    func gameIsOver_forAnyFullBoard() {
        let inputs = [true, true, true]
        for isFull in inputs {
            #expect(engine.evaluateGameState(
                isBoardFull: isFull,
                currentPlayer: .x,
                topLeft: .empty,
                topMiddle: .empty,
                topRight: .empty,
                middleLeft: .empty,
                middleMiddle: .empty,
                middleRight: .empty,
                bottomLeft: .empty,
                bottomMiddle: .empty,
                bottomRight: .empty
            ) == .draw)
        }
    }
    
    @Test("Test game is not over when board has empty cells")
    func gameIsNotOver_whenBoardHasEmptyCells() {
        let boardIsFull = false
        let isGameOver = engine.evaluateGameState(
            isBoardFull: boardIsFull,
            currentPlayer: .x,
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        #expect(isGameOver == .ongoing, "Failed at evaluating boardisNOtFull for emptycells \(boardIsFull)")
    }
    
    @Test("Test game is over when top row if filled")
    func gameIsOver_whenTopRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            topLeft: .x,
            topMiddle: .x,
            topRight: .x,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        #expect(result == .win)
    }
    
    @Test("Test game is over when top row if filled")
    func topRowWinGame_whenTopRowIsFillerWithArgs() {
        let cases: [(CellState, CellState, CellState, GameResult)] = [
            (.x, .x, .x, .win),
            (.x, .x, .empty, .ongoing),
            (.x, .empty, .x, .ongoing),
            (.empty, .x, .x, .ongoing),
            (.empty, .empty, .empty, .ongoing)
        ]
        
        for (left, middle, right, expected) in cases {
            let result = engine.evaluateGameState(
                isBoardFull: false,
                currentPlayer: .x,
                topLeft: left,
                topMiddle: middle,
                topRight: right,
                middleLeft: .empty,
                middleMiddle: .empty,
                middleRight: .empty,
                bottomLeft: .empty,
                bottomMiddle: .empty,
                bottomRight: .empty
            )
            #expect(result == expected)
        }
    }
    
    @Test("Test game is draw when top row is filled andnowin")
    func gameIsDraw_whenBoardIsFull_andNoWin() {
        let result = engine.evaluateGameState(
            isBoardFull: true,
            currentPlayer: .x,
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        
        #expect(result == .draw)
    }
    
    @Test("Test game is ongoing when top row is not filled andnowin")
    func gameIsOngoing_whenBoardIsNotFull_andNoWin() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        
        #expect(result == .ongoing)
    }
    
    @Test("Test game is win when top row is filled")
    func gameIsWin_whenTopRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            topLeft: .x,
            topMiddle: .x,
            topRight: .x,
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        
        #expect(result == .win)
    }
    
    @Test("Test game is win when second row is filled")
    func gameIsWin_whenMiddleRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,
            
            // second row
            middleLeft: .x,
            middleMiddle: .x,
            middleRight: .x,
            
            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        
        #expect(result == .win)
    }
    
    @Test("Test game is win when middle row is not filled")
    func gameIsOngoing_whenMiddleRowIsNotComplete() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,

            // second row
            middleLeft: .x,
            middleMiddle: .empty,
            middleRight: .x,

            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )

        #expect(result == .ongoing)
    }
    
    @Test("Test game is win when bottom row is filled")
    func gameIsWin_whenThirdRowIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .empty,

            // middle row
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .empty,

            // bottom row
            bottomLeft: .x,
            bottomMiddle: .x,
            bottomRight: .x
        )

        #expect(result == .win)
    }
    
    @Test("Test game is win when first col is filled")
    func gameIsWin_whenFirstColumnIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .x,
            topMiddle: .empty,
            topRight: .empty,

            // middle row
            middleLeft: .x,
            middleMiddle: .empty,
            middleRight: .empty,

            // bottom row
            bottomLeft: .x,
            bottomMiddle: .empty,
            bottomRight: .empty
        )

        #expect(result == .win)
    }

    @Test("Test game is win when mid col is filled")
    func gameIsWin_whenMidColumnIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .empty,
            topMiddle: .x,
            topRight: .empty,

            // middle row
            middleLeft: .empty,
            middleMiddle: .x,
            middleRight: .empty,

            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .x,
            bottomRight: .empty
        )

        #expect(result == .win)
    }

    
    @Test("Test game is win when last col is filled")
    func gameIsWin_whenLastColumnIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .x,

            // middle row
            middleLeft: .empty,
            middleMiddle: .empty,
            middleRight: .x,

            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .x
        )

        #expect(result == .win)
    }
    
    @Test("Test game is win when last col is filled")
    func gameIsWin_whenAnyColumnIsFilled() {
        let testCases: [(String,
                         CellState, CellState, CellState,
                         CellState, CellState, CellState,
                         CellState, CellState, CellState)] = [

            // second column
            (
                "second column",
                .empty, .x, .empty,   // top
                .empty, .x, .empty,   // middle
                .empty, .x, .empty    // bottom
            ),

            // third column
            (
                "third column",
                .empty, .empty, .x,   // top
                .empty, .empty, .x,   // middle
                .empty, .empty, .x    // bottom
            )
        ]

        for (_, tl, tm, tr, ml, mm, mr, bl, bm, br) in testCases {
            let result = engine.evaluateGameState(
                isBoardFull: false,
                currentPlayer: .x,

                // top row
                topLeft: tl,
                topMiddle: tm,
                topRight: tr,

                // middle row
                middleLeft: ml,
                middleMiddle: mm,
                middleRight: mr,

                // bottom row
                bottomLeft: bl,
                bottomMiddle: bm,
                bottomRight: br
            )

            #expect(result == .win)
        }
    }
    
    @Test("Test game is win when primary diagonal is filled")
    func gameIsWin_whenPrimaryDiagonalIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .x,
            topMiddle: .empty,
            topRight: .empty,

            // middle row
            middleLeft: .empty,
            middleMiddle: .x,
            middleRight: .empty,

            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .x
        )

        #expect(result == .win)
    }

    @Test("Test game is win when secondary diagonal is filled")
    func gameIsWin_whenSecondaryDiagonalIsFilled() {
        let result = engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,

            // top row
            topLeft: .empty,
            topMiddle: .empty,
            topRight: .x,

            // middle row
            middleLeft: .empty,
            middleMiddle: .x,
            middleRight: .empty,

            // bottom row
            bottomLeft: .x,
            bottomMiddle: .empty,
            bottomRight: .empty
        )

        #expect(result == .win)
    }
}

