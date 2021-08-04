import Foundation

/// RecursionAssignment1
print(evaluate("7"))                 // -> 7
print(evaluate("(2+2)"))             // -> 4
print(evaluate("(1+(2*4))"))         // -> 9
print(evaluate("((1+3)+((1+2)*5))")) // -> 19
print(evaluate("((1*4)+(2*4))"))     // -> 12

/// CrawlMiniProject1
crawl("/Users/erikdesk/Downloads/test/")

/// NQueensProblemMiniProject2
// MARK: Don't know how to solve part 2 - Less than 115 recursive calls.
var board = Board(size: 8);
solveQueens(board: &board)

/// QuickSort
var arr = [6, 10, 8, 2, 3, 2, 9, 0, 1, 7]
//var arr = [2, 4, 9]
quickSort(&arr, 0, arr.count - 1)
print(arr)
