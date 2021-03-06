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
    
    
    @IBOutlet weak var targetActionOutlet: UIButton!
    
    
    
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
        
        
        targetActionOutlet.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    func addObservers(){
        observers = [
            djangoPersons.observe(\Person.name, options: [.prior], changeHandler: { (person, change) in
                if change.isPrior {
                    self.allert(title: "KVO" ,message:  "--------\n name: \(person.name)\n isprior: \(change.isPrior)\n new: \(change.newValue)\n old: \(change.oldValue)\n---------")
                }
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
        self.performSegue(withIdentifier: "delegate", sender: self)
    }
    
    @objc func handleRegister()
    {
        let alertController = UIAlertController(
            title: "提示",
            message: "一個簡單提示，請按確認繼續",
            preferredStyle: .alert)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                print("按下確認後，閉包裡的動作")
        })
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
    }
    
//    @IBAction func TargetActionButton(_ sender: Any) {
//        let alertController = UIAlertController(
//            title: "提示",
//            message: "一個簡單提示，請按確認繼續",
//            preferredStyle: .alert)
//        
//        // 建立[確認]按鈕
//        let okAction = UIAlertAction(
//            title: "確認",
//            style: .default,
//            handler: {
//                (action: UIAlertAction!) -> Void in
//                print("按下確認後，閉包裡的動作")
//        })
//        alertController.addAction(okAction)
//        
//        // 顯示提示框
//        self.present(
//            alertController,
//            animated: true,
//            completion: nil)
//    }
    
    
    
}


extension ViewController: GameDelegate {
    
    func Game(name: String) {
        self.allert(title: "Grace wants to play \n \(name)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DelegateViewController{
            destination.delegate = self
        }
    }
}
extension ViewController {
    func allert(title:String = "" , message : String? = nil){
        let resultAlert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "ok", style: .default, handler: nil)
        resultAlert.addAction(okAlert)
        self.present(resultAlert, animated: true, completion: nil)
    }
}
