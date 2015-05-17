//
//  ViewController.swift
//  trial
//
//  Created by Siddharth Bhatt on 18/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBAction func NameButton(sender: AnyObject) {
        NameLabel.text = "Hello \(NameField.text)!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //println("Hello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

