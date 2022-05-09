//
//  SecondViewController.swift
//  NC1
//
//  Created by Dylan Juliano Santoso on 27/04/22.
//

import UIKit
import UserNotifications

extension ViewController: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }

}

class ViewController: UIViewController {
    
    let shape = CAShapeLayer()
    var progress: Float = 0.0
    
    @IBOutlet weak var addButton: UIButton!
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserNotificationsCenter()
        
        //CIRCULAR PROGRESS BAR
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: (.pi * 3 / 2), clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 30
        shape.strokeColor = UIColor.yellow.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        // Do any additional setup after loading the view.
    }
    
    private func configureUserNotificationsCenter() {
            notificationCenter.delegate = self
    }
    
    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
            // Request Authorization
            notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
                if let error = error {
                    print("Request Authorization Failed (\(error), \(error.localizedDescription))")
                }
                completionHandler(success)
            }
        }

    private func scheduleNotification(){
        let content = UNMutableNotificationContent()
                content.title = "Drinq"
                content.body = "Excellent! You have added one more glass for today, you did a very great job! Stay Hydrated, Fellas 😉"
                content.sound = UNNotificationSound.default
                content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let identifier = "Local"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                notificationCenter.add(request) { (error) in
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
    }
    
    @IBAction func pressAdd(_ sender: Any) {
        
        //PROGRESS BAR
        progress += 1/8
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.toValue = progress
        animation.duration = 1 //progress bar' speed
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
        
        print("worked")
        
        if progress >= 1.0{
            addButton.isEnabled = false
            addButton.backgroundColor = UIColor .gray
        }
        
        notificationCenter.getNotificationSettings { (notificationSettings) in
                    switch notificationSettings.authorizationStatus {
                    case .notDetermined:
                        self.requestAuthorization(completionHandler: { (success) in
                            guard success else { return }
                            self.scheduleNotification()
                        })
                    case .authorized:
                        self.scheduleNotification()
                    case .denied:
                        print("The application not allowed to display notifications")
                    case .provisional:
                        print("The application authorized to post non-interruptive user notifications")
                    case .ephemeral:
                        print("The application is temporarily authorized to post notifications. Only available to app clips.")
                    @unknown default:
                        print("Application Not Allowed to Display Notifications")
                    }
                }
        }

}
