//
//  ViewController.swift
//  Prime or Not
//
//  Created by Siddharth Bhatt on 20/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    
    @IBAction func doAction(sender: AnyObject) {
        if inputNumber.text.isEmpty {
            feedbackLabel.text = "Please enter a valid number"
        }else{
            
            if primeOrNot(Double(inputNumber.text.toInt()!)){
                //Prime
                feedbackLabel.text = " \(inputNumber.text) is a prime number"
            }else{
                //Not Prime
                feedbackLabel.text = " \(inputNumber.text) is NOT a prime number"
            }
            
        }
    }
    
    
    func primeOrNot(number: Double) ->Bool {
        
        var primeOrNot:Bool = true
        
        for var i:Double = 2; i < number; i++ {
            if number % i == 0.0 {
                primeOrNot = false
            }
        }
        
        return primeOrNot
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

