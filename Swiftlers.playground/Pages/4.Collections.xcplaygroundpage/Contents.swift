import SwiftUI

/* ******************************************************************************************************** */
// Array
var someInt: [Int] = []
someInt.append(5)
someInt = []

var newArray = Array(repeating: 5.5, count: 3)
var anotherArray = Array(repeating: 3.5, count: 2)
var combinedArray = newArray + anotherArray
combinedArray.count
combinedArray.append(4.8)
combinedArray.prefix(2)
combinedArray.suffix(2)
var opArray: [Double] = [3.33]
combinedArray += opArray
combinedArray.insert(9.0, at: 6)
combinedArray.sorted()
combinedArray[4]
combinedArray.isEmpty
combinedArray.remove(at: 6)
combinedArray.contains(4.8)
combinedArray[4] = 2.5 // Update
combinedArray.removeAll()
combinedArray

for(index, value) in newArray.enumerated() {
  print("IndexNumber: \(index) : \(value)")
}


/* ******************************************************************************************************** */
// Sets
var letter = Set<Character>()
letter.insert("a")
letter.count
letter = []
var fav: Set<String> = ["Rock", "Classical"]
//or... var fav: Set = ["Rock", "Classical"]
fav.count
fav.insert("funk")
fav.count
fav.contains("Manas")
fav.contains("funk")
fav
fav.sorted()
fav.isEmpty
fav.remove("funk")
fav.removeFirst()
fav.removeAll()

/* ******************************************************************************************************** */
// Dictionary
var nameOfInt: [Int: String] = [:]
nameOfInt[16] = "Sixteen"
nameOfInt
nameOfInt = [:]
var airports: [String: String] = ["LHS":"Lodon","DUB":"Dublin","APL":"Andhra","IGI":"Indira ghandi Airport"]
airports.count
airports.isEmpty
airports["IGI"]
airports["LHS"] = "London Heat"
airports.removeValue(forKey: "APL")
airports["LHS"] = nil
airports
for (key, value) in airports {
  print("\(key) : \(value)")
}
for key in airports.keys {
  print("\(key)")
}
for value in airports.values {
  print("\(value)")
}
airports.removeAll()


/* ******************************************************************************************************** */
// Tuples
var product = ("Mac", 1000)
product.0
product.1
product.1 = 1200
product
var company = (productName: "BlaceNova Apps", version: 1.0)
company.productName
company.version
company


