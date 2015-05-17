//
//  SecondViewController.swift
//  To Do List
//
//  Created by Siddharth Bhatt on 16/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var listItem: UITextField!
    
    @IBAction func addToList(sender: AnyObject) {
        toDoList.append(listItem.text)
        listItem.text = ""
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.listItem.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.listItem.endEditing(true)
    }
    
    func textFieldShouldReturn(textfield: UITextField) -> Bool {
        listItem.resignFirstResponder()
        return true
    }


}

