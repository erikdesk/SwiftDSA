import Foundation

public final class Queue<E>: Sequence {
    
    /// Helper linked-list node class.
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Front item in queue.
    private var first: Node<E>? = nil
    
    /// Back item in queue.
    private var last: Node<E>? = nil
    
    /// Number of items in queue.
    private(set) var count: Int = 0
    
    /// Create an empty queue.
    public init() {}
    
    /// Is the queue empty?
    /// - Returns: Returns true if queue is empty, otherwise false.
    public func isEmpty() -> Bool {
        return first == nil
    }
    
    /// Add an item to the back of the queue.
    /// - Parameter item: The item to be added to the queue.
    public func enqueue(item: E) {
        
        // MARK: Updated based on class solution.
        let oldLast = last
        last = Node<E>(item: item)
        if isEmpty() { first = last }
        else { oldLast?.next = last }
        count += 1
        
        // MARK: Submitted Assignment.
        //if isEmpty() {
        //    first = Node<E>(item: item, next: nil)
        //    return
        //}
        //
        //var current: Node<E>? = first
        //while current?.next != nil {
        //    current = current?.next
        //}
        //
        //current?.next = Node<E>(item: item, next: nil)
        //count += 1
    }
    
    /// Removes and returns the item least recently added to the stack.
    /// - Returns: Returns the item least recently added to the stack, nil if queue is empty.
    public func dequeue() -> E? {
        
        // MARK: Updated based on class solution.
        if let item = first?.item {
            first = first?.next
            count -= 1
            if isEmpty() { last = nil }
            return item
        }
        return nil
        
        // MARK: Submitted Assignment.
        //if let oldFront = first {
        //    first = first?.next
        //    count -= 1
        //    return oldFront.item
        //}
        //return nil // Alternatively can THROW error if empty, instead of Optional.
    }

    /// Returns (but does not remove) the item least recently added to the stack.
    /// - Returns: Returns the item least recently added to the stack.
    public func peek() -> E? {
        return first?.item
        // return nil // Alternatively can THROW error if empty, instead of Optional.
    }

    /// Iterates through items in the stack from the top towards the bottom.
    public struct QueueIterator<E>: IteratorProtocol {

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
        
        // MARK: can put at bottom too.
        public typealias Element = E
    }

    /// Makes an iterator that iterates over the items in the stack.
    /// - Returns: Returns an iterator that iterates over the items in the stack.
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension Queue: CustomStringConvertible {
    
    /// Returns queue contents as a string.
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) -> " }
    }
}
