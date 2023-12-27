import Foundation

/* ******************************************************************************************************** */
// Map()
let numbers = [1,2,3,4,5]
let doubled = numbers.map { $0 * 2 }
doubled

/* ******************************************************************************************************** */
// CompactMap()
let compactNumbers = ["5","42", "nine", "100", "Bob"]
Int(compactNumbers[0])
let result = compactNumbers.compactMap { Int($0) }
result

/* ******************************************************************************************************** */
// FlatMap() (deconstructor for arrays...)
let codes = [["abc", "def", "ghi"], ["jkl", "mno", "pqr"]]
let newCodes = codes.flatMap { $0 }
newCodes
let anotherCodes = newCodes.flatMap { $0.map { $0.uppercased() } }
print("anotherCodes",anotherCodes)


/* ******************************************************************************************************** */
// Sort()
let array1 = [1, 5, 2, 10, 6, 2, 7, 4, 10, 15]
let newSortArray = array1.sorted()
newSortArray
let anotherDescSort = array1.sorted { $0 > $1 }
anotherDescSort
let anotherAscSort = array1.sorted { $0 < $1 }
anotherAscSort


/* ******************************************************************************************************** */
// filter()
let filterArr = [1, 5, 2, 10, 6, 2, 7, 4, 10, 15]
let newFilterArr = filterArr.filter{$0<6}.sorted()
newFilterArr
let anotherFilter = filterArr.filter{$0<6 && $0>4}
anotherFilter


/* ******************************************************************************************************** */
// Reduce()
let reduceArr = [1, 5, 2, 10, 6, 2, 7, 4, 10, 15]
//reduce(initialResult, (currentResult, currentElement) -> Return finalResult)
let newReduceArr = reduceArr.reduce(0, {$0 + $1})
newReduceArr
let anotherReduceArr = reduceArr.reduce(0) { result, num in
  result + num
}
anotherReduceArr
let reduceStringArr = ["1","2","3"]
let num = reduceStringArr.reduce(0, {$0 + (Int($1) ?? 0)})
num


/* ******************************************************************************************************** */
// Typealias
typealias studentName = String
let name: studentName = "Manas"
name



/* ******************************************************************************************************** */
// Loop in String
func countLettersInString(myString str: String) {
  for item in str {
    print(item)
  }
  print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello, World!!")
