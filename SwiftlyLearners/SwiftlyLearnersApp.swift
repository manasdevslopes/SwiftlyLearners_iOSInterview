//
//  SwiftlyLearnersApp.swift
//  SwiftlyLearners
//
//  Created by MANAS VIJAYWARGIYA on 27/12/23.
//

import SwiftUI

@main
struct SwiftlyLearnersApp: App {
  @State private var showSplash: Bool = true
  
  @StateObject var lnManager = LocalNotificationManager()
  
  var body: some Scene {
    WindowGroup {
      // ContentView()
      ZStack {
        NotificationListView().environmentObject(lnManager)
        
        if showSplash {
          AppleIcon()
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
          withAnimation() {
            self.showSplash = false
          }
        }
      }
    }
  }
}
