//
//  addLocation.swift
//  Weather App
//
//  Created by Siddharth Bhatt on 17/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class addLocation: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cityName: UITextField!
    
    @IBAction func addCity(sender: AnyObject) {
        citiesList.append(cityName.text)
        NSUserDefaults.standardUserDefaults().setObject(citiesList, forKey: "citiesList")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.cityName.endEditing(true)
    }
    
    func textFieldShouldReturn(textfield: UITextField) -> Bool {
        cityName.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cityName.delegate = self
    }

}
