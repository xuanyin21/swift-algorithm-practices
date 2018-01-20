/*
 Last-in first-out stack (LIFO)
 Push and pop are O(1) operations.
 */

// T is a placeholder type name
struct Stack<T> {
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    //mutating is to modify the properties of structure
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    var top: T? {
        return array.last
    }
}
var testStack = Stack<Any>()
testStack.isEmpty
for i in 0..<100 {
    testStack.push(i)
}

testStack.push(100)
testStack.count
testStack.pop()
testStack.top
testStack.count
testStack.isEmpty
