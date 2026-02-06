//
//  GameRulesEngine.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 05/02/2026.
//

enum GameResult: Equatable {
    case ongoing
    case draw
    case win
}

final class GameRulesEngine {

    func evaluateGameState(
        isBoardFull: Bool,
        currentPlayer: CellState,

        topLeft: CellState,
        topMiddle: CellState,
        topRight: CellState,
        middleLeft: CellState,
        middleMiddle: CellState,
        middleRight: CellState,
        bottomLeft: CellState,
        bottomMiddle: CellState,
        bottomRight: CellState
    ) throws -> GameResult {

        let board = Board(
            topLeft: topLeft,
            topMiddle: topMiddle,
            topRight: topRight,
            middleLeft: middleLeft,
            middleMiddle: middleMiddle,
            middleRight: middleRight,
            bottomLeft: bottomLeft,
            bottomMiddle: bottomMiddle,
            bottomRight: bottomRight
        )

        // validation delegated to domain
        try board.validate()
        
        if board.hasWinningPattern(for: currentPlayer) {
            return .win
        }
        
        if isBoardFull {
            return .draw
        }
        
        return .ongoing
    }
}
