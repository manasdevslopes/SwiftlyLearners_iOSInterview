//
//  AppStorageUserDefaults.swift
//  SwiftlyLearners
//
//  Created by MANAS VIJAYWARGIYA on 13/01/24.
//

import SwiftUI

struct AppStorageUserDefaults: View {
  @AppStorage("username") var username: String = "Guests"
  @State private var newUsername: String = ""
  @State private var hasCommittedChange: Bool = false
  @State private var counter: Int = UserDefaults.standard.integer(forKey: "counter")
  
  var body: some View {
    VStack {
      Text("Hello, \(username)!").padding()
      
      TextField("Enter new username", text: $newUsername, onCommit: {
        // Update @AppStorage whenever the value of newUsername changes
        username = newUsername
        
        // Set the flag to clear the TextField state
        hasCommittedChange = true
      })
      .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
      
      Stepper("Counter: \(counter)", value: $counter).padding()
        .onChange(of: counter) { newValue in
          // Update UserDefaults whenever the value of counter changes
          UserDefaults.standard.set(newValue, forKey: "counter")
        }
    }
    .onChange(of: hasCommittedChange) { _ in
      // Clear the TextField state when the user has committed the change
      newUsername = ""
      hasCommittedChange = false
    }
  }
}

struct AppStorageUserDefaults_Previews: PreviewProvider {
  static var previews: some View {
    AppStorageUserDefaults()
  }
}
