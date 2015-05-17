//
//  ViewController.swift
//  Permanent Strorage
//
//  Created by Siddharth Bhatt on 27/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //normal string
        NSUserDefaults.standardUserDefaults().setObject("Sid", forKey: "Name")
        var obj = NSUserDefaults.standardUserDefaults().objectForKey("Name")! as! String
        println(obj)
        
        //array
        var arr = [1,2,3,4]
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "Array")
        var newArr = NSUserDefaults.standardUserDefaults().objectForKey("Array") as! NSArray
        println(newArr[1])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

