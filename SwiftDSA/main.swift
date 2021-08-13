import Foundation

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
//
//// Group Presentation KMP
//var text = "catcatdogpluscatcattydog", pattern = "catcatty"
//if let result = subStringSearchUsingKMP(&text, &pattern) {
//    print("Index: \(result)")
//    print("\(text[0, result]), \(text[result, result + pattern.count]), \(text[result + pattern.count, text.count])")
//} else {
//    print("Not found!")
//}


// ProblemSet2GraphCyclicPermutation
//ProblemSet2GraphCyclicPermutation("8", "3 2 7 8 1 4 5 6")
//ProblemSet2GraphCyclicPermutation("10", "2 1 3 4 5 6 7 9 10 8")

// ProblemSet2GraphRepeatingSequence
//ProblemSet2GraphRepeatingSequence("57 2")

// ProblemSet5LCA
//ProblemSet5LCA("15", "1 2\n1 3\n2 4\n3 7\n6 2\n3 8\n4 9\n2 5\n5 11\n7 13\n10 4\n11 15\n12 5\n14 7", "1", "6 11\n10 9\n2 6\n7 6\n8 13\n8 15")

//solution()

//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15

ProblemSet3WhosMyParent()

//7
//1 6
//6 3
//3 5
//4 1
//2 4
//4 7
