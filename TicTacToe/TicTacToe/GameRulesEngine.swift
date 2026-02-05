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
        let isTopRowWin = isWinningRow(topLeftFilledByCurrentPlayer, topMiddleFilledByCurrentPlayer, topRightFilledByCurrentPlayer)
       
      // middle row win
       let middleRowWin = isWinningRow(middleLeftFilledByCurrentPlayer, middleMiddleFilledByCurrentPlayer, middleRightFilledByCurrentPlayer)
        
        // bottom row win
       let bottomRowWin = isWinningRow(bottomLeftFilledByCurrentPlayer, bottomMiddleFilledByCurrentPlayer, bottomRightFilledByCurrentPlayer)
        
        if isTopRowWin || middleRowWin || bottomRowWin {
            return .win
        }
        
        // first column
        if isWinningRow(topLeftFilledByCurrentPlayer, middleLeftFilledByCurrentPlayer, bottomLeftFilledByCurrentPlayer) {
            return .win
        }
        
        // mid column
        if isWinningRow(topMiddleFilledByCurrentPlayer, middleMiddleFilledByCurrentPlayer, bottomMiddleFilledByCurrentPlayer) {
            return .win
        }
        
        // last column
        if isWinningRow(topRightFilledByCurrentPlayer, middleRightFilledByCurrentPlayer, bottomRightFilledByCurrentPlayer) {
            return .win
        }
        
        // primary diagonals
        if isWinningRow(topLeftFilledByCurrentPlayer, middleMiddleFilledByCurrentPlayer, bottomRightFilledByCurrentPlayer) {
            return .win
        }
        
        if isBoardFull {
            return .draw
        }
        
        return .ongoing
    }

    private func isWinningRow(_ leftValue: Bool,_ midValue: Bool, _ rightValue: Bool) -> Bool {
        leftValue && midValue && rightValue
    }
    
}

