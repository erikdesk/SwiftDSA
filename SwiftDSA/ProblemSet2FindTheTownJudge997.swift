func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    var arr1 = [Int](repeating: 0, count: n + 1)
    var arr2 = [Int](repeating: 0, count: n + 1)
    
    for i in 0..<trust.count {
        arr1[trust[i][1]] += 1
        arr2[trust[i][0]] += 1
//        print(arr1, arr2)
    }
    
    for i in 1...n {
        if arr1[i] == n - 1 && arr2[i] == 0 {
            return i
        }
    }
    return -1
}
