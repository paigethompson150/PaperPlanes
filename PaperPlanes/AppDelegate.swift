//
//  AppDelegate.swift
//  PaperPlanes
//
//  Created by Paige Thompson on 1/23/24.
//
import SwiftUI
import FirebaseCore
import UserNotifications
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      // Pass device token to auth
      Auth.auth().setAPNSToken(deviceToken, type: .prod)

      // Further handling of the device token if needed by the app
      // ...
    }
    
    func application(_ application: UIApplication,
        didReceiveRemoteNotification notification: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      if Auth.auth().canHandleNotification(notification) {
        completionHandler(.noData)
        return
      }
      // This notification is not auth related; it should be handled separately.
    }
    
    func application(_ application: UIApplication, open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      if Auth.auth().canHandle(url) {
        return true
      }
      // URL not auth related; it should be handled separately.
     return false
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
      for urlContext in URLContexts {
          let url = urlContext.url
          Auth.auth().canHandle(url)
      }
      // URL not auth related; it should be handled separately.
    }
    
    

}
