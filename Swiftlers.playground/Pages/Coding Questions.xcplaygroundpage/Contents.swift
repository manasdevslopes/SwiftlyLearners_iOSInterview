import Foundation
import SwiftUI

/* ******************************************************************************************************** */
func dt(_ arr: [Int], num: Int) -> Int {
  for(i, value) in arr.enumerated() {
    if(value == num) {
      return i
    }
  }
  return -1
}

print(dt([4,9,16,33], num:16))
print(dt([4,9,16,33], num:20))

let numbers = [45, 73, 195, 53]
let computedNumbers = numbers.enumerated().map { (index, element) in
  return element * numbers[(index + 1) % numbers.count]
}

print(computedNumbers)


/* ******************************************************************************************************** */
// Current Date to timestamp and then timestamp to Date
let timestamp = NSDate().timeIntervalSince1970
print(timestamp)

let time = NSDate(timeIntervalSince1970: TimeInterval(timestamp))
print(time)




/* ******************************************************************************************************** */
// Closure
func slosure(data1: String, data2: String, completion: (_ s1: String, _ s2: String) -> String) -> String {
  return completion(data1, data2)
}

slosure(data1: "Hello", data2: "World") { (s1:String, s2: String) -> String in
  return "\(s1), \(s2)!!"
}

slosure(data1: "Hello", data2: "World") { (s1, s2) -> String in
  return "\(s1), \(s2)!!"
}
slosure(data1: "Hello", data2: "World") { s1, s2 in
  return "\(s1), \(s2)!!"
}
slosure(data1: "Hello", data2: "World") { s1, s2 in
  "\(s1), \(s2)!!"
}
slosure(data1: "Hello", data2: "World") { "\($0), \($1)!!" }


/* ******************************************************************************************************** */
// Swap Two numbers
func swap2num(a: Int, b:Int) -> (Int, Int) {
  var temp = 0
  var num1 = a
  var num2 = b
  temp = num1
  num1 = num2
  num2 = temp
  
  return (num1, num2)
}
print(swap2num(a: 5, b: 4))


/* ******************************************************************************************************** */
// Reverse A String
func reverseString(_ stringValue: String) -> String {
  var str = ""
  for charater in stringValue {
    str = "\(charater)" + str
  }
  return str
}
print (reverseString("!pleH"))
print (reverseString("Hello, World!!"))

var arr = [1, 2, 2, 2, 3, 3, 4, 4, 4, 4, 4]
var countDictionary: [Int: Int] = [:]

for num in arr {
  if let count = countDictionary[num] {
    print("Count", count)
    countDictionary[num] = count + 1
  } else {
    countDictionary[num] = 1
  }
}
print(countDictionary)


// Remove Duplicates from Array
var arrayOne = [2,1, 1,2,3,4,5,6,7,8,7,9,10,11,12,11,10,16,18,20,18,16]
var charOne = ["a", "a", "c", "b", "b", "d", "e", "e"]

// Sol 1: Lame Approach
let removeDuplicatesArray = Set(arrayOne)
print(removeDuplicatesArray)

// Sol2: Auxillary Space(Temp. Array) along with Equatable Protocol Array Extension
extension Array where Element: Equatable {
  func removeDuplicates() -> [Element] {
    guard !self.isEmpty else { return [] }
    
    // Auxillary Space ie temp array
    var temp: [Element] = []
    
    self.forEach { item in
      if(!temp.contains(item)) {
        temp.append(item)
      }
    }
    return temp
  }
}
let removeDupplicatesIntArray = arrayOne.removeDuplicates()
print(removeDupplicatesIntArray)
let removeDupplicatesCharArray = charOne.removeDuplicates()
print(removeDupplicatesCharArray)

// Approach 3: self return to an array, without returning array
extension Array where Element: Equatable {
  mutating func removeDuplicatesOne() {
    guard !self.isEmpty else { return }
    
    // Auxillary Space ie temp array
    var temp: [Element] = []
    
    self.forEach { item in
      if(!temp.contains(item)) {
        temp.append(item)
      }
    }
    self = temp
  }
}
arrayOne.removeDuplicatesOne()
charOne.removeDuplicatesOne()
print("arrayOne", arrayOne)
print("charOne", charOne)

/*
 Note: - if removeDuplicates should work only with Int Array, then
 extension Array where Element == Int { ... rest all same }
 */

// To filter capital character from a given String
var str: String = "Hello World"
func filterCapitalCharacters(from string: String) -> String? {
  guard !string.isEmpty else { return nil }
  let result = string.filter { ("A" ... "Z").contains($0) }
  return result.isEmpty ? nil : result
}
print(filterCapitalCharacters(from: str) as Any)

// To Convert the elements of [Any] to [Int]
let input: [Any] = [true, 1, "manas", 2, "manasvj", false, "playground"]
func convertToIntArray(input: [Any]) -> [Int] {
  guard !input.isEmpty else { return [] }
  let result = input.compactMap { $0 as? Int }
  return result.isEmpty ? [] : result
}
print(convertToIntArray(input: input))


// Swap Two Numbers
var a: Int = 10
var b: Int = 20
var firstNumber: Int = 10
var secondNumber: Int = 20

// Approach 1 : using Tuple
(a, b) = (b, a)
print("a: \(a), b: \(b)")

// Approach 2 Using func
func swapNumbersUsingTuple(_ a: inout Int, _ b: inout Int) {
  (a, b) = (b, a)
}
print("Before swap firstNumber = \(firstNumber), secondNumber = \(secondNumber)")
swapNumbersUsingTuple(&firstNumber, &secondNumber)
print("After swap firstNumber = \(firstNumber), secondNumber = \(secondNumber)")

// Approach 3
var aNum = 10
var bNum = 20
func swapNumbers(_ a: inout Int, _ b: inout Int) {
  var temp = a
  a = b
  b = temp
}
swapNumbers(&aNum, &bNum)
print("After swapNumbers aNum = \(aNum), bNum = \(bNum)")

// Generic function
var aDouble = 10.11
var bDouble = 12.12
func swapNumberGeneric<T>(_ a: inout T, _ b: inout T) {
  (a, b) = (b, a)
}
swapNumberGeneric(&aDouble, &bDouble)
print("After swapNumberGeneric aDouble = \(aDouble), bDouble = \(bDouble)")



// Given Array. Swap two elements in a given indices
var numbersArray = [10, 12, 16]
func swapNumbersUsingIndex(_ array: inout [Int], i: Int, j: Int) {
  array.swapAt(i, j)
}
swapNumbersUsingIndex(&numbersArray, i: 0, j: 2)
print("numbersArray_swapNumbersUsingIndex: \(numbersArray)")

func swapNumbersUsingIndexGeneric<T>(_ array: inout [T], i: Int, j: Int) {
  array.swapAt(i, j)
}
swapNumbersUsingIndexGeneric(&numbersArray, i: 1, j: 2)
print("numbersArray_swapNumbersUsingIndexGeneric: \(numbersArray)")


// String
// Letters Unique - taking letter case into account
func challenge1(input: String) -> Bool {
  // Perfomance issue - O(n) - taking more time to execute
  /*var usedLetters = [Character]()
  for letter in input {
    if usedLetters.contains(letter) {
      return false
    }
    usedLetters.append(letter)
  }
  return true*/
  
  return Set(input).count == input.count
}
challenge1(input: "No duplicates") // true
challenge1(input: "abcdefghijklmnopqrstuvwxyz") // true
challenge1(input: "AaBbCc") // true
challenge1(input: "Hello, world") // false

// String Plaindrome - when reversed it reads same
func challenge2(input: String) -> Bool {
  let lowercase = input.lowercased()
  return lowercase.reversed() == Array(lowercase)
}
challenge2(input: "rotator") // true
challenge2(input: "Hello, world") // false

// Two Strings contains the same charaters
func challenge3(string1: String, string2: String) -> Bool {
  /*
  var checkString = string2
  for letter in string1 {
    if let index = checkString.firstIndex(of: letter) {
      checkString.remove(at: index)
    } else {
      return false
    }
  }
  return checkString.count == 0*/
  let array1 = Array(string1)
  let array2 = Array(string2)
  return array1.count == array2.count && array1.sorted() == array2.sorted()
}
challenge3(string1: "abca", string2: "abca") // true
challenge3(string1: "abc", string2: "cba") // true
challenge3(string1: "a1 b2", string2: "b1 a2") // true
challenge3(string1: "abc", string2: "abca") // false
challenge3(string1: "abc", string2: "Abc") // false
challenge3(string1: "abc", string2: "cbAa") // false

// Own .contains() method - Create extension of String
extension String {
  func fuzzyContains(_ input: String) -> Bool {
    return self.uppercased().range(of: input.uppercased()) != nil
  }
  
  func fuzzyContains2(_ input: String) -> Bool {
    return self.range(of: input, options: .caseInsensitive) != nil
  }
}
"Hello, world".fuzzyContains("Hello") // true
"Hello, world".fuzzyContains2("Hello") // true
"Hello, world".fuzzyContains("WORLD") // true
"Hello, world".fuzzyContains2("WORLD") // true
"Hello, world".fuzzyContains("Goodbye") // false
"Hello, world".fuzzyContains2("Goodbye") // false

// Count the characters - how many times a specific characters appears, taking case into account
func challenge5(input: String, char: Character) -> Int {
  /* Faster
  var letterCount = 0
  for letter in input {
    if letter == char {
      letterCount += 1
    }
  }
  return letterCount*/
  //
  // return input.filter { $0 == char }.count
  
  // Slower
  return input.reduce(0) { $1 == char ? $0 + 1 : $0 }
}
challenge5(input: "The rain in Spain", char: "a")
challenge5(input: "Mississippi", char: "i")
challenge5(input: "Hacking with Swift", char: "i")

// Remove Duplicates letters from String
func challenge6(input: String) -> String {
  var used = [Character]()
  for letter in input {
    if !used.contains(letter) {
      used.append(letter)
    }
  }
  return String(used)
}
challenge6(input: "wombat") // wombat
challenge6(input: "hello") // helo
challenge6(input: "Mississiippi") // Misp
 
// Condensed WhiteSpace
func challenge7(input: String) -> String {
  // return input.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
  /*var seenSpace = false
  var returnValue = ""
  
  for letter in input {
    if letter == " " {
      if seenSpace { continue }
      seenSpace = true
    } else {
      seenSpace = false
    }
    returnValue.append(letter)
  }
  return returnValue*/
  return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}
challenge7(input: "a   b   c") //a b c
challenge7(input: "    a") //[SPACE]a
challenge7(input: "abc") //abc


// If One string is rotation of the other, taking letter case into account
func challenge8(string1: String, string2: String) -> Bool {
  guard string1.count == string2.count else { return false }
  
  let combined = string1 + string1
  return combined.contains(string2)
}
challenge8(string1: "abcde", string2: "eabcd") // true
challenge8(string1: "abcde", string2: "cdeab") // true
challenge8(string1: "abcde", string2: "abced") // false
challenge8(string1: "abc", string2: "a") // false

// PANGRAMS - A string that contains every letter of the alphabets atleast once.
func challenge9(input: String) -> Bool {
  let set = Set(input.lowercased())
  // let letters = set.filter { ("a"..."z").contains($0) }
  let letters = set.filter { $0 >= "a" && $0 <= "z" }
  return letters.count == 26
}
challenge9(input: "The quick brown fox jumps over the lazy dog") // true
challenge9(input: "The quick brown fox jumped over the lazy dog") // false, s letter is missing

// Vowels & Consonent
func challenge10(input: String) -> (vowels: Int, consonants: Int) {
  let vowels = "aeiou"
  let consonents = "bcdfghjklmnpqrstvwxyz"
  
  var vowelCount = 0
  var consonentCount = 0
  
  for letter in input {
    if vowels.contains(letter) {
      vowelCount += 1
    } else if consonents.contains(letter) {
      consonentCount += 1
    }
  }
  
  return (vowelCount, consonentCount)
}
challenge10(input: "wombat") // (vowels: 2, consonent: 4)
challenge10(input: "hello") // (vowels: 2, consonent: 3)
challenge10(input: "Mississippi") // (vowels: 4, consonent: 6)
