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
