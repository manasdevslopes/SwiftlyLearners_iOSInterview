//
//  SwiftlyLearnersApp.swift
//  SwiftlyLearners
//
//  Created by MANAS VIJAYWARGIYA on 27/12/23.
//

import SwiftUI

@main
struct SwiftlyLearnersApp: App {
  @StateObject var lnManager = LocalNotificationManager()
  
  var body: some Scene {
    WindowGroup {
      // ContentView()
      NotificationListView().environmentObject(lnManager)
    }
  }
}
