//
//  GameVIewModel.swift
//  TicTacToe
//
//  Created by Pragati RAWAT on 06/02/2026.
//
final class GameViewModel {

    private let engine: GameRulesEngineProtocol
    
    private(set) var board: Board
    private(set) var currentPlayer: CellState = .x
    private(set) var gameResult: GameResult = .ongoing
    
    init(engine: GameRulesEngineProtocol) {
        self.engine = engine
        self.board = Board(
            topLeft: .empty, topMiddle: .empty, topRight: .empty,
            middleLeft: .empty, middleMiddle: .empty, middleRight: .empty,
            bottomLeft: .empty, bottomMiddle: .empty, bottomRight: .empty
        )
    }
    
    func makeMove(row: Int, col: Int) throws {
        board = board.withCellSet(row: row, col: col, to: currentPlayer)
        try evaluate(board: board, currentPlayer: currentPlayer)
        
        if gameResult == .ongoing {
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
    }
    
    func evaluate(
        board: Board,
        currentPlayer: CellState
    ) throws {

        let result = try engine.evaluateGameState(
            board: board,
            currentPlayer: currentPlayer
        )

        gameResult = result
    }
}

