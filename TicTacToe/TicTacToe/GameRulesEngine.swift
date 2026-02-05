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
    // MARK: - Private helpers
    private func cells(
        _ tl: Bool, _ tm: Bool, _ tr: Bool,
        _ ml: Bool, _ mm: Bool, _ mr: Bool,
        _ bl: Bool, _ bm: Bool, _ br: Bool
    ) -> [Bool] {
        [
            tl, tm, tr,
            ml, mm, mr,
            bl, bm, br
        ]
    }
    
    private let winPatterns: [[Int]] = [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]
    
    private func hasWinningPattern(_ cells: [Bool]) -> Bool {
        winPatterns.contains { pattern in
            pattern.allSatisfy { cells[$0] }
        }
    }

    //MARK: GameState
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
        
        let board = Board(
            topLeft: topLeftFilledByCurrentPlayer,
            topMiddle: topMiddleFilledByCurrentPlayer,
            topRight: topRightFilledByCurrentPlayer,
            middleLeft: middleLeftFilledByCurrentPlayer,
            middleMiddle: middleMiddleFilledByCurrentPlayer,
            middleRight: middleRightFilledByCurrentPlayer,
            bottomLeft: bottomLeftFilledByCurrentPlayer,
            bottomMiddle: bottomMiddleFilledByCurrentPlayer,
            bottomRight: bottomRightFilledByCurrentPlayer
        )
        
        if board.hasWinningPattern() {
            return .win
        }
        
        if isBoardFull {
            return .draw
        }
        
        return .ongoing
    }
}

