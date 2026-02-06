//
//  Board.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 05/02/2026.
//

enum CellState: Equatable {
    case empty
    case x
    case o
}

enum BoardValidationError: Error, Equatable {
   case bothPlayersWon
   case invalidMoveCount
   case oPlayedBeforeX
}

struct Board: Equatable {

    private let cells: [CellState]

    // MARK: - Win Patterns
    private let winPatterns: [[Int]] = [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]
    
    var isFull: Bool {
        !cells.contains(.empty)
    }
    
    init(
        topLeft: CellState,
        topMiddle: CellState,
        topRight: CellState,
        middleLeft: CellState,
        middleMiddle: CellState,
        middleRight: CellState,
        bottomLeft: CellState,
        bottomMiddle: CellState,
        bottomRight: CellState
    ) {
        self.cells = [
            topLeft, topMiddle, topRight,
            middleLeft, middleMiddle, middleRight,
            bottomLeft, bottomMiddle, bottomRight
        ]
    }

    func hasWinningPattern(for player: CellState) -> Bool {
        winPatterns.contains { pattern in
            pattern.allSatisfy { cells[$0] == player }
        }
    }

    // MARK: - Validation
    func validate() throws {
        let xCount = cells.filter { $0 == .x }.count
        let oCount = cells.filter { $0 == .o }.count
    
        let xWins = hasWinningPattern(for: .x)
        let oWins = hasWinningPattern(for: .o)
        
        if xWins && oWins {
            throw BoardValidationError.bothPlayersWon
        }
        
        if abs(xCount - oCount) > 1 {
            throw BoardValidationError.invalidMoveCount
        }
        
        if oCount > xCount {
            throw BoardValidationError.oPlayedBeforeX
        }
    }
}

