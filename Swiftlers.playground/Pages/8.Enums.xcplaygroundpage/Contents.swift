import Foundation

/* ******************************************************************************************************** */
// Enums - with String, CaseIterable
enum Foo: String, CaseIterable {
  case BING = "bing"
  case BANG = "bang"
  case BOOM = "boom"
}
print(Foo.BING)
print(Foo.BING.rawValue)

var stringValues: [String] = []
Foo.allCases.forEach { fooValue in
  stringValues.append(fooValue.rawValue)
}
print(stringValues)


// Enums - Associated values
enum Car: CaseIterable {
  case ford, toyota, jaguar, bmw
  case porsche(convertible: Bool)
  
  static var allCases: [Car] {
    return [.ford, .toyota, .jaguar, .bmw, .porsche(convertible: false), .porsche(convertible: true), .bmw]
  }
}

for car in Car.allCases {
  print("My favorite Car is \(car).")
}



enum MercedesModelPrice {
  case MayBach(price: Int)
  case AMG_GT(price: Int)
  case Metris(price: Int)
  case SprinterWagon(price: Int)
  case GClass
  
  var name: String {
    switch self {
      case .MayBach:
        return "MayBach"
      case .AMG_GT:
        return "AMG GT"
      case .Metris:
        return "Metrics"
      case .SprinterWagon:
        return "Sprinter Wagon"
      case .GClass:
        return "G Class"
    }
  }
}

func getMercedesPrice(for mercedesModel: MercedesModelPrice) {
  switch mercedesModel {
    case .MayBach(price: let price) where price >= 100_000:
      print("You just bought yourself a new car: \(mercedesModel.name)")
      
    case .Metris(price: let price) where price >= 86_000:
      print("You just bought yourself a new car: \(mercedesModel.name)")
      
    case .AMG_GT(price: let price)  where price >= 74_000:
      print("You just bought yourself a new car: \(mercedesModel.name)")
      
    case .SprinterWagon(price: let price) where price >= 45_000:
      print("You just bought yourself a new car: \(mercedesModel.name)")
      
    case .GClass, .SprinterWagon, .Metris, .AMG_GT, .MayBach:
      print("Insufficient funds. You cant' afford this \(mercedesModel.name) car at the moment")

  }
}

getMercedesPrice(for: .SprinterWagon(price: 200_000))


enum Weekday {
  case Monday
  case Tuesday
  case Wednesday
  case Thursday
  case Friday
  case Saturday
  case Sunday
  
  func dayType() -> String {
    self == .Saturday || self == .Sunday ? "Weekend" : "Weekday"
  }
}
Weekday.Monday.dayType()
Weekday.Sunday.dayType()
