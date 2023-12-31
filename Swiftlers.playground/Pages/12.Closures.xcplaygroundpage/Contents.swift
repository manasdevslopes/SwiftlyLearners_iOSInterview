import Foundation

/* ******************************************************************************************************** */
// Closures
// Syntax
//{(paramer) -> returnType in
//  Statements
//}

let myClosure: (Int, Int) -> Int = {(a,b) -> Int in
  return a+b
}
let result = myClosure(2, 5)
print(result)

/* ******************************************************************************************************** */
// Types of Closures

/* ******************************************************************************************************** */
// 1. escaping Closure
func downloadData(completionHandler: @escaping (_ data: String) -> ()) {
  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    completionHandler("New Data")
  }
}
downloadData { data in
  print("Data----->", data)
}

/* ******************************************************************************************************** */
// 2. Non-escaping Closure
func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
  return operation(n1, n2)
}
func add(n1: Int, n2: Int) -> Int {
  return n1 + n2
}
func multiply(n1: Int, n2: Int) -> Int {
  return n1 * n2
}
print(calculator(n1: 2, n2: 5, operation: add))
print(calculator(n1: 2, n2: 5, operation: multiply))


// Or,
calculator(n1: 2, n2: 5) { (no1: Int, no2: Int) -> Int in
  return no1 + no2
}
 
/* ******************************************************************************************************** */
// ShortHand Closures
let add1: (Int, Int) -> Int = { $0 + $1 }

calculator(n1: 2, n2: 5) { no1, no2 -> Int in
  return no1 + no2
}

// Or,
calculator(n1: 2, n2: 5) { (no1, no2) in
  no1 + no2
}

// Or,
calculator(n1: 2, n2: 5) { $0 + $1 }

/* ******************************************************************************************************** */
// Trailing Closure
func performOperation(_ operation: () -> ()) {
  // Function implementation
  operation()
}

// Using trailing closure
performOperation {
  // Code to be executed
}


/* ******************************************************************************************************** */
// Auto-Closure
func printMessage(using closure: @autoclosure () -> String) {
  print(closure())
}

// Not using autoClosure
//printMessage {
// "Hello"
//}
// Using auto-closure
printMessage(using: "Hello, World!")




/* ******************************************************************************************************** */
// More Example
let array = [0,1,2,3,4,5,6,7,8,9]

// One way without Closure
func addOne(n1: Int) -> Int {
  return n1 + 1
}
let newArray = array.map(addOne)
print(newArray)

// With Closure
array.map { (n1: Int) -> Int in
  return n1 + 1
}
// Short Closures
array.map {n1 -> Int in
  return n1 + 1
}
array.map { n1 in
  return n1 + 1
}
array.map { n1 in
  n1 + 1
}
array.map({$0 + 1})
array.map { $0 + 1 }



/* ******************************************************************************************************** */
// Capture Value

func makeIncrementer(incrementAmount: Int) -> (() -> Int) {
  var total = 0
  
  let incrementer: () -> Int = {
    total += incrementAmount
    return total
  }
  return incrementer
}

let incrementByTwo = makeIncrementer(incrementAmount: 2)
print(incrementByTwo())
print(incrementByTwo())
print(incrementByTwo())
print(incrementByTwo())
print(incrementByTwo())
