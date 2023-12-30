import Foundation

/* ******************************************************************************************************** */
// Protocols - Normal
protocol HelloPrinter {
  var name: String { get }
  func sayHello()
}
struct MyStruct: HelloPrinter {
  var name: String = "Manas"
  func sayHello() {
    print("Hello")
  }
}
let myStruct = MyStruct()
myStruct.name
myStruct.sayHello()


/* ******************************************************************************************************** */
// Protocols - Optional, Use @objc optional and it will be used on class only
@objc protocol MyOptionalProtocol {
  @objc optional func optionalMethod()
  @objc optional var optionalProperty: Int { get }
}

// also to give default values to the above protocol, use extension. Eg as given below.
extension MyOptionalProtocol {
  // Default implementation for optionalMethod
  func optionalMethod() {
    print("Default implementation for optionalMethod123")
  }
  
  // Default implementation for optionalProperty
  var optionalProperty: Int {
    return 0
  }
}

// Conform a struct to the optional protocol
class MyClass: MyOptionalProtocol {
  // You can choose to implement the optional property or not
  var optionalProperty: Int = 42
}

let myClassInstance = MyClass()
print(myClassInstance.optionalProperty) // Output: 42
print(myClassInstance.optionalMethod())


/* ******************************************************************************************************** */
// Protocols - Optional, Without @objc and optional, we need to use extension to give default value so that it can be used on class, struct, enum or associated Value enum

protocol MyOptionalProtocol1 {
  func optionalMethod()
  var optionalProperty: Int { get }
}

extension MyOptionalProtocol1 {
  // Default implementation for optionalMethod
  func optionalMethod() {
    print("Default implementation for optionalMethod")
  }
  
  // Default implementation for optionalProperty
  var optionalProperty: Int {
    return 0
  }
}

struct MyStruct1: MyOptionalProtocol1 {
  // No need to implement optionalMethod or optionalProperty in the struct
}
// Example usage
let myStructInstance = MyStruct1()
myStructInstance.optionalMethod() // Output: Default implementation for optionalMethod
print(myStructInstance.optionalProperty) // Output: 0

class MyClass1: MyOptionalProtocol1 { }
enum Foo: HelloPrinter {
  case a,b,c,d,e
  
  var name: String {
    switch self {
      case .a: return "A"
      case .b: return "B"
      case .c: return "C"
      case .d: return "D"
      default: return "E"
    }
  }
  func sayHello() { }
}
enum Foo1: MyOptionalProtocol1 { case a,b,c,d,e }






/* ******************************************************************************************************** */
// Some Examples of Protocols in Swift and their Usage

// 1. Equatable Protocol: It is used to define types that can be compared for equality using the == operator.
struct Person: Equatable {
  var name: String
  var age: Int
 
  static func == (lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name && lhs.age == rhs.age
  }
}
// Example usage
let person1 = Person(name: "Alice", age: 25)
let person2 = Person(name: "Bob", age: 30)
let person3 = Person(name: "Alice", age: 25)

print(person1 == person2)  // Output: false
print(person1 == person3)  // Output: true


// 2. Comparable Protocol: The Comparable protocol in Swift is used to define types that can be compared using relational operators like <, <=, >, and >=. As this is created from Equatable Protocol, that means we can even use ==.
struct Person1: Comparable {
  var name: String
  var age: Int
  
  // Implementing Comparable manually (Swift 4.2 and later)
  static func < (lhs: Person1, rhs: Person1) -> Bool {
    return lhs.age < rhs.age
  }
  
  static func == (lhs: Person1, rhs: Person1) -> Bool {
    return lhs.age == rhs.age
  }
}

// Example usage
let person4 = Person1(name: "Alice", age: 25)
let person5 = Person1(name: "Bob", age: 30)
let person6 = Person1(name: "Charlie", age: 25)

print(person4 < person5)  // Output: true (Alice is younger than Bob)
print(person4 <= person6) // Output: true (Alice is as young as Charlie)
print(person5 > person6)  // Output: true (Bob is older than Charlie)
print(person4 >= person6) // Output: true (Alice is as old as Charlie)
print(person4 == person6) // Output: true (Same age)



// 3. Codable: Combines Encodable and Decodable protocols to allow types to be easily encoded to and decoded from external representations, such as JSON.
struct Person2: Codable {
  var name: String
  var age: Int
}


// 4. Hashable: It is used to define types that can be hashed into an integer value
struct Person3: Hashable {
  var name: String
  var age: Int
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
    hasher.combine(age)
  }
}
// Example usage
let person7 = Person3(name: "Alice", age: 25)
let person8 = Person3(name: "Bob", age: 30)
let person9 = Person3(name: "Alice", age: 25)

print(person7.hashValue)   // Deprecated in Swift 4.2 and later
print(person7.hash)         // Output: a hash value based on name and age

// Using in a set
let personSet: Set<Person3> = [person7, person8, person9]
print(personSet)            // Output: [{name "Alice", age 25}, {name "Bob", age 30}]



// 5. CustomStringConvertible: Allows a type to provide a custom string representation
struct Book: CustomStringConvertible {
  var title: String
  var author: String
  
  var description: String {
    return "\(title) by \(author)"
  }
}

// Example usage
let book1 = Book(title: "The Catcher in the Rye", author: "J.D. Salinger")
let book2 = Book(title: "To Kill a Mockingbird", author: "Harper Lee")

print(book1)  // Output: The Catcher in the Rye by J.D. Salinger
print(book2)  // Output: To Kill a Mockingbird by Harper Lee



// 6. IteratorProtocol and Sequence: These are used to define and work with custom sequences and iterators.
struct Countdown: Sequence, IteratorProtocol {
  var count: Int
  
  mutating func next() -> Int? {
    guard count > 0 else {
      return nil
    }
    defer {
      count -= 1
    }
    return count
  }
}

// Example usage
let countdown = Countdown(count: 5)

// Using in a for loop
for value in countdown {
  print(value)
}


// 7. CustomNSError: It is used to represent custom error types in a way that is compatible with the NSError model.
enum MyError: Error, CustomNSError {
  case fileNotFound
  case networkError(code: Int)
  
  // MARK: - CustomNSError
  static var errorDomain: String {
    return "com.example.MyAppErrorDomain"
  }
  
  var errorCode: Int {
    switch self {
      case .fileNotFound:
        return 404
      case .networkError(let code):
        return code
    }
  }
  
  var errorUserInfo: [String: Any] {
    switch self {
      case .fileNotFound:
        return [NSLocalizedDescriptionKey: "File not found."]
      case .networkError(let code):
        return [NSLocalizedDescriptionKey: "Network error with code \(code)."]
    }
  }
}

// Example usage
func processFile() throws {
  // Simulate a file not found error
  throw MyError.fileNotFound
}

func fetchData() throws {
  // Simulate a network error
  throw MyError.networkError(code: 500)
}

do {
  try processFile()
} catch let error as NSError {
  print("Error Domain: \(error.domain)")
  print("Error Code: \(error.code)")
  print("Error Description: \(error.localizedDescription)")
}

do {
  try fetchData()
} catch let error as NSError {
  print("Error Domain: \(error.domain)")
  print("Error Code: \(error.code)")
  print("Error Description: \(error.localizedDescription)")
}




/* ******************************************************************************************************** */
// CodingKey
// Below variables are in camelCase, we use camelCase in Swift Projects. But from API we are getting properties in snake_case like first_name. And Android Team and Web are ok and already implemented and converted in their own way. And we can't ask BackEnd to change it now. So we will use CodingKey to change it in our way.

struct UserDetails: Codable {
  let firstName: String
  let lastName: String
  let age: Int
  let address: String
  let isPremium: Bool
  
  private enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
    case age
    case address
    case isPremium = "premium"
  }
}
// Example usage
let jsonString = """
{
    "first_name": "Manas",
    "last_name": "Vijaywargiya",
    "age": 29,
    "address": "Pune",
    "premium": true
}
"""

// Decoding JSON into a Person instance
if let jsonData = jsonString.data(using: .utf8) {
  do {
    let user = try JSONDecoder().decode(UserDetails.self, from: jsonData)
    print("Decoded Person: \(user)")
  } catch {
    print("Error decoding JSON: \(error)")
  }
}

// Encoding a Person instance into JSON
let user = UserDetails(firstName: "Manas", lastName: "Vijaywargiya", age: 29, address: "Pune", isPremium: true)
do {
  let encoder = JSONEncoder()
  encoder.outputFormatting = .prettyPrinted
  let jsonData = try encoder.encode(user)
  if let jsonString = String(data: jsonData, encoding: .utf8) {
    print("Encoded JSON:\n\(jsonString)")
  }
} catch {
  print("Error encoding JSON: \(error)")
}
