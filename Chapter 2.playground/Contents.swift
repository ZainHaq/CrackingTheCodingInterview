// CHAPTER 2: Linked Lists
// By: Zain Haq

/* Tips and Tricks

 */

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    public init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    
    var head: Node<T>?
    
    init(values: [T]) {
        
        for value in values {
            self.append(Node<T>(value: value))
        }
        
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }
    
    var count: Int {
        if var node = head {
            var c = 1
            while case let next? = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }
    
    func append(_ newNode: Node<T>) {
        if var node = head {
            while case let next? = node.next {
                node = next
            }
            node.next = newNode
        } else {
            head = newNode
        }
    }
    
    var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
    
}

