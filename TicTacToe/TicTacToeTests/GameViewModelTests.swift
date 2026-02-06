//
//  GameViewModelTests.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 06/02/2026.
//

import Testing
@testable import TicTacToe

@Suite("GameViewModel Tests")
@MainActor struct GameViewModelTests {
  
    @Test("Test ViewModel when engine return win")
    func viewModelUpdatesState_whenEngineReturnsWin() throws {
        let mockEngine = MockGameRulesEngine()
        mockEngine.resultToReturn = .win

        let viewModel = GameViewModel(engine: mockEngine)

        try viewModel.evaluate(
            board: sampleValidBoard(),
            currentPlayer: .x
        )

        #expect(viewModel.gameResult == .win)
    }
}

//MARK: Test Helpers
extension GameViewModelTests {
    
    func sampleValidBoard() -> Board {
        Board(
            topLeft: .x, topMiddle: .o, topRight: .x,
            middleLeft: .o, middleMiddle: .x, middleRight: .empty,
            bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
        )
    }
}

