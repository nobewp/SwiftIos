//
//  MyViewController.swift
//  HelloTiaoZhuan
//
//  Created by nobe on 15/7/28.
//  Copyright (c) 2015年 nobe. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    
    var namelabcontent:String = ""
    
    var passwordlabcontent:String = ""
    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBAction func backOnclik(sender: AnyObject)
    {
        
        //        var prentcontorller = self.presentViewController(vc, animated: true, nil)
//       var vc = self.presentationController
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    convenience init()
    {
        var nibNameOrNil = String?("MyViewController")
        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "xib") == nil
        {
            nibNameOrNil = nil
        }
        self.init(nibName: nibNameOrNil, bundle: nil)
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "用户名: \(namelabcontent) : 密码: \(passwordlabcontent)"
        
        // Do any additional setup after loading the view.
    }
    
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
