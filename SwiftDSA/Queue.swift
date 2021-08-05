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
    private var front: Node<E>? = nil
    
    /// Number of items in queue.
    private(set) var count: Int = 0
    
    /// Create an empty queue.
    public init() {}
    
    /// Is the queue empty?
    /// - Returns: Returns true if queue is empty, otherwise false.
    public func isEmpty() -> Bool {
        return front == nil
    }
    
    /// Add an item to the back of the queue.
    /// - Parameter item: The item to be added to the queue.
    public func enqueue(item: E) {
        if isEmpty() {
            front = Node<E>(item: item, next: nil)
            return
        }
        
        var current: Node<E>? = front
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = Node<E>(item: item, next: nil)
        count += 1
    }
    
    /// Removes and returns the item least recently added to the stack.
    /// - Returns: Returns the item least recently added to the stack, nil if queue is empty.
    public func dequeue() -> E? {
        if let oldFront = front {
            front = front?.next
            count -= 1
            return oldFront.item
        }
        return nil // Alternatively can THROW error if empty, instead of Optional.
    }

    /// Returns (but does not remove) the item least recently added to the stack.
    /// - Returns: Returns the item least recently added to the stack.
    public func peek() -> E? {
        return front?.item
        // return nil // Alternatively can THROW error if empty, instead of Optional.
    }

    /// Iterates through items in the stack from the top towards the bottom.
    public struct QueueIterator<E>: IteratorProtocol {
        public typealias Element = E

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
    }

    /// Makes an iterator that iterates over the items in the stack.
    /// - Returns: Returns an iterator that iterates over the items in the stack.
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(front)
    }
}

extension Queue: CustomStringConvertible {
    
    /// Returns queue contents as a string.
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) -> " }
    }
}
