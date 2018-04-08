//
//  DelegateViewController.swift
//  MVC_G_R_D
//
//  Created by 尚靖 on 2018/4/8.
//  Copyright © 2018年 DjangoCode. All rights reserved.
//

import Foundation
import UIKit


protocol GameDelegate: class {
    func Game(name: String)
}

class DelegateViewController: UIViewController {

    weak var delegate: GameDelegate?
    
    var streetName = "Street Fighter!!!"
    var marioName = "Mario Kart!!!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func StreetFighterButton(_ sender: Any) {
        
        dismiss(animated: true) {
            self.delegate?.Game(name: self.streetName)
        }
    }
    
    @IBAction func MarioKartButton(_ sender: Any) {
        
        dismiss(animated: true) {
            self.delegate?.Game(name: self.marioName)
        }

    }
    
    
    
    
}



