//
//  MyUIView.swift
//  HelloTiaoZhuan
//
//  Created by nobe on 15/7/29.
//  Copyright (c) 2015年 nobe. All rights reserved.
//

import UIKit

class MyUIView: UIView {
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    
    
    private var _prgressValues:CGFloat = 0
    
    internal func getProgressValues()->CGFloat
    {
        return _prgressValues
    }
    
    internal func setProgressValues(value:CGFloat)
    {
        _prgressValues = value
        setNeedsDisplay()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0)
    }

     required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }


    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        // 绘制 直线
//        var context = UIGraphicsGetCurrentContext()
//        
//        CGContextMoveToPoint(context, 20, 100)
//        CGContextAddLineToPoint(context, 20, 200)
//        CGContextAddLineToPoint(context, 200, 200)
//        
//        
//        CGContextMoveToPoint(context, 20, 210)
//        CGContextAddLineToPoint(context, 20, 400)
//        CGContextAddLineToPoint(context, 200, 400)
//        
//        CGContextStrokePath(context)
        
        
        var ctx = UIGraphicsGetCurrentContext()
        var r:CGFloat = 100.0/2
        println("半径是多少 \(r)")
        
        CGContextAddArc(ctx, r, r, r, 0, 3.141592653*2, 0)

        CGContextAddLineToPoint(ctx, r, r)
        CGContextSetRGBFillColor(ctx, 0, 1, 1, 1)
        CGContextFillPath(ctx)
        
        CGContextAddArc(ctx, r, r, r, 0, 3.141592653*2*_prgressValues, 0)
        CGContextAddLineToPoint(ctx, r, r)
        CGContextSetRGBFillColor(ctx, 0, 0, 1, 1)
        CGContextFillPath(ctx) 
        
        
    }
    
    
}
