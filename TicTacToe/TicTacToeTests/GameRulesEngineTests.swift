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
    
    @Test("Test draw when board is full and no winner")
    func gameIsOngoing_whenBoardIsFull() {
        // A realistic full board with no winner (draw)
        let result = try! engine.evaluateGameState(
            isBoardFull: true,
            currentPlayer: .x,
            topLeft: .x, topMiddle: .o, topRight: .x,
            middleLeft: .x, middleMiddle: .o, middleRight: .o,
            bottomLeft: .o, bottomMiddle: .x, bottomRight: .x
        )
        #expect(result == .draw)
    }
    
    @Test("Test game is ongoing when board is not full")
    func gameIsOngoing_whenBoardIsNotFull() {
        let boardIsFull = false
        let isGameOver = try! engine.evaluateGameState(
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
        // Several realistic full boards with no winner
        let fullDrawBoards: [(
            CellState, CellState, CellState,
            CellState, CellState, CellState,
            CellState, CellState, CellState
        )] = [
            (
                .x, .o, .x,
                .x, .o, .o,
                .o, .x, .x
            ),
            (
                .o, .x, .o,
                .x, .o, .x,
                .x, .o, .x
            )
        ]
        
        for (tl, tm, tr, ml, mm, mr, bl, bm, br) in fullDrawBoards {
            let result = try! engine.evaluateGameState(
                isBoardFull: true,
                currentPlayer: .x,
                topLeft: tl, topMiddle: tm, topRight: tr,
                middleLeft: ml, middleMiddle: mm, middleRight: mr,
                bottomLeft: bl, bottomMiddle: bm, bottomRight: br
            )
            #expect(result == .draw)
        }
    }
    
    @Test("Test game is not over when board has empty cells")
    func gameIsNotOver_whenBoardHasEmptyCells() {
        let boardIsFull = false
        let isGameOver = try! engine.evaluateGameState(
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
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .o,
            topLeft: .o,
            topMiddle: .o,
            topRight: .o,
            middleLeft: .x,
            middleMiddle: .empty,
            middleRight: .x,
            bottomLeft: .x,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        #expect(result == .win)
    }
    
    @Test("Test game is over when top row if filled")
    func topRowWinGame_whenTopRowIsFilledWithArgs() throws {
        let cases: [([CellState], CellState, GameResult)] = [
            
            (
                [
                    .x, .x, .x,
                    .o, .o, .empty,
                    .empty, .empty, .empty
                ],
                .x,
                .win
            ),
            
            //  No win
            (
                [
                    .x, .x, .o,
                    .o, .x, .empty,
                    .empty, .empty, .empty
                ],
                .x,
                .ongoing
            ),
            
            //  Empty board
            (
                [
                    .empty, .empty, .empty,
                    .empty, .empty, .empty,
                    .empty, .empty, .empty
                ],
                .x,
                .ongoing
            )
        ]
        
        for (cells, currentPlayer, expected) in cases {
            let result = try engine.evaluateGameState(
                isBoardFull: false,
                currentPlayer: currentPlayer,
                
                topLeft: cells[0],
                topMiddle: cells[1],
                topRight: cells[2],
                
                middleLeft: cells[3],
                middleMiddle: cells[4],
                middleRight: cells[5],
                
                bottomLeft: cells[6],
                bottomMiddle: cells[7],
                bottomRight: cells[8]
            )
            
            #expect(result == expected)
        }
    }
    
    @Test("Test game is draw when top row is filled andnowin")
    func gameIsDraw_whenBoardIsFull_andNoWin() {
        let result = try! engine.evaluateGameState(
            isBoardFull: true,
            currentPlayer: .x,
            topLeft: .x, topMiddle: .o, topRight: .x,
            middleLeft: .x, middleMiddle: .o, middleRight: .o,
            bottomLeft: .o, bottomMiddle: .x, bottomRight: .x
        )
        
        #expect(result == .draw)
    }
    
    @Test("Test game is ongoing when top row is not filled andnowin")
    func gameIsOngoing_whenBoardIsNotFull_andNoWin() {
        let result = try! engine.evaluateGameState(
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
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .o,
            topLeft: .o,
            topMiddle: .o,
            topRight: .o,
            middleLeft: .x,
            middleMiddle: .empty,
            middleRight: .empty,
            bottomLeft: .x,
            bottomMiddle: .x,
            bottomRight: .empty
        )
        
        #expect(result == .win)
    }
    
    @Test("Test game is win when second row is filled")
    func gameIsWin_whenMiddleRowIsFilled() {
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .o,
            
            // top row
            topLeft: .empty,
            topMiddle: .x,
            topRight: .empty,
            
            // second row
            middleLeft: .o,
            middleMiddle: .o,
            middleRight: .o,
            
            // bottom row
            bottomLeft: .x,
            bottomMiddle: .empty,
            bottomRight: .x
        )
        
        #expect(result == .win)
    }
    
    @Test("Test game is win when middle row is not filled")
    func gameIsOngoing_whenMiddleRowIsNotComplete() throws {
        let result = try? engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .o,
            topMiddle: .empty,
            topRight: .o,
            
            // second row
            middleLeft: .x,
            middleMiddle: .empty,
            middleRight: .x,
            
            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .empty,
            bottomRight: .empty
        )
        let unwrapped = try #require(result, "evaluateGameState threw unexpectedly")
        #expect(unwrapped == .ongoing)
    }
    
    @Test("Test game is win when bottom row is filled")
    func gameIsWin_whenThirdRowIsFilled() {
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .o,
            topMiddle: .empty,
            topRight: .empty,
            
            // middle row
            middleLeft: .empty,
            middleMiddle: .o,
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
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .x,
            topMiddle: .o,
            topRight: .empty,
            
            // middle row
            middleLeft: .x,
            middleMiddle: .o,
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
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .o,
            topMiddle: .x,
            topRight: .empty,
            
            // middle row
            middleLeft: .empty,
            middleMiddle: .x,
            middleRight: .o,
            
            // bottom row
            bottomLeft: .empty,
            bottomMiddle: .x,
            bottomRight: .empty
        )
        
        #expect(result == .win)
    }
    
    
    @Test("Test game is win when last col is filled")
    func gameIsWin_whenLastColumnIsFilled() {
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .o,
            topMiddle: .empty,
            topRight: .x,
            
            // middle row
            middleLeft: .empty,
            middleMiddle: .o,
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
                         CellState, CellState, CellState,
                         CellState)] = [
                            
                            // second column → X wins
                            (
                                "second column",
                                .o, .x, .empty,   // top
                                .empty, .x, .o,   // middle
                                .empty, .x, .empty, // bottom
                                .x                // currentPlayer
                            ),
                            
                            // third column → X wins
                            (
                                "third column",
                                .o, .empty, .x,   // top
                                .empty, .o, .x,   // middle
                                .empty, .empty, .x, // bottom
                                .x                // currentPlayer
                            )
                         ]
        
        for (_, tl, tm, tr, ml, mm, mr, bl, bm, br, currentPlayer) in testCases {
            let result = try! engine.evaluateGameState(
                isBoardFull: false,
                currentPlayer: currentPlayer,
                
                topLeft: tl,
                topMiddle: tm,
                topRight: tr,
                
                middleLeft: ml,
                middleMiddle: mm,
                middleRight: mr,
                
                bottomLeft: bl,
                bottomMiddle: bm,
                bottomRight: br
            )
            
            #expect(result == .win)
        }
    }
    
    @Test("Test game is win when primary diagonal is filled")
    func gameIsWin_whenPrimaryDiagonalIsFilled() {
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .o,
            
            // top row
            topLeft: .o,
            topMiddle: .x,
            topRight: .empty,
            
            // middle row
            middleLeft: .empty,
            middleMiddle: .o,
            middleRight: .x,
            
            // bottom row
            bottomLeft: .x,
            bottomMiddle: .empty,
            bottomRight: .o
        )
        
        #expect(result == .win)
    }
    
    @Test("Test game is win when secondary diagonal is filled")
    func gameIsWin_whenSecondaryDiagonalIsFilled() {
        let result = try! engine.evaluateGameState(
            isBoardFull: false,
            currentPlayer: .x,
            
            // top row
            topLeft: .o,
            topMiddle: .empty,
            topRight: .x,
            
            // middle row
            middleLeft: .o,
            middleMiddle: .x,
            middleRight: .empty,
            
            // bottom row
            bottomLeft: .x,
            bottomMiddle: .o,
            bottomRight: .empty
        )
        
        #expect(result == .win)
    }
    
    @Test("Test game is win when Board isInvalid both PlayersWin")
    func engineThrowsError_whenBoardIsInvalid_bothPlayersWin() {
        let engine = GameRulesEngine()
        
        #expect(throws: BoardValidationError.bothPlayersWon) {
            try engine.evaluateGameState(
                isBoardFull: false,
                currentPlayer: .x,
                
                topLeft: .x, topMiddle: .x, topRight: .x,
                middleLeft: .o, middleMiddle: .o, middleRight: .o,
                bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
            )
        }
    }
    
    @Test("Test game is win when Board is valid")
    func engineDoesNotThrow_whenBoardIsValid() {
        #expect(throws: Never.self) {
            try engine.evaluateGameState(
                isBoardFull: false,
                currentPlayer: .x,
                
                topLeft: .x, topMiddle: .o, topRight: .x,
                middleLeft: .o, middleMiddle: .x, middleRight: .empty,
                bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
            )
        }
    }

}

