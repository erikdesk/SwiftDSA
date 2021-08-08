import Foundation

/// Finds the substring pattern in text and returns the index (uses KMP algorithm).
/// - Parameters:
///   - text: String to be searched on.
///   - pattern: Substring to be located within text.
/// - Returns: Returns the start of pattern within text or nil if not found or invalid arguments supplied.
func subStringSearchUsingKMP(_ text: inout String, _ pattern: inout String) -> Int? {
    
    if text.count < pattern.count {
        return nil
    } else if pattern.count == 0 {
        return nil
    }
    
    var table: [Int] = Array(repeating: 0, count: pattern.count)
    setupPatternTable(&table, &pattern)
    
    // For demo.
    print("Pattern Table: \(table)")
    
    var textIndex = 0, patternIndex = 0
    while textIndex < text.count && patternIndex < pattern.count {
        if text[textIndex] == pattern[patternIndex] {
            textIndex += 1
            patternIndex += 1
        } else if patternIndex == 0 {
            textIndex += 1
        } else {
            patternIndex = table[patternIndex - 1]
        }
    }
    
    if patternIndex == pattern.count {
        return textIndex - pattern.count
    }
    return nil
}

/// Helper function that sets up the pattern table required for KMP substring search.
/// - Parameters:
///   - table: Allocated non-initialized array the length of pattern string.
///   - pattern: String to generate the pattern table from.
func setupPatternTable(_ table: inout [Int], _ pattern: inout String) {
    
    table[0] = 0
    
    var prefixIndex = 0, suffixIndex = 1
    while suffixIndex < pattern.count {
        if pattern[suffixIndex] == pattern[prefixIndex] {
            table[suffixIndex] = prefixIndex + 1
            suffixIndex += 1
            prefixIndex += 1
        } else if prefixIndex == 0 {
            table[suffixIndex] = 0
            suffixIndex += 1
        } else {
            prefixIndex = table[prefixIndex - 1]
        }
    }
}
