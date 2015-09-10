//
//  User.swift
//  HelloTiaoZhuan
//
//  Created by nobe on 15/8/12.
//  Copyright (c) 2015年 nobe. All rights reserved.
//

import UIKit

class User: NSObject {
    
    
    var code:AnyObject!
    var msg:AnyObject!
    
    override init() {
        super.init()
    }
    
    init(code:AnyObject,msg:AnyObject) {
        super.init()
        self.code = code
        self.msg = msg
    
    }
    
}
