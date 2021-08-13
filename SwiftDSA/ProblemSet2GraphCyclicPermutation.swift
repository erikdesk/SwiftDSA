import Foundation

func ProblemSet2GraphCyclicPermutation(_ nInput: String, _ graphInput: String) {
    
    // Number of of vertices / edges.
    let n = Int(nInput)!
    
    // Adjacency list.
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    // Populate edges.
    let edge = graphInput.split(separator: " ")
    for i in 0..<n {
        let u = i + 1
        let v = Int(edge[i])!
        adjList[u].append(v)
    }
    
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
