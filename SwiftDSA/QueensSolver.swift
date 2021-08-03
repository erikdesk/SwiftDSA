// https://stackoverflow.com/questions/8525177/what-does-question-mark-mean-in-xcode-project-navigator

//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

// MARK: Don't know how to solve part 2 - Less than 115 recursive calls.

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var possibleWaysCount = 0
func solveQueens(board: inout Board) {

//    var choices = [Board]()
    solveQueensHelper(&board, 8, 0, 0)
    print("(... \(possibleWaysCount) possible ways)")
    print("Number of recursive calls: \(count)")
}

// , _ choices: inout [Board]
func solveQueensHelper(_ board: inout Board, _ toBePlacedCount: Int, _ currentRow: Int, _ currentColumn: Int) {
    count += 1

    if toBePlacedCount == 0 {
        // successful branch.
        possibleWaysCount += 1
        print(board.description)
        return
    }

    if toBePlacedCount > 0 && (currentRow == board.size && (currentColumn == board.size)) {
        // failed branch.
        return
    }
    var r = currentRow
    var c = currentColumn
    while r < board.size && c < board.size {

//        print("r: \(r), c: \(c), toBePlacedCount: \(toBePlacedCount)")
//        print(board.description)
        if board.isSafe(row: r, col: c) {
            board.place(row: r, col: c)
            var newC = c
            var newR = r

            solveQueensHelperIncrement(&board, &newR, &newC)

            solveQueensHelper(&board, toBePlacedCount - 1, newR, newC)
            board.remove(row: r, col: c)
        } else {
//                print(board.description)
//                            print("i: \(i), j: \(j), toBePlacedCount: \(toBePlacedCount)")
//                solveQueensHelper(&board, toBePlacedCount, i + 1, j)
        }

        solveQueensHelperIncrement(&board, &r, &c)
//        c += 1
//        if c == board.size {
//            c = 0
//            r += 1
//        }
    }

//    var i = currentRow
//    var j = currentColumn
//    while j < board.size && i < board.size {
//        if board.isSafe(row: i, col: j) {
//            board.place(row: i, col: j)
////            print(board.description)
////                choices.append(board)
//            let iOld = i
//            let jOld = j
//            j = i + 1 == board.size ? j + 1 : j
//            i = i + 1 == board.size ? 0 : i + 1
//            print("i: \(i) -- j: \(j)")
//            solveQueensHelper(&board, &choices, toBePlacedCount - 1, i, j)
//            board.remove(row: iOld, col: jOld)
//        } else {
//            j = i + 1 == board.size ? j + 1 : j
//            i = i + 1 == board.size ? 0 : i + 1
//            print("i: \(i) -- j: \(j)")
////            solveQueensHelper(&board, &choices, toBePlacedCount, i, j)
//        }
//    }
}

func solveQueensHelperIncrement(_ board: inout Board, _ r: inout Int, _ c: inout Int) {

    c += 1
    if c == board.size {
        c = 0
        r += 1
    }
}


//var count = 0
//var possibleWaysCount = 0
//func solveQueens(board: inout Board) {
//
////    var choices = [Board]()
//    solveQueensHelper(&board, 8, 0, 0)
//    print("(... \(possibleWaysCount) possible ways)")
//    print("Number of recursive calls: \(count)")
//}
//
//// , _ choices: inout [Board]
//func solveQueensHelper(_ board: inout Board, _ toBePlacedCount: Int, _ currentRow: Int, _ currentColumn: Int) {
//    count += 1
//
//    if toBePlacedCount == 0 {
//        // successful branch.
//        possibleWaysCount += 1
//        print(board.description)
//        return
//    }
//
//    if toBePlacedCount > 0 && (currentRow == board.size && (currentColumn == board.size)) {
//        // failed branch.
//        return
//    }
//    var r = currentRow
//    var c = currentColumn
//    while r < board.size && c < board.size {
//
////        print("r: \(r), c: \(c), toBePlacedCount: \(toBePlacedCount)")
//        if board.isSafe(row: r, col: c) {
//            board.place(row: r, col: c)
//            var newC = c
//            var newR = r
//
////            var countRemainingSafeSlots = 0
////            for rr in 0..<board.size {
////                for cc in 0..<board.size {
////                    if board.isSafe(row: rr, col: cc) {
////                        countRemainingSafeSlots += 1
////                    }
////                }
////
////            }
//
//            print(toBePlacedCount - 1)
//            print(board.emptyRowsCount())
//            if board.emptyRowsCount() >= toBePlacedCount - 1 {
//                print(board.description)
//                solveQueensHelperIncrementRow(&board, &newR, &newC)
//                solveQueensHelper(&board, toBePlacedCount - 1, newR, newC)
////            }
//
//            }
//            board.remove(row: r, col: c)
//        } else {
////                print(board.description)
////                            print("i: \(i), j: \(j), toBePlacedCount: \(toBePlacedCount)")
////                solveQueensHelper(&board, toBePlacedCount, i + 1, j)
//        }
//
//        solveQueensHelperIncrement(&board, &r, &c)
////        c += 1
////        if c == board.size {
////            c = 0
////            r += 1
////        }
//    }
//
////    var i = currentRow
////    var j = currentColumn
////    while j < board.size && i < board.size {
////        if board.isSafe(row: i, col: j) {
////            board.place(row: i, col: j)
//////            print(board.description)
//////                choices.append(board)
////            let iOld = i
////            let jOld = j
////            j = i + 1 == board.size ? j + 1 : j
////            i = i + 1 == board.size ? 0 : i + 1
////            print("i: \(i) -- j: \(j)")
////            solveQueensHelper(&board, &choices, toBePlacedCount - 1, i, j)
////            board.remove(row: iOld, col: jOld)
////        } else {
////            j = i + 1 == board.size ? j + 1 : j
////            i = i + 1 == board.size ? 0 : i + 1
////            print("i: \(i) -- j: \(j)")
//////            solveQueensHelper(&board, &choices, toBePlacedCount, i, j)
////        }
////    }
//}
//
//func solveQueensHelperIncrement(_ board: inout Board, _ r: inout Int, _ c: inout Int) {
//
//    c += 1
//    if c == board.size {
//        c = 0
//        r += 1
//    }
//}
//
//func solveQueensHelperIncrementRow(_ board: inout Board, _ r: inout Int, _ c: inout Int) {
//
//    r += 1
//    c = 0
//}
