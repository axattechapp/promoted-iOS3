//
//  AppDelegate.swift
//  promoted
//
//  Created by Vikram Sindhu on 09/12/22.
//

import UIKit
import Stripe
import Firebase
import UserNotifications
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    
    var deviceID:String = ""
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        Thread.sleep(forTimeInterval: 3)
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        if launchOptions?[.remoteNotification] is [String: AnyObject] {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        Stripe.setDefaultPublishableKey("pk_test_51NTd3iITWaZZkoW09FzxN8NeNKMmQqB6g8gDDg6PTCGaeOW7mntkTAxzYq2TgUEyK3e9nF270Ayh6bjP2Symo0ag00kG53HF9M")
        
        FirebaseApp.configure()
        let defaults = UserDefaults.standard
        let device_id = UIDevice.current.identifierForVendor!.uuidString
        deviceID = device_id
        
        defaults.setValue(deviceID, forKey: "DeviceId")
        defaults.synchronize()
        Messaging.messaging().delegate = self
        
        return true
    }
    
}
    
    // Push Notificaion
    
extension AppDelegate:MessagingDelegate {
        func registerForPushNotifications() {
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) {
                    [weak self] granted, error in
                    print("Permission granted: \(granted)")
                    guard granted else { return }
                    self?.getNotificationSettings()
                }
        }
        
        func getNotificationSettings() {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                print("Notification settings: \(settings)")
                guard settings.authorizationStatus == .authorized else { return }
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        func application(
            _ application: UIApplication,
            didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("Failed to register: \(error)")
        }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
            print("Firebase registration token: \(fcmToken!)")
            let defaults = UserDefaults.standard
            defaults.set(fcmToken, forKey: "DeviceToken")
            defaults.setValue(fcmToken, forKey: "deviceToken")
            defaults.synchronize()
        }
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
            let token = tokenParts.joined()
            print("Device Token: \(token)")
            Messaging.messaging().apnsToken = deviceToken
            print("deviceToken: \(deviceToken)")
        }
        func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
        {
         
            UIApplication.shared.applicationIconBadgeNumber = 0
            let userinfo = response.notification.request.content.userInfo
            print(userinfo)
            if userinfo["google.c.fid"] is String {
                do {
                    print (response.notification.request.content.userInfo)
                    print(response.notification.request.content.title)
                    
//                    NotificationCenter.default.post(name: Notification.Name("MeetDetails"), object: nil, userInfo: userinfo)
//
//                    if  let conversationVC = storyboard.instantiateViewController(withIdentifier: "MeetDetailsVC") as? MeetDetailsVC {
//
//                        conversationVC.meetID = (userinfo["meet_id"] as? String)!
//                        self.window?.rootViewController = conversationVC
//
//                    }
                    
                    if let notificationID =  userinfo["interview_id"] as? String{
                        UserDefaults.standard.set(Int(notificationID), forKey: "interview_id")
                        let notificationType =  userinfo["type"] as? String
                        UserDefaults.standard.set(notificationType, forKey: "notificationType")
                        UserDefaults.standard.synchronize()
                    }
                    
                    
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        func application(_ application: UIApplication,
                         didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                         fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            Messaging.messaging().appDidReceiveMessage(userInfo)
            print(userInfo)
            completionHandler(.noData)
        }
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            print("Application go to inbox page")
        }

}

