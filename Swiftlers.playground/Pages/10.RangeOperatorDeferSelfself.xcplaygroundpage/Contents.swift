import Foundation

/* ******************************************************************************************************** */
// Range Operator
// Closed Range -> 0...10
// Half Range -> 0..<10
// One Side Range -> Fruits[..2] or Fruits[2..]

/* ******************************************************************************************************** */
// Defer
func deferExample() {
  defer { print("This is deferred!") }
  print("I came first!")
}
deferExample()

/* ******************************************************************************************************** */
// Self vs self
extension BinaryInteger {
  func squared() -> Self {
    return self * self
  }
}
print(2.squared())
