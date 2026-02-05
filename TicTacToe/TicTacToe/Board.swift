//
//  Board.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 05/02/2026.
//

struct Board: Equatable {

    private let cells: [Bool]

    init(
        topLeft: Bool, topMiddle: Bool, topRight: Bool,
        middleLeft: Bool, middleMiddle: Bool, middleRight: Bool,
        bottomLeft: Bool, bottomMiddle: Bool, bottomRight: Bool
    ) {
        self.cells = [
            topLeft, topMiddle, topRight,
            middleLeft, middleMiddle, middleRight,
            bottomLeft, bottomMiddle, bottomRight
        ]
    }

    func hasWinningPattern() -> Bool {
        winPatterns.contains { pattern in
            pattern.allSatisfy { cells[$0] }
        }
    }

    // MARK: - Win Patterns
    private let winPatterns: [[Int]] = [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]
}
