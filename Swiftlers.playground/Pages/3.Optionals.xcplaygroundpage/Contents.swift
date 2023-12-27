import Foundation
import SwiftUI

/* ******************************************************************************************************** */
// if-let
let optionalValue: String? = nil
if let unwrapped = optionalValue {
  // Use unwrapped value here
} else {
  // Handle the case where the optional is nil
}

// guard-let
func someFunction() {
  guard let unwrapped = optionalValue else {
    // Handle the nil case & exit the function
    return
  }
  // Use the unwrapped here, in the rest of the function
}

/* ******************************************************************************************************** */
// Nil-Colaesing (??)
let name: String? = "Manas"
let fullName = name ?? "Default Name"

/* ******************************************************************************************************** */
// Force-Unwrap
let age: Int? = 29
let unwrappedAge: Int = age!

/* ******************************************************************************************************** */
// Optional Chaining

struct Person {
  var name: String
  var address: Address?
}
struct Address {
  var street: String
  var city: String
}

let person: Person? = Person(name: "Manas", address: Address(street: "Hinjewadi", city: "Pune"))
let cityName = person?.address?.city

/* ******************************************************************************************************** */
