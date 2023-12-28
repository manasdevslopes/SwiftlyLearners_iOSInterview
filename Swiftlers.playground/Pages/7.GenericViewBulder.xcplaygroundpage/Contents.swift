import SwiftUI

/* ******************************************************************************************************** */
// Generic
struct StringModel {
  let info: String?
  func removeInfo() -> StringModel {
    StringModel(info: nil)
  }
}
struct BoolModel {
  let info: Bool?
  func removeInfo() -> BoolModel {
    BoolModel(info: nil)
  }
}

// Both are same, so we can combine them with Generics
struct GenericModel<T> {
  let info: T?
  func removeInfo() -> GenericModel {
    GenericModel(info: nil)
  }
}
var info = GenericModel(info: "Hello World")
info.removeInfo()


struct GenericView<T: View>: View {
  let title: String
  let content: T
  
  var body: some View {
    HStack {
      Text(title)
      content
    }
  }
}
GenericView(title: "New View", content: Text("Hello, World!!"))


/* ******************************************************************************************************** */
// ViewBulder
struct GenericViewBuilder<T: View>: View {
  let title: String
  let content: T
  
  init(title: String, @ViewBuilder content: () -> T) {
    self.title = title
    self.content = content()
  }
  
  var body: some View {
    HStack {
      Text(title)
      content
    }
  }
}

GenericViewBuilder(title: "Hello") {
  VStack {
    Text("New World 1")
    Text("New World 2")
  }
}

GenericViewBuilder(title: "Hello") { }
