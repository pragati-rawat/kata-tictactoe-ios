//
//  GameVIewModel.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 06/02/2026.
//
final class GameViewModel {

    private let engine: GameRulesEngineProtocol

    private(set) var gameResult: GameResult?

    init(engine: GameRulesEngineProtocol) {
        self.engine = engine
    }

    func evaluate(
        board: Board,
        currentPlayer: CellState
    ) throws {

        let result = try engine.evaluateGameState(
            board: board,
            currentPlayer: currentPlayer
        )

        gameResult = result
    }
}

