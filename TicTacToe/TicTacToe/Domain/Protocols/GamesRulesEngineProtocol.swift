//
//  GamesRulesEngineProtocol.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 04/02/2026.
//

import Foundation

protocol GameRulesEngineProtocol {
    func evaluate(board: Board) -> GameResult
}
