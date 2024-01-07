// Final Class & Singleton Class
import Foundation

/* ******************************************************************************************************** */
// Final Class
final class Animal {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func makeSound() {
    // This is a generic method for making a sound
    print("Generic animal sound")
  }
}

// This would result in a compile-time error, as you cannot subclass a final class
/*
class Dog: Animal {
  override func makeSound() {
    print("Bark")
  }
}
*/

// Creating an instance of the final class
let someAnimal = Animal(name: "Generic Animal")
someAnimal.makeSound()  // Output: Generic animal sound


/* ******************************************************************************************************** */
// Singleton Class
class MySingleton {
  // Static instance property to hold the single instance of the class
  static let shared = MySingleton()
  
  // A private initializer to prevent the creation of multiple instances
  private init() {
    // Initialization code, if any
  }
  
  // Other methods and properties can be added as needed
  
  func doSomething() {
    print("Singleton is doing something")
  }
}

// Accessing the singleton instance
let singletonInstance = MySingleton.shared
singletonInstance.doSomething()  // Output: Singleton is doing something
