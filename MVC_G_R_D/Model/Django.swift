//
//  Django.swift
//  MVC_G_R_D
//
//  Created by 大容 林 on 2018/4/5.
//  Copyright © 2018年 DjangoCode. All rights reserved.
//

import Foundation

class Django : NSObject{
    var name : String
    var size : Double
    init(name: String , size : Double){
        self.name = name
        self.size = size
        super.init()
    }
    func observerMe(observerFunc : @escaping () -> Void)  {
        self.observe(\Django.name, options: []) { (django, chango) in
            observerFunc()
        }
    }
}

class ObserverManager : NSObject {
    var person = Django(name: "Django", size: 5566)
    func saodkaos(){
        person.observerMe {
            print("Change")
        }
    }
    
}


