import Foundation

/* ******************************************************************************************************** */
// Extensions

extension Double {
  var mm: Double { self / 1000.0 }
}

let oneInch: Double = 25.4.mm
print(oneInch)

