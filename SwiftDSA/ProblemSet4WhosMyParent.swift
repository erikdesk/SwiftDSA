import Foundation

func ProblemSet4WhosMyParent() {
    // Number of of vertices
    let firstLine = readLine()!
    let n = Int(firstLine)!

    // Adjacency list.
    var nodeList = [Bool](repeating: false, count: n + 1)
    var adjList = [[Int]](repeating: [], count: n + 1)

    //


    // Populate children.
//    let edges = graphInput.split(separator: "\n")
    for _ in 1..<n {
      let edge = readLine()!.split(separator: " ")
//    }
//    print(edges)
//    for i in 0..<edges.count {
//        let edge = edges[i].split(separator: " ")
//        print(edge)

        let u = Int(edge[0])!
        let v = Int(edge[1])!

        if nodeList[u] && nodeList[v] {
            adjList[u].append(v)
            nodeList[u] = true
            nodeList[v] = true
        } else if nodeList[u] && !nodeList[v] {
            adjList[u].append(v)
            nodeList[u] = true
            nodeList[v] = true
        } else if !nodeList[u] && nodeList[v] {
            adjList[v].append(u)
            nodeList[u] = true
            nodeList[v] = true
        } else {
            adjList[u].append(v)
            nodeList[u] = true
            nodeList[v] = true
        }

    }
    
//    for i in 1..<adjList.count {
//        print("\(i): \(adjList[i])")
//    }
    
    func dfs(_ current: Int, _ find: Int) {
        if adjList[current].count == 0 {
        } else {
            for i in 0..<adjList[current].count {
                if adjList[current][i] == find {
                    print(current)
                } else {
                    dfs(adjList[current][i], find)
                }
            }
        }
    }
    
    for i in 2..<adjList.count {
        dfs(1, i)
    }
}
