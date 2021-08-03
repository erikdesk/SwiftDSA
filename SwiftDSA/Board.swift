//
//  Board.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-12.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

struct Board: CustomStringConvertible {
	private var board: [[String]]
	let size: Int
	
	init(size: Int) {
		self.size = size
		self.board = [[String]](repeating: [String](repeating: "-", count: size), count: size)
	}
	
	private func isOnBoard(row: Int, col: Int) -> Bool {
		return row >= 0 && row < self.size && col >= 0 && col < self.size
	}
	
	func isSafe(row: Int, col: Int) -> Bool {
		if !isOnBoard(row: row, col: col) {
			return false
		}
        if self.board[row][col] != "-" {
			return false
		}
		let rows = self.board[row].filter({ $0 == "Q" }).count
		let cols = self.board.filter({ $0[col] == "Q" }).count
		if rows != 0 || cols != 0 {
			return false
		}
		// check diagonals
		for d in 0..<self.size {
			if (isOnBoard(row: row - d, col: col - d) && self.board[row-d][col-d] == "Q")
				|| (isOnBoard(row: row + d, col: col + d) && self.board[row+d][col+d] == "Q")
				|| (isOnBoard(row: row + d, col: col - d) && self.board[row+d][col-d] == "Q")
				|| (isOnBoard(row: row - d, col: col + d) && self.board[row-d][col+d] == "Q") {
				return false
			}
		}
		return true
	}
	
	mutating func place(row: Int, col: Int) {
		if isOnBoard(row: row, col: col) {
			self.board[row][col] = "Q"
		}
	}
	
	mutating func remove(row: Int, col: Int) {
		if isOnBoard(row: row, col: col) {
			self.board[row][col] = "-"
		}
	}
	
	var description: String {
		return self.board.reduce("", { (acc, next) in
			let regex = try! NSRegularExpression(pattern: "[\",]", options: .caseInsensitive)
			let pretty = regex.stringByReplacingMatches(in: next.description, options: [], range: NSMakeRange(0, next.description.count), withTemplate: "")
			return acc + pretty + "\n"
		})
	}
    
    
    
    func isOccupied(row: Int, col: Int) -> Bool {
        if !isOnBoard(row: row, col: col) {
            return false
        }
        if self.board[row][col] == "-" {
            return false
        }
        return true
    }
    
    func isEmptyRow(row: Int) -> Bool {
        for c in 0..<self.size {
            if isOccupied(row: row, col: c) {
                return false
            }
        }
        return true
    }
    
    func isEmptyColumn(col: Int) -> Bool {
        for r in 0..<self.size {
            if isOccupied(row: r, col: col) {
                return false
            }
        }
        return true
    }
    
    func emptyRowsCount() -> Int {
        var emptyCount = 0
        for r in 0..<self.size {
            if isEmptyRow(row: r) { emptyCount += 1 }
        }
        return emptyCount
    }
    
    func emptyColumnsCount() -> Int {
        var emptyCount = 0
        for c in 0..<self.size {
            if isEmptyColumn(col: c) { emptyCount += 1 }
        }
        return emptyCount
    }
}
