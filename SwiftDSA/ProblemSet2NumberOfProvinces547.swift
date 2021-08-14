import Foundation

func findCircleNum(_ isConnected: [[Int]]) -> Int {
    
    let n = isConnected.count
    
//    print(n)
//    print(isConnected)
    
    func dfs(_ start:Int, _ visited: inout [Bool]) {
        visited[start] = true
//        print("visiting..", start)
        
        for v in 0..<isConnected[start].count {
            if !visited[isConnected[start][v]] {
//                print(isConnected[start][v], visited)
                dfs(isConnected[start][v], &visited)
            }
        }
    }
    
    var visited = [Bool](repeating: false, count: n)
    var count = 0
    for v in 0..<isConnected.count {
        if !visited[v] {
            dfs(v, &visited)
            count += 1
//            print("count::", count)
        }
    }
    
    
    
    return count
}
