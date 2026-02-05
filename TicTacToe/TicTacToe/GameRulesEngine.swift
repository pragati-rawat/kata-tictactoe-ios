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
        
        // second row
        middleLeftFilledByCurrentPlayer: Bool,
        middleMiddleFilledByCurrentPlayer: Bool,
        middleRightFilledByCurrentPlayer: Bool
    ) -> GameResult {
        
        // top row win
        let isTopRowWin = isTopRowWin(topLeft: topLeftFilledByCurrentPlayer,
                                      topMiddle: topMiddleFilledByCurrentPlayer,
                                      topRight: topRightFilledByCurrentPlayer)
        if isTopRowWin {
            return .win
        }
        
        // second row win
       let middleRowWin = isMiddleRowWin(midRowLeft: middleLeftFilledByCurrentPlayer,
                                         midRowMiddle: middleMiddleFilledByCurrentPlayer,
                                         midRowRight: middleRightFilledByCurrentPlayer)
        
        
        if middleRowWin {
            return .win
        }
        
        if isBoardFull {
            return .draw
        }
        
        return .ongoing
    }

    private func isTopRowWin(topLeft: Bool, topMiddle: Bool, topRight: Bool) -> Bool {
        topLeft && topMiddle && topRight
    }
    
    private func isMiddleRowWin(midRowLeft: Bool, midRowMiddle: Bool, midRowRight: Bool) -> Bool {
        midRowLeft && midRowMiddle && midRowRight
    }
}
