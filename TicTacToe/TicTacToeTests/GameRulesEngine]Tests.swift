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
    func gameIsOngoing_byDefault() {
        // Given
        let boardIsFull = true
        // When
        let result = engine.evaluateGameState(isBoardFull: boardIsFull)
        // Then
        #expect(result == false, "Failed at evaluating game progress for boardValue \(boardIsFull)")
    }

}
