import Foundation

public final class Stack<E>: Sequence {
    
    /// Helper linked-list node class.
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Top item in stack.
    private var first: Node<E>? = nil
    
    /// Number of items in stack.
    private(set) var count: Int = 0
    
    /// Create an empty stack.
    public init() {}
    
    /// Is the stack empty?
    /// - Returns: Returns true if stack is empty, otherwise false.
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// Add an item to the top of the stack.
    /// - Parameter item: The item to be added to the stack.
    public func push(item: E) {
        let oldFirst = first
        first = Node<E>(item: item, next: oldFirst)
        count += 1
    }
    
    /// Removes and returns the item most recently added to the stack.
    /// - Returns: Returns the item most recently added to the stack, nil if stack is empty.
    public func pop() -> E? {
        if let item = first?.item {
            first = first?.next
            count -= 1
            return item
        }
        return nil // Alternatively can THROW error if empty, instead of Optional.
    }
    
    /// Returns (but does not remove) the item most recently added to the stack.
    /// - Returns: Returns the item most recently added to the stack.
    public func peek() -> E? {
        return first?.item
        // return nil // Alternatively can THROW error if empty, instead of Optional.
    }
    
    /// Iterates through items in the stack from the top towards the bottom.
    public struct StackIterator<E>: IteratorProtocol {

        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
        
        // MARK: can put at the bottom!
        public typealias Element = E
    }

    /// Makes an iterator that iterates over the items in the stack.
    /// - Returns: Returns an iterator that iterates over the items in the stack.
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack: CustomStringConvertible {
    
    /// Returns stack contents as a string.
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) -> " }
    }
}
