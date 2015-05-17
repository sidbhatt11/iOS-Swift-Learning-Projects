//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Siddharth Bhatt on 16/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://siddharthbhatt.com/")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data,response,error) in
            if error == nil {
                var dataContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                //println(dataContent!)
                dispatch_async(dispatch_get_main_queue()){
                    self.webView.loadHTMLString(dataContent! as String, baseURL: nil)
                }
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

