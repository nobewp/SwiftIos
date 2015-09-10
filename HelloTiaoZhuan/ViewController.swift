//
//  ViewController.swift
//  HelloTiaoZhuan
//
//  Created by nobe on 15/7/28.
//  Copyright (c) 2015年 nobe. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var input_password: UITextField!
    @IBOutlet weak var input_name: UITextField!
    @IBAction func btn_register(sender: AnyObject)
    {
        alert("点了一下注册 结果没反应")
        
        //        Connection ()
        //        AsynConnection ()
        //        PostAsynConnection ()
        test ()
    }
    
    
    func Connection ()
    {
        var  resp:NSURLResponse?
        var error:NSError?
        var datas = NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: NSURL(string: "http://jikexueyuan.com")!), returningResponse: &resp, error: &error)
        
        if let r = resp
        {
            println("相应头文件 \(r)")
        }
        if let d = datas
        {
            
            //            println("返回的数据\( NSString(data: d, encoding: NSUTF8StringEncoding) )")
        }
        if let er=error
        {
            println("请求错误 \(er)")
        }
    }
    
    
    func test ()
    {
        
        var url = "http://apis.baidu.com/dajuncloud/goddess/goddesses"
        var httpArg = "tuid=0"
        request(url, httpArg: httpArg)
    }
    
    func  request(httpUrl: String, httpArg: String) {
        var req = NSMutableURLRequest(URL: NSURL(string: httpUrl + "?" + httpArg)!)
        req.timeoutInterval = 6
        req.HTTPMethod = "GET"
        req.addValue("3bd0491ac47dcf9805c0cf8205149cde", forHTTPHeaderField: "apikey")
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) -> Void in
            let res = response as! NSHTTPURLResponse
            println(res.statusCode)
            if let e = error{
                println("请求失败")
            }
            if let d = data {
                var content = NSString(data: d, encoding: NSUTF8StringEncoding)
                println(content)
            }
        }
    }
    // 异步请求
    func AsynConnection ()
    {
        
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "http://jikexueyuan.com")!), queue: NSOperationQueue()) { (resp:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            
            if let      er = error
            {
                println("错误信息 \(er) ")
            }
            else
            {
                println("返回数据 \(NSString(data: data, encoding: NSUTF8StringEncoding)))")
            }
            
        }
        
    }
    
    func PostAsynConnection ()
    {
        var url = "http://test.api.app.club.xywy.com/app/1.1/club/doctorApp.interface.php?command=info"
        var userid = "18732252"
        var status = "get"
        var keycode = userid+status+"9ab41cc1bbef27fa4b5b7d4cbe17a75a"
        
        println("加密字符串+\(keycode) ... \(keycode.md5)")
        let req = NSMutableURLRequest(URL: NSURL(string: url)!)
        req.HTTPMethod = "POST"
        //        req.HTTPBody = NSString(string: "command=info").dataUsingEncoding(NSUTF8StringEncoding)
        
        req.HTTPBody = NSString(string: "status=\(status)& userid=\(userid)& sign=\(keycode.md5)").dataUsingEncoding(NSUTF8StringEncoding)
        
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue() ) { (resp:NSURLResponse! , datas:NSData!, error:NSError!) -> Void in
            
            if let es2 = error
            {
                println("出错了")
            }
            else
            {
                println(NSString(data: datas, encoding:  NSStringEncoding()))
                
                let values:AnyObject! = NSJSONSerialization.JSONObjectWithData(datas, options: NSJSONReadingOptions.AllowFragments, error: nil)
                
                println(values)
                let code:AnyObject = values.objectForKey("code")!
                let msg:AnyObject = values.objectForKey("msg")!
                
                
                var ss = User(code: code,msg: msg)
                var s2 = User()
                //                s2.code = values.objectForKey("code")!
                s2.setValue(values.objectForKey("code")!, forKey: "code")
                println(s2.code)
                println(ss.code)
                println(code)
                println(msg)
                
            }
            
        }
        
    }
    func ss ()
    {
        //        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "HTTP://JIKEXUEYUAN.COM")!), queue: NSOperationQueue()) { (resq:NSURLResponse, datas:NSData!, errror:NSError!) -> Void in
        //
        //            if let es1 = error
        //            {
        //                println("发生了错误")
        //            }
        //            else
        //            {
        //                println(NSString(data: datas, encoding: NSUTF8StringEncoding))
        //            }
        //
        //            //发送到主线程
        //
        //            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
        //
        //                println("到主线程了")
        //            })
        //        }
    }
    
    @IBAction func NextViewOnClick(sender: AnyObject)
    {
        
        let vc = MyViewController (nibName: "MyViewController", bundle: nil )
        vc.namelabcontent=input_name.text
        vc.passwordlabcontent=input_password.text
        
        if input_name.text == ""
        {
            //            var alert = UIAlertView()
            //            alert.title="提示"
            //            alert.message="用户名不能为空"
            //            alert.addButtonWithTitle("确定")
            //            // alert.addButtonWithTitle("取消")
            //            // alert.cancelButtonIndex
            //            alert.show()
            alert("用户名不能为空")
        }
        else  if input_password.text == ""
        {
            alert("密码不能为空")
        }
        else
        {
            //直接访问网络返回数据 NSString
            //            var str = NSString(contentsOfURL: NSURL(string:"http:jikexueyuan.com")!, encoding: NSUTF8StringEncoding, error: nil)
            //            println(str)
            //
            //            var data = NSData(contentsOfURL: NSURL(string: "http:jikexueyuan.com")!)
            //
            //            println(data)
            
            
            self.presentViewController(vc, animated: true, completion:nil)
            
        }
        
    }
    
    var prentContent = ""
    func alert(name:String)
    {
        var alert = UIAlertView()
        alert.title="提示"
        alert.message=name
        alert.addButtonWithTitle("确定")
        // alert.addButtonWithTitle("取消")
        // alert.cancelButtonIndex
        alert.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sss
        println("打印 \(prentContent)");
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

