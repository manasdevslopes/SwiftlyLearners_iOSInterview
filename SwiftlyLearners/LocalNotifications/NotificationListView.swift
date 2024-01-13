//
//  AppEntry.swift
//  SwiftlyLearners
//
//  Created by MANAS VIJAYWARGIYA on 13/01/24.
//

import SwiftUI

struct NotificationListView: View {
  @EnvironmentObject var lnManager: LocalNotificationManager
  @Environment(\.scenePhase) var scenePhase
  
    var body: some View {
      NavigationStack {
        VStack {
          if lnManager.isGranted {
            GroupBox("Schedule") {
              Button("Interval Notification") {
                Task {
                  let localNotification = LocalNotification(identifier: UUID().uuidString,
                                                            title: "Some Title",
                                                            body: "Some Body",
                                                            timeInterval: 60, repeats: true)
                  await lnManager.schedule(localNotification: localNotification)
                }
              }.buttonStyle(.bordered)
              Button("Calendar Notification") {
                
              }.buttonStyle(.bordered)
            }
            .frame(width: 300)
            // List of Pending Notifications Requests
            List {
              ForEach(lnManager.pendingRequests, id: \.identifier) { request in
                VStack(alignment: .leading) {
                  Text(request.content.title)
                  HStack {
                    Spacer()
                    Text(request.identifier).font(.caption).foregroundColor(.secondary)
                  }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                  Button("Delete", role: .destructive) {
                    lnManager.removeRequest(withIdentifier: request.identifier)
                  }
                }
              }
            }
          } else {
            Button("Enable Notifications") {
              lnManager.openSettings()
            }.buttonStyle(.borderedProminent)
          }
          
        }
        .navigationTitle("Local Notifications")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              lnManager.clearRequests()
            } label: {
              Image(systemName: "clear.fill").imageScale(.large)
            }
          }
        }
      }
      .navigationViewStyle(.stack)
      .task {
        try? await lnManager.requestAuthorization()
      }
      .onChange(of: scenePhase) { newValue in
        if newValue == .active {
          Task {
            await lnManager.getCurrentSettings()
            await lnManager.getPendingRequests()
          }
        }
      }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
      NotificationListView().environmentObject(LocalNotificationManager())
    }
}
