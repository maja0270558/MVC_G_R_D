//
//  ViewController.swift
//  MVC_G_R_D
//
//  Created by 大容 林 on 2018/4/5.
//  Copyright © 2018年 DjangoCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var KVO: UIButton!
    @IBOutlet weak var Notification: UIButton!
    @IBOutlet weak var Delegate: UIButton!
    @IBOutlet weak var TargetAction: UIButton!
    var djangoPersons = Person(name: "Django", size: 287)
    var observers = [NSKeyValueObservation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

