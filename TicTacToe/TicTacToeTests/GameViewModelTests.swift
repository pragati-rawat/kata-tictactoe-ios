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
    
    @Test("Test ViewModel when engine throws error")
    func viewModelExposesError_whenEngineThrowsValidationError() {
        let mockEngine = MockGameRulesEngine()
        mockEngine.errorToThrow = BoardValidationError.invalidMoveCount

        let viewModel = GameViewModel(engine: mockEngine)

        #expect(throws: BoardValidationError.invalidMoveCount) {
            try viewModel.evaluate(
                board: sampleInvalidBoard(),
                currentPlayer: .x
            )
        }
    }
    
    @Test("Test player make move and switches turn")
    func makeMove_placesXAndSwitchesTurn() throws {
        let engine = MockGameRulesEngine()
        engine.resultToReturn = .ongoing

        let viewModel = GameViewModel(engine: engine)

        try viewModel.makeMove(row: 0, col: 0)

        #expect(viewModel.board.cell(at: 0, col: 0) == .x)
        #expect(viewModel.currentPlayer == .o)
        #expect(viewModel.gameResult == .ongoing)
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
    
    func sampleInvalidBoard() -> Board {
        Board(
            topLeft: .x, topMiddle: .x, topRight: .x,
            middleLeft: .empty, middleMiddle: .empty, middleRight: .empty,
            bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
        )
    }
}

