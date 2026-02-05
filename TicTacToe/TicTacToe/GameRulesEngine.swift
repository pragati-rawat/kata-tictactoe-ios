//
//  GameRulesEngine.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 05/02/2026.
//

enum GameStatus: Equatable {
    case ongoing
    case over
}

final class GameRulesEngine {
    
    func evaluateGameState(isBoardFull: Bool) -> GameStatus {
        isBoardFull ? .over : .ongoing
    }

    func evaluateGameState(
        isBoardFull: Bool,
        topLeftFilledByCurrentPlayer: Bool,
        topMiddleFilledByCurrentPlayer: Bool,
        topRightFilledByCurrentPlayer: Bool
    ) -> GameStatus {
        if topLeftFilledByCurrentPlayer && topMiddleFilledByCurrentPlayer && topRightFilledByCurrentPlayer {
            return .over
        }
        return isBoardFull ? .over : .ongoing
    }
}
