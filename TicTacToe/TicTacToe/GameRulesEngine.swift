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
        topRightFilledByCurrentPlayer: Bool) -> GameStatus {
        let result = isTopRowWin(topLeft: topLeftFilledByCurrentPlayer,
                                 topMiddle: topMiddleFilledByCurrentPlayer,
                                 topRight: topRightFilledByCurrentPlayer)
            
        if result { return .over }
        return isBoardFull ? .over : .ongoing
    }
    
    private func isTopRowWin(topLeft: Bool, topMiddle: Bool, topRight: Bool) -> Bool {
        topLeft && topMiddle && topRight
    }
}
