//
//  ViewController.swift
//  NotificationsUI
//
//  Created by Chacha on 08/01/17.
//  Copyright © 2017 Chacha. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
            if !accepted {
                print("Notification access denied.")
            }
            
        }
        return true
    }
    
    func scheduleNotification(at date: Date) {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = "Tutorial Reminder"
        content.body = "Just a reminder to read your tutorial over at appcoda.com!"
        content.sound = UNNotificationSound.default()
        
        // identifier: This is a unique identifier for our request. As you’ll see shortly, this identifier can be used to cancel notification requests.
        // content: This is the notification content we created earlier.
        // trigger: This is the trigger we would like to use to trigger our notification. When the conditions of the trigger are met, iOS will display the notification.
        let request = UNNotificationRequest(identifier: "textNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
        
    }

}
