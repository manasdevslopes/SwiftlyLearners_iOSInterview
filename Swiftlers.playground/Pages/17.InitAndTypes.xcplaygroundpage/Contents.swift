// Init And its Types
import Foundation

// Types
/* ******************************************************************************************************** */
// 1.Dsignated Initializers - Primary init - init
class Person {
  var name: String
  
  // Designated initializer
  init(name: String) {
    self.name = name
  }
}
var person1 = Person(name: "Manas")

/* ******************************************************************************************************** */
// 2. Convenience Initializer - Secondary init - convenience init
class Person1 {
  var name: String
  var country: String
  
  init(name: String, country: String) {
    self.name = name
    self.country = country
  }
  
  // Convenience initializer
  convenience init(name: String) {
    self.init(name: name, country: "India")
  }
}
var person2 = Person1(name: "Manas")
var person3 = Person1(name: "Steve Jobs", country: "U.S.A.")


/* ******************************************************************************************************** */
// 3. Failbale Initializer - init?
struct Temperature {
  var celsius: Double
  
  // Failable initializer
  init?(fahrenheit: Double) {
    // Conversion logic
    if fahrenheit < -459.67 {
      return nil  // Invalid temperature
    }
    self.celsius = (fahrenheit - 32) * 5 / 9
  }
}
// Usage
if let temperature = Temperature(fahrenheit: 98.6) {
  print("Temperature in Celsius: \(temperature.celsius)")
} else {
  print("Invalid temperature value")
}


/* ******************************************************************************************************** */
// 4. Required Initializer - class inherit from another class - required
class Animal {
  var name: String
  
  // Required initializer for the Animal class
  required init(name: String) {
    self.name = name
  }
  
  func makeSound() {
    fatalError("This method must be overridden by subclasses")
  }
}

class Dog: Animal {
  var breed: String
  
  required init(name: String) {
    self.breed = "Unknown"
    super.init(name: name)
  }
  
  // Additional initializer
  init(name: String, breed: String) {
    self.breed = breed
    super.init(name: name)
  }
  
  override func makeSound() {
    print("Woof!")
  }
}

class Cat: Animal {
  var color: String
  
  required init(name: String) {
    self.color = "Unknown"
    super.init(name: name)
  }
  
  // Additional initializer
  init(name: String, color: String) {
    self.color = color
    super.init(name: name)
  }
  
  override func makeSound() {
    print("Meow!")
  }
}

// Creating instances using the required initializer
let myDog = Dog(name: "Buddy")
let myCat = Cat(name: "Whiskers")

// Creating instances using the additional initializers
let goldenRetriever = Dog(name: "Max", breed: "Golden Retriever")
let tabbyCat = Cat(name: "Mittens", color: "Tabby")
