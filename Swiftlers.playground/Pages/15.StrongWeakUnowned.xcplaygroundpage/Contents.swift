// StrongWeakUnowned
import Foundation

/* ******************************************************************************************************** */
// Memory Management - Weak, Owned, Unowned
// Strong
//class Person {
//  var name: String
//
//  init(name: String) {
//    self.name = name
//    print("Person \(name) is initialized")
//  }
//  deinit {
//    print("Person \(name) is de-initialized")
//  }
//}
//var refer1: Person? = Person(name: "Manas")
//var refer2: Person?
//refer2 = refer1
//var refer3: Person?
//refer3 = refer1
//refer1 = nil // retain Count of refer1 - 2, refer2 - 1, refer3 - 1
//refer2 = nil // retain Count of refer1 - 1
//refer3 = nil
//
//
///* ******************************************************************************************************** */
//// Weak
//class Person1 {
//  var name: String
//
//  init(name: String) {
//    self.name = name
//    print("Person1 \(name) is initialized")
//  }
//  deinit {
//    print("Person1 \(name) is de-initialized")
//  }
//}
//var refer4: Person1? = Person1(name: "Manas")
//weak var refer5: Person1?
//refer5 = refer4
//refer4 = nil
//
//
///* ******************************************************************************************************** */
//// Unowned
//class Person2 {
//  var name: String
//
//  init(name: String) {
//    self.name = name
//    print("Person2 \(name) is initialized")
//  }
//  deinit {
//    print("Person2 \(name) is de-initialized")
//  }
//}
//var refer6: Person2? = Person2(name: "Manas")
//unowned var refer7: Person2
//refer7 = refer6 ?? Person2(name: "random")
//refer6 = nil





/* ******************************************************************************************************** */
// Strong
class PersonsDetails {
  var name: String
  var car: Cars?
  
  init(name: String) {
    self.name = name
    print("\(name) has been initialized")
  }
  
  deinit {
    print("\(name) has been deallocated")
  }
}

class Cars {
  var make: String
  var owner: PersonsDetails?
  
  init(make: String) {
    self.make = make
    print("\(make) has been initialized")
  }
  
  deinit {
    print("\(make) has been deallocated")
  }
}
var john: PersonsDetails? = PersonsDetails(name: "John")
var bmw: Cars? = Cars(make: "BMW")
john?.car = bmw
bmw?.owner = john
//john = nil
//bmw = nil
john?.car = nil
bmw?.owner = nil
john = nil
bmw = nil



/* ******************************************************************************************************** */
// Weak
class PersonsDetails1 {
  var name: String
  var car: Cars1?
  
  init(name: String) {
    self.name = name
    print("\(name) has been initialized")
  }
  
  deinit {
    print("\(name) has been deallocated")
  }
}

class Cars1 {
  var make: String
  weak var owner: PersonsDetails1?
  
  init(make: String) {
    self.make = make
    print("\(make) has been initialized")
  }
  
  deinit {
    print("\(make) has been deallocated")
  }
}
var john1: PersonsDetails1? = PersonsDetails1(name: "John1")
var bmw1: Cars1? = Cars1(make: "BMW1")
john1?.car = bmw1
bmw1?.owner = john1
john1 = nil
bmw1 = nil



/* ******************************************************************************************************** */
// Unowned - Lifetime Assurance: Unowned references assume that the referenced object will live as long as the object holding the unowned reference. If this assumption is violated (i.e., the referenced object is deallocated before the object holding the unowned reference), it will lead to a runtime crash.

class PersonsDetails2 {
  var name: String
  var car: Cars2?
  
  init(name: String) {
    self.name = name
    print("\(name) has been initialized")
  }
  
  deinit {
    print("\(name) has been deallocated")
  }
}

class Cars2 {
  var make: String
  unowned var owner: PersonsDetails2?
  
  init(make: String) {
    self.make = make
    print("\(make) has been initialized")
  }
  
  deinit {
    print("\(make) has been deallocated")
  }
}

// Create instances
var john2: PersonsDetails2? = PersonsDetails2(name: "John2")
var bmw2: Cars2? = Cars2(make: "BMW2")
john2?.car = bmw2
bmw2?.owner = john2

// 1. If I put, john2 nil first, then try to access bmw2?.owner, then it will runtime crash
john2 = nil
bmw2?.owner
bmw2 = nil

// 2. If I put, bmw2 nil first then try to access john2.car , then
bmw2 = nil
john2?.car
john2 = nil

// In a Swift Playground, the order of execution and deallocation can be influenced by how the Playground runtime manages objects and code execution. In a Playground, the Swift runtime may perform automatic garbage collection and deallocate objects at different points in time.

// In your specific case, the order of the printed statements suggests that the Playground runtime is handling deallocation in a way that allows both objects (PersonsDetails2 and Cars2) to be deallocated before the Playground execution completes.

// However, in a real-world iOS/macOS app, memory management is controlled by the automatic reference counting (ARC) system, and the order of deallocation would be more deterministic. In a typical app, the order of deallocation would be influenced by factors such as strong reference cycles, retain cycles, and the lifetime of objects.

// It's essential to note that the behavior in a Playground may not precisely reflect what would happen in a production app, and the Playground runtime may behave differently for educational and interactive purposes.

// If you want to observe more deterministic behavior, you might want to try similar code in a standalone Swift file or an Xcode project to see how the ARC system manages memory in a more controlled environment.
