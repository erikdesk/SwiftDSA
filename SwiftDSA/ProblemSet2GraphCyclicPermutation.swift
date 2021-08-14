import Foundation

func ProblemSet2CyclicPermutation() {
    
    // Number of tests.
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        
        // Number of vertices.
        let n = Int(readLine()!)!
        let edges = readLine()!.split(separator: " ").map { Int($0)! }
//        print(edges)
        
        // Populate adjList.
        var adjList = [[Int]](repeating: [], count: n + 1)
        for i in 0..<n {
            let u = i + 1
            let v = edges[i]
            adjList[u].append(v)
        }
        
//        print(adjList)
        
        // Depth First Search traversal marks visited vertices.
        func dfs(_ start: Int, _ visited: inout [Bool]) {
            visited[start] = true
            for v in adjList[start] {
                if !visited[v] { dfs(v, &visited) }
            }
        }
    
        // Does BFS for each cycle.
        var visited = [Bool](repeating: false, count: n + 1)
        var count = 0
        for v in 1..<adjList.count {
            if !visited[v] {
            dfs(v, &visited)
            count += 1
            }
        }
    
        print(count)
    }
    
//    print("X")
    
}
