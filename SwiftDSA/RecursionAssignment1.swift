// Recursion Assignment1 - (evaluate)

import Foundation

func evaluate(_ expr: String) -> Int {
    if expr.first! != "(" {
        return Int(expr)!
    }
    
    let innerExpr = expr[1, expr.count - 1]
    
    var pos = 0, depth = 0
    while !((innerExpr[pos] == "+" || innerExpr[pos] == "*") && depth == 0) {
        if innerExpr[pos] == "(" { depth += 1 }
        if innerExpr[pos] == ")" { depth -= 1 }
        pos += 1
    }
    let lhs = innerExpr[0, pos]
    let rhs = innerExpr[pos + 1, innerExpr.count]
    let operation = innerExpr[pos];
    
    if (operation == "+") {
        return evaluate(lhs) + evaluate(rhs)
    } else {
        return evaluate(lhs) * evaluate(rhs)
    }
}
