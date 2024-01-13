//
//  LocalNotificationManager.swift
//  SwiftlyLearners
//
//  Created by MANAS VIJAYWARGIYA on 13/01/24.
//

import Foundation
import NotificationCenter

@MainActor
class LocalNotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
  let notificationCenter = UNUserNotificationCenter.current()
  @Published var isGranted = false
  @Published var pendingRequests: [UNNotificationRequest] = []
  
  override init() {
    super.init()
    notificationCenter.delegate = self
  }
  
  // Delegate function
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
    await getPendingRequests()
    return [.sound, .banner]
  }
  
  
  func requestAuthorization() async throws {
    try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
    await getCurrentSettings()
  }
  
  func getCurrentSettings() async {
    let currentSettings = await notificationCenter.notificationSettings()
    isGranted = (currentSettings.authorizationStatus == .authorized)
    print("isGranted", isGranted)
  }
  
  func openSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
      if UIApplication.shared.canOpenURL(url) {
        Task {
          await UIApplication.shared.open(url)
        }
      }
    }
  }
  
  func schedule(localNotification: LocalNotification) async {
    print("localNotification----->", localNotification)
    let content = UNMutableNotificationContent()
    content.title = localNotification.title
    content.body = localNotification.body
    content.sound = .default
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: localNotification.timeInterval, repeats: localNotification.repeats)
    let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
    try? await notificationCenter.add(request)
    await getPendingRequests()
  }
  
  func getPendingRequests() async {
    pendingRequests = await notificationCenter.pendingNotificationRequests()
    print("Pending Requests Count : \(pendingRequests.count)")
  }
  
  func removeRequest(withIdentifier identifier: String) {
    notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    if let index = pendingRequests.firstIndex(where: {$0.identifier == identifier}) {
      pendingRequests.remove(at: index)
      print("Pending Requests Count : \(pendingRequests.count)")
    }
  }
  
  func clearRequests() {
    notificationCenter.removeAllPendingNotificationRequests()
    pendingRequests.removeAll()
    print("Pending Requests Count : \(pendingRequests.count)")
  }
}
