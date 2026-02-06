//
//  MockGameRulesEngine.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 06/02/2026.
//
import Testing
@testable import TicTacToe

final class MockGameRulesEngine: GameRulesEngineProtocol {

    var resultToReturn: GameResult = .ongoing
    var errorToThrow: Error?

    func evaluateGameState(
        board: Board,
        currentPlayer: CellState
    ) throws -> GameResult {

        if let error = errorToThrow {
            throw error
        }

        return resultToReturn
    }
}
