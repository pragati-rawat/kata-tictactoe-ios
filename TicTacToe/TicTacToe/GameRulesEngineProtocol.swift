//
//  GameViewModelProtocol.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 06/02/2026.
//

protocol GameRulesEngineProtocol {
    func evaluateGameState(
        board: Board,
        currentPlayer: CellState
    ) throws -> GameResult
}
