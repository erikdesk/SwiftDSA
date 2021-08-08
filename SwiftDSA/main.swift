import Foundation

// Group Presentation KMP
var text = "catcatdogpluscatcattydog", pattern = "catcatty"
if let result = subStringSearchUsingKMP(&text, &pattern) {
    print("Index: \(result)")
    print("\(text[0, result]), \(text[result, result + pattern.count]), \(text[result + pattern.count, text.count])")
} else {
    print("Not found!")
}

//
//// RecursionAssignment1
////print(evaluate("7"))                 // -> 7
////print(evaluate("(2+2)"))             // -> 4
////print(evaluate("(1+(2*4))"))         // -> 9
////print(evaluate("((1+3)+((1+2)*5))")) // -> 19
////print(evaluate("((1*4)+(2*4))"))     // -> 12
//
//// CrawlMiniProject1
////crawl("/Users/erikdesk/Downloads/test/")
//
//// NQueensProblemMiniProject2
//// Don't know how to solve part 2 - Less than 115 recursive calls.
////var board = Board(size: 8);
////solveQueens(board: &board)
//
//// QuickSort
////var arr = [6, 10, 8, 2, 3, 2, 9, 0, 1, 7]
////quickSort(&arr, 0, arr.count - 1)
////print(arr)
//
//// Stack
//var stack = Stack<Int>()
//stack.push(item: 3)
//stack.push(item: 8)
//stack.push(item: 9)
//print(stack)
//print("Pop: \(stack.pop())")
//print("Peek: \(stack.peek())")
//for item in stack {
//    print(item)
//}
//
//// Queue
//var queue = Queue<Int>()
//queue.enqueue(item: 3)
//queue.enqueue(item: 8)
//queue.enqueue(item: 9)
//print(queue)
//print("Dequeue: \(queue.dequeue())")
//print("Peek: \(queue.peek())")
//for item in queue {
//    print(item)
//}
