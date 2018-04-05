//
//  Django.swift
//  MVC_G_R_D
//
//  Created by 大容 林 on 2018/4/5.
//  Copyright © 2018年 DjangoCode. All rights reserved.
//

import Foundation

class Person : NSObject{
   @objc dynamic var name : String
   @objc dynamic var size : Double
    init(name: String , size : Double){
        self.name = name
        self.size = size
        super.init()
    }
}

