//
//  MyView.swift
//  HelloTiaoZhuan
//
//  Created by nobe on 15/7/30.
//  Copyright (c) 2015年 nobe. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    @IBInspectable var borderWidth:CGFloat = 0
        {
        didSet
        {
            layer.borderWidth = borderWidth
            
        }
    }
    
    @IBInspectable var borderCorlor:UIColor = UIColor.clearColor()
        {
        didSet
        {
            layer.borderColor = borderCorlor.CGColor
            
        }
    }
    
    @IBInspectable var cornerRaius:CGFloat = 0
        {
        didSet
        {
            layer.cornerRadius = cornerRaius
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
