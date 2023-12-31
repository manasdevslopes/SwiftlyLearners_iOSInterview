import Foundation

/* ******************************************************************************************************** */
// try, try!, try?

enum ValidationError: Error {
  case emptyName
  case nameToShort(nameLength: Int)
}

func doSomething(everything: Bool = false) throws -> String {
  if everything { return "Everything is Ok" }
  else { throw  ValidationError.emptyName }
}

// try
do {
  let result = try doSomething(everything: true)
  // Code to handle success
  print(result)
} catch {
  // Code to handle the error
  print(error)
}

// try?
let result = try? doSomething(everything: false)
print(result)
// result is an optional, either containing the result or nil if an error occurred

let result1 = try! doSomething(everything: true)
// No need for a do-catch block, assumes the function will not throw an error
print(result1)

//let result2 = try! doSomething(everything: false)
//print(result2) // This will crash the app



/* ******************************************************************************************************** */
// as, as!, as?

// as
// let someInstance: Subclass = Subclass()
// let superClassInstance = someInstance as Superclass

// as!
let someInstance1: Any = "Hello"
let stringValue = someInstance1 as! String
print(stringValue)

// as?
let someInstance2: Any = 29
if let age = someInstance2 as? Int {
  // Successfully casted to Int
  print("Your age is: \(age)")
} else {
  // Failed to cast to Int
  print("The value is not an integer.")
}
