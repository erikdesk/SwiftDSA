import Foundation

// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
  if arr.count <= 1 { return arr }
    
  var elements = arr
  let pivot = elements.removeLast()
  let lessOrEqual = elements.filter { $0 <= pivot }
  let greater = elements.filter { $0 > pivot }
    
  return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)

// [6, 10, 8, 2, 3, 2, 9, 0, 1, 7]

//func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
func quickSort(_ arr: inout [Int], _ start: Int, _ end: Int) {

    if start >= end { return }
    
//    print("---")
//    print("start: \(start)")
//    print("end: \(end)")
    let indexOfPivot = partition(&arr, start, end)
//    if indexOfPivot - 1 > start {
        quickSort(&arr, start, indexOfPivot - 1)
//    }
//    if indexOfPivot + 1 < end {
        quickSort(&arr, indexOfPivot + 1, end)
//    }
    
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
//func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
func partition(_ arr: inout [Int], _ start: Int, _ end: Int) -> Int {
    
//    print("pivot: \(arr[end])")
//    print(arr)
    
    var j = start - 1
    for i in start...end {
        if arr[i] <= arr[end] {
            j += 1
            arr.swapAt(i, j)
        }
//        print(arr)
    }
//    print("index: \(j)")
    
    return j
}
