//
//  ViewController.swift
//  MVC_G_R_D
//
//  Created by 大容 林 on 2018/4/5.
//  Copyright © 2018年 DjangoCode. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBAction func notificationAction(_ sender: Any)
    {
        // Notification 2. Content
        let content = UNMutableNotificationContent()
        content.title = "This is titleeeeee"
        content.subtitle = "This is subTitleeeeee"
        content.body = "This is bodyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
        content.badge = 1
        
        // Notification 3. Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // Notification 4. Schedule
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
    }
    
    
    @IBOutlet weak var KVO: UIButton!
    @IBOutlet weak var Notification: UIButton!
    @IBOutlet weak var Delegate: UIButton!
    @IBOutlet weak var TargetAction: UIButton!
    var djangoPersons = Person(name: "Django", size: 287)
    var observers = [NSKeyValueObservation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification 1. Register
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        { (didAllow, error) in
            
        }
        
        
        
        addObservers()
    }
    func addObservers(){
        observers = [
            djangoPersons.observe(\Person.name, options: [.prior], changeHandler: { (person, change) in
                print("----------")
                print(person.name)
                print(change.isPrior)
                print(change.newValue)
                print(change.oldValue)
                print("----------")
            })
        ]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func KVOButton(_ sender: Any) {
        djangoPersons.name = "Change"
//        observers.map{$0.invalidate()}
    }
    @IBAction func NotificationButton(_ sender: Any) {
    }
    @IBAction func DelegateButton(_ sender: Any) {
    }
    @IBAction func TargetActionButton(_ sender: Any) {
    }
    
}

