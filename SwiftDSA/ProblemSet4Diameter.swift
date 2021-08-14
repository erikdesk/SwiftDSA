import Foundation

func ProblemSet4Diameter() {
    // Number of vertices (n).
    let n = Int(readLine()!)!
    
    // Vertex connections.
    var vertices = [[(Int, Int)]](repeating: [], count: n+1)
    for _ in 0..<n {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        var j = 1
        while edge[j] != -1 {
//            print(edge[j], edge[j+1])
            vertices[edge[0]].append((edge[j], edge[j+1]))
            j += 2
        }
    }
    
//    for i in 0..<vertices.count {
//        print(i, vertices[i])
//    }
    
    func distanceFrom(_ start: Int, _ visited: inout [Bool], _ distance: inout [Int]) {
        visited[start] = true
        for v in vertices[start] {
            if !visited[v.0] {
                distance[v.0] = distance[start] + v.1
                distanceFrom(v.0, &visited, &distance)
//                print(v.0)
            }
        }
    }
    
    var visited = [Bool](repeating: false, count: n+1)
    var distance = [Int](repeating: 0, count: n+1)
    distanceFrom(4, &visited, &distance)
    
    var firstFarVertex: Int = 4
    for i in 1..<vertices.count {
        if distance[i] > distance[firstFarVertex] {
            firstFarVertex = i
        }
    }
//    print(firstFarVertex)
    
    visited = [Bool](repeating: false, count: n+1)
    distance = [Int](repeating: 0, count: n+1)
    distanceFrom(firstFarVertex, &visited, &distance)
    var diameter = -1
    var secondFarVertex = firstFarVertex
    for i in 1..<vertices.count {
        if distance[i] > distance[secondFarVertex] {
            secondFarVertex = i
            diameter = distance[i]
        }
    }
//    print(distance)
//    print(secondFarVertex)
    print(diameter)
    
}
