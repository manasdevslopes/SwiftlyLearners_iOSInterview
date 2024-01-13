import Foundation

/* ******************************************************************************************************** */
// Structs

struct Quiz {
  let title: String
  let dateCreated: Date
  let isPremium: Bool?
  
  // Structs have an implicit init (By Default)
//  init(title: String, dateCreated: Date) {
//    self.title = title
//    self.dateCreated = dateCreated
//  }
  
//  init(title: String, dateCreated: Date = .now) {
//    self.title = title
//    self.dateCreated = dateCreated
//  }
  
//  init(title: String, dateCreated: Date = .now, isPremium: Bool?) {
//    self.title = title
//    self.dateCreated = dateCreated
//    self.isPremium = isPremium
//  }
  init(title: String, dateCreated: Date?, isPremium: Bool?) {
    self.title = title
    self.dateCreated = dateCreated ?? .now
    self.isPremium = isPremium
  }
}

//let myQuiz: Quiz = Quiz(title: "Quiz 1", dateCeated: .now, isPremium: true)
//let myQuiz: Quiz = Quiz(title: "Quiz 1", dateCreated: .now)
//let myQuiz: Quiz = Quiz(title: "Quiz 1")
//let myQuiz: Quiz = Quiz(title: "Quiz 1", isPremium: nil)
let myQuiz: Quiz = Quiz(title: "Quiz 1", dateCreated: nil, isPremium: nil)

print(myQuiz.title)


/* ******************************************************************************************************** */
// immutable Struct = all "let" constants = NOT MUTABLE = "can't mutate it!"
struct UserModel {
  let name: String
  let isPremium: Bool
}
var user1: UserModel = UserModel(name: "Manas", isPremium: false)
func markUserAsPremium() {
  print(user1)
  user1 = UserModel(name: user1.name, isPremium: true)
  print(user1)
}
markUserAsPremium()


/* ******************************************************************************************************** */
// "Mutable Struct"
struct UserModel2 {
  let name: String
  var isPremium: Bool
}
var user2: UserModel2 = UserModel2(name: "Manas", isPremium: false)
func markUserAsPremium2() {
  print(user2)
  user2 = UserModel2(name: user2.name, isPremium: true)
  print(user2)
}
markUserAsPremium2()


/* ******************************************************************************************************** */
// "Immutable Struct"
struct UserModel3 {
  let name: String
  let isPremium: Bool
  
  // Here, creating a brand new Struct
  func markUserAsPremium(newValue: Bool) -> UserModel3 {
    return UserModel3(name: name, isPremium: newValue)
  }
}
var user3: UserModel3 = UserModel3(name: "Manas", isPremium: false)
user3 = user3.markUserAsPremium(newValue: true)



/* ******************************************************************************************************** */
// Preferrable way - Mutable struct
struct UserModel4 {
  let name: String
  private(set) var isPremium: Bool
  
  // Best way to update the same Struct
  mutating func markUserAsPremium(newValue: Bool) {
    isPremium = newValue
  }
  
  mutating func updateIsPremium() {
    isPremium = true
  }
}
var user4: UserModel4 = UserModel4(name: "Manas", isPremium: false)
print("User4----->", user4)
user4.markUserAsPremium(newValue: true)
print("User4----->", user4)
user4.updateIsPremium()
print("User4----->", user4)
// user4.isPremium = true // Can't access this property as this privately set.




/* ******************************************************************************************************** */
// Value Type Example
struct UserModel5 {
  let name: String
  var isPremium: Bool
}
var userA: UserModel5 = UserModel5(name: "Manas", isPremium: false)
print("UserA----->",userA)
var userB = userA
print("UserB----->",userB)
//userB = UserModel5(name: "Kanishk", isPremium: true)
userB.isPremium = true
print("UserA----->",userA)
print("UserB----->",userB)




/* ******************************************************************************************************** */
/* ******************************************************************************************************** */


/* ******************************************************************************************************** */
// Class

class ScreenViewModel {
  let title: String
  var showButton: Bool
  
  init(title: String, showButton: Bool) {
    self.title = title
    self.showButton = showButton
  }
  
  deinit {
    // run as theobject is being removed from memory
  }
}

/*
 Notice that we are using a "let", becoz: the object itself is not changing, the data inside the object is changing.
 */
let viewModel: ScreenViewModel = ScreenViewModel(title: "Screen 1", showButton: true)
viewModel.showButton = false

let viewModel1: ScreenViewModel = ScreenViewModel(title: "Screen 1", showButton: true)
print(viewModel1.showButton)
let viewModel2 = viewModel1
print(viewModel2.showButton)
viewModel1.showButton = false
print(viewModel1.showButton)
print(viewModel2.showButton)
 

/* ******************************************************************************************************** */
// To update property within the class

class ScreenViewmodel1 {
  let title: String
  private(set) var showButton: Bool
  
  init(title: String, showButton: Bool) {
    self.title = title
    self.showButton = showButton
  }
  
  deinit {
    // run as theobject is being removed from memory
  }
  
  func updateShowButton(newValue: Bool) {
    showButton = newValue
  }
  
  func hideButton() {
    showButton = false
  }
}

let viewModel3: ScreenViewmodel1 = ScreenViewmodel1(title: "Screen 1", showButton: true)
print("ViewModel3", viewModel3.showButton)
viewModel3.updateShowButton(newValue: false)
viewModel3.hideButton()
print(viewModel3.showButton)



/* ******************************************************************************************************** */
// Topics to be covered serial wise
// 8. GET / POST API Call with generic Method, Also create GIST on Github for Decode ANY Type.
// 10. Dependency Injection
// 12. Custom Sound with Local Notifications - 5
// 13. All Life Cycle Methods - 3
// 14. Swift Concurrency
// 15. Local Notifications - 4



/* ******************************************************************************************************** */
print("S1")
DispatchQueue.main.async {
  print("S2")
}
print("S3")
// O/p -> S1, S3, S2

/* ******************************************************************************************************** */
print("1")
DispatchQueue.main.async {
  print("2")
  DispatchQueue.main.async {
    print("3")
  }
  print("4")
}
print("5")
// O/p-> 1, 5, 2, 4, 3

/* ******************************************************************************************************** */
//DispatchQueue.main.async {
//  DispatchQueue.main.sync {
//    print("Print1")
//  }
//  print("Print2")
//}
// sync will block the main thread & we are creating deadlock scenario. Means Crash


/* ******************************************************************************************************** */
print("Print0")
DispatchQueue.main.async {
  print("Print1")
  DispatchQueue.global().sync {
    print("Print2")
  }
  print("Print3")
}
print("Print4")
// O/p -> 0, 4, 1, 2, 3


/* ******************************************************************************************************** */
print("S0")
DispatchQueue.global().sync {
  print("S1")
  DispatchQueue.global().sync {
    print("S2")
  }
  print("S3")
}
print("S4")
// O/p -> S0, S1, S2, S3, S4


/* ******************************************************************************************************** */
print("M0")
DispatchQueue.global().async {
  print("M1")
  DispatchQueue.global().async {
    print("M2")
  }
  print("M3")
}
print("M4")
// O/p -> 0, 4, 1, 3, 2

/* ******************************************************************************************************** */
print("K0")
DispatchQueue.global().async {
  print("K1")
  DispatchQueue.global().sync {
    print("K2")
  }
  print("K3")
}
print("K4")
// O/p -> 0, 4, 1, 2, 3


/* ******************************************************************************************************** */
print("C0")
DispatchQueue.global().sync {
  print("C1")
  DispatchQueue.global().async {
    print("C2")
  }
  print("C3")
}
print("C4")
// O/p -> 0, 1, 3, 4, 2


