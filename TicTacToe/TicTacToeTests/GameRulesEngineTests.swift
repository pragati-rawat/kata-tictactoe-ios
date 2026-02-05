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
        #expect(isGameOver == true, "Failed at evaluating game progress for boardValue \(boardIsFull)")
    }
    
    @Test("Test game is ongoing when board is not full")
    func gameIsOngoing_whenBoardIsNotFull() {
        let boardIsFull = false
        let isGameOver = engine.evaluateGameState(isBoardFull: boardIsFull)
        #expect(isGameOver == false,  "Failed at evaluating boardisNOtFull for boardValue \(boardIsFull)")
    }

}
