//
//  ViewController.swift
//  Cat Years
//
//  Created by Siddharth Bhatt on 18/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cyField: UITextField!
    
    @IBAction func findAge(sender: AnyObject) {
        if cyField.text.toInt() != nil {
            resultLabel.text = "Your cat is actually \(cyField.text.toInt()! * 7) years old"
        }else{
            resultLabel.text = "Please enter a valid number"
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

