//
//  MyUIViewController.swift
//  HelloTiaoZhuan
//
//  Created by nobe on 15/7/29.
//  Copyright (c) 2015年 nobe. All rights reserved.
//

import UIKit

class MyUIViewController: UIViewController {

    
    @IBAction func subtract(sender: AnyObject)
    {
        UI!.setProgressValues(UI!.getProgressValues()-0.1)
    }
    @IBAction func add(sender: AnyObject)
    {
         UI!.setProgressValues(UI!.getProgressValues()+0.1)
    }
    @IBAction func btn_back(sender: AnyObject)
    {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var cg = CGRect(x: 100, y: 100, width: 100, height: 100)

        UI = MyUIView(frame:cg)
        
       
        
        
        self.view.addSubview(UI!)
        
        
        // Do any additional setup after loading the view.
    }

    var UI:MyUIView?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
