//
//  Player.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 04/02/2026.
//

import Foundation

enum Player {
    case x
    case o

    func toggled() -> Player {
        self == .x ? .o : .x
    }
}
