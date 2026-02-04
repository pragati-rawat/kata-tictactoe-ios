//
//  Board.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 04/02/2026.
//

import Foundation

struct Board {
    static let size = 9
    private(set) var cells: [Player?] = Array(repeating: nil, count: size)

    subscript(_ index: Int) -> Player? {
        get { cells[index] }
        set { cells[index] = newValue }
    }

    var isFull: Bool {
        cells.allSatisfy { $0 != nil }
    }
}
