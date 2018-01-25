//: Playground - noun: a place where people can play

enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    // Number of nodes, O(n)
    var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    
    // Distance from this node to its lowest node, O(n)
    var height: Int {
        switch self {
        case let .node(left, _, right):
            return max(left.height, right.height) + 1
        case .empty:
            return 0
        }
    }
    
    // Inserts a new element, O(h)
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    
    }

    mutating func insert(newValue: T) {
        
        self = newTreeWithInsertedValue(newValue: newValue)
        
    }
    
    //Traversal In Order, O(n)
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        // 1
        case .empty:
            return
        // 2
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    func traversePreOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    //Searching, O(h)
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            } else if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
    
    func minimum() -> BinaryTree {
        var node = self
        var prev = node
        while case let .node(next, _, _) = node {
            prev = node
            node = next
        }
        
        return prev
    }
    
    func maximum() -> BinaryTree {
        var node = self
        var prev = node
        while case let .node(_,_,next) = node {
            prev = node
            node = next
        }
        return prev
    }
}

extension BinaryTree: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ""
        }
    }
}

var tree: BinaryTree<Int> = .empty
tree.insert(newValue: 7)
tree.insert(newValue: 10)
tree.insert(newValue: 2)
tree.insert(newValue: 1)
tree.insert(newValue: 5)
tree.insert(newValue: 9)

tree.minimum()
tree.maximum()
tree.count
tree.height
print(tree)
tree.search(searchValue: 9)
tree.traversePreOrder {print($0)}
