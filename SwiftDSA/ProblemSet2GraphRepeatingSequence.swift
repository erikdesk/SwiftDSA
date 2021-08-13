import Foundation

func ProblemSet2GraphRepeatingSequence(_ graphInput: String) {
    
    // Helper function to calculate the next number in the sequence.
    func nextInSquence(_ n: Int, _ p: Int) -> Int{
        return Int(String(n).map {
            $0.wholeNumberValue!
        }.reduce(0) {
            $0 + pow(Double($1), Double(p))
        })
    }
    
    var x = 57
    for _ in 0...100 {
        x = nextInSquence(x, 2)
        print(x)
    }
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
