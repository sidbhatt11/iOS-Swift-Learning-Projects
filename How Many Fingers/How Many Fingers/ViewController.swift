//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Siddharth Bhatt on 20/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let a = arc4random_uniform(6).toIntMax()
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBAction func performAction(sender: AnyObject) {
        
        //if the textField is empty, we flash a message otherwise proceed.
        if !inputNumber.text.isEmpty {
            
            
            if inputNumber.text.toInt()?.toIntMax() == a {
                feedbackLabel.text = "You guessed it right !"
            }else{
                feedbackLabel.text = "You guessed it wrong :-/"
            }
            var newImg:UIImage = UIImage(named: "one")!
            
            switch(a){
            case 1:
                newImg = UIImage(named: "one")!
            
            case 2:
                newImg = UIImage(named: "two")!

            case 3:
                newImg = UIImage(named: "three")!

            case 4:
                newImg = UIImage(named: "four")!
                
            case 5:
                newImg = UIImage(named: "five")!

            default:
                feedbackLabel.text = "Please enter a number between 0 to 6"
            }
            
            image.image = newImg
            image.hidden = false
            inputNumber.enabled = false

            //println("The Field is empty")
            
        }else{
            feedbackLabel.text = "Please enter a number between 0 to 6"
            //println("The Field is NOT empty")
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

