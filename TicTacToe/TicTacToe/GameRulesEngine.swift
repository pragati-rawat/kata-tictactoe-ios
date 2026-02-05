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
        
        // top row
        topLeftFilledByCurrentPlayer: Bool,
        topMiddleFilledByCurrentPlayer: Bool,
        topRightFilledByCurrentPlayer: Bool,
        
        // middle row
        middleLeftFilledByCurrentPlayer: Bool,
        middleMiddleFilledByCurrentPlayer: Bool,
        middleRightFilledByCurrentPlayer: Bool,
        
        // bottom row
        bottomLeftFilledByCurrentPlayer: Bool,
        bottomMiddleFilledByCurrentPlayer: Bool,
        bottomRightFilledByCurrentPlayer: Bool
    ) -> GameResult {
        
        // top row win
        let isTopRowWin = isWinningRow(leftValue: topLeftFilledByCurrentPlayer,
                                       midValue: topMiddleFilledByCurrentPlayer,
                                       rightValue: topRightFilledByCurrentPlayer)
        // middle row win
       let middleRowWin = isWinningRow(leftValue: middleLeftFilledByCurrentPlayer,
                                       midValue: middleMiddleFilledByCurrentPlayer,
                                       rightValue: middleRightFilledByCurrentPlayer)
        
        
        // bottom row win
       let bottomRowWin = isWinningRow(leftValue: bottomLeftFilledByCurrentPlayer,
                                       midValue: bottomMiddleFilledByCurrentPlayer,
                                       rightValue: bottomRightFilledByCurrentPlayer)
        
        
        if isTopRowWin {
            return .win
        }
        
        if middleRowWin {
            return .win
        }
        
        if bottomRowWin {
            return .win
        }
        
        if isBoardFull {
            return .draw
        }
        
        return .ongoing
    }

    private func isWinningRow(leftValue: Bool, midValue: Bool, rightValue: Bool) -> Bool {
        leftValue && midValue && rightValue
    }
    
}

