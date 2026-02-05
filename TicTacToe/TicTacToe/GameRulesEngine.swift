//
//  GameRulesEngine.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 05/02/2026.
//

enum GameResult: Equatable {
    case ongoing
    case draw
}

final class GameRulesEngine {
    
    func evaluateGameState(isBoardFull: Bool) -> GameResult {
        isBoardFull ? .draw : .ongoing
    }

    func evaluateGameState(
        isBoardFull: Bool,
        topLeftFilledByCurrentPlayer: Bool,
        topMiddleFilledByCurrentPlayer: Bool,
        topRightFilledByCurrentPlayer: Bool) -> GameResult {
        let result = isTopRowWin(topLeft: topLeftFilledByCurrentPlayer,
                                 topMiddle: topMiddleFilledByCurrentPlayer,
                                 topRight: topRightFilledByCurrentPlayer)
            
        if result { return .draw }
        return isBoardFull ? .draw : .ongoing
    }
    
    private func isTopRowWin(topLeft: Bool, topMiddle: Bool, topRight: Bool) -> Bool {
        topLeft && topMiddle && topRight
    }
}
