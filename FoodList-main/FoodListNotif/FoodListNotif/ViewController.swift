//
//  ViewController.swift
//  FoodListNotif
//
//  Created by Dylan Juliano Santoso on 13/04/22.
//

import UIKit
import UserNotifications

    extension ViewController: UNUserNotificationCenterDelegate {

        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.alert])
        }

    }

    class ViewController: UIViewController {
        
        struct Notification {
            struct Category {
                static let tutorial = "tutorial"
            }
            
            struct Action {
                static let readLater = "readLater"
                static let showDetails = "showDetails"
                static let unsubscribe = "unsubscribe"
            }
        }
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        private func configureUserNotificationsCenter(){

            notificationCenter.delegate = self
            
            //Actions
            let actionReadLater = UNNotificationAction(identifier: Notification.Action.readLater, title: "Read Later", options: [])
            
            let actionShowDetails = UNNotificationAction(identifier: Notification.Action.showDetails, title: "Show Details", options: [.foreground])
            
            let actionUnsubscribe = UNNotificationAction(identifier: Notification.Action.unsubscribe, title: "Unsubscribe", options: [.destructive, .authenticationRequired])
            
            // Define Category
            let tutorialCategory = UNNotificationCategory(identifier: Notification.Category.tutorial, actions: [actionReadLater, actionShowDetails, actionUnsubscribe], intentIdentifiers: [], options: [])
            
            // Register Category
            UNUserNotificationCenter.current().setNotificationCategories([tutorialCategory])
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUserNotificationsCenter()
    }
    
    //NotificationService.sharedInstance.authorizeNotification()
    
    private func requestAuthorization(completionHandler: @escaping(_ success: Bool) -> ()){
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            if let error = error{
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }
            completionHandler(success)
        }
    }
        
    private func scheduleNotification(notificationType: String){
        
        self.scheduleNotification(notificationType: "Local")
        
        if notificationType == "Local" {
            let content = UNMutableNotificationContent()
                    content.title = "Foodlist"
                    content.body = "This is example how to create Local Notifications"
                    content.sound = UNNotificationSound.default
                    content.badge = 1
            
            content.categoryIdentifier = Notification.Category.tutorial
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            
            let identifier = "Local"
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    notificationCenter.add(request) { (error) in
                        if let error = error {
                            print("Error \(error.localizedDescription)")
                        }
                    }
            
        } else if notificationType == "Schedule" {
            // date variable indicate 5 seconds from current date and time
            let content = UNMutableNotificationContent()
                    content.title = "Foodlist"
                    content.body = "This is example how to create Local Notifications"
                    content.sound = UNNotificationSound.default
                    content.badge = 1
            
            content.categoryIdentifier = Notification.Category.tutorial
            
            // date variable indicate 5 seconds from current date and time
            let date = Date(timeIntervalSinceNow: 5)
            let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
            let identifier = "Local"
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    notificationCenter.add(request) { (error) in
                        if let error = error {
                            print("Error \(error.localizedDescription)")
                        }
                    }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
            switch response.actionIdentifier {
            case Notification.Action.readLater:
                print("Save Tutorial For Later")
            case Notification.Action.unsubscribe:
                print("Unsubscribe Reader")
            default:
                print("Show Details")
            }
            
            completionHandler()
        }
    

    
    @IBAction func triggerNotification(sender: Any  ){
        let content = UNMutableNotificationContent()
                content.title = "Foodlist"
                content.body = "The notification was successfully set up!"
                content.sound = UNNotificationSound.default
                content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let identifier = "Foodlist"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
    }
    
}
