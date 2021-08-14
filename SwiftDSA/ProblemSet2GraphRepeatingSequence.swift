import Foundation

func ProblemSet2RepeatingSequence() {
    
    // Helper function to calculate the next number in the sequence.
    func nextInSquence(_ n: Int, _ p: Int) -> Int{
        return Int(String(n).map {
            $0.wholeNumberValue!
        }.reduce(0) {
            $0 + pow(Double($1), Double(p))
        })
    }
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let p = input[1]
    
//    print(a, p)
    
    var vertices = [Int](repeating: 0, count: 1_000_000)
    
    var counter = 1
    var x = a
    var uniqueCount = -1
    vertices[x] = counter
    for _ in 0...100 {
        x = nextInSquence(x, p)
        if vertices[x] != 0 {
//            print(x, vertices[x])
            uniqueCount = vertices[x] - 1
            break
        }
        
        counter += 1
        vertices[x] = counter
//        print(x)
    }
    
    print(uniqueCount)
}

//57
//74
//65
//61

//37
//58
//89
//145
//42
//20
//4
//16

//37
//58
//89
//145
//42
//20
//4
//16

//37
//58
//89
//145
//42
//20
//4
