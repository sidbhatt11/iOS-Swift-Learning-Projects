//
//  ViewController.swift
//  Tables with Slider
//
//  Created by Siddharth Bhatt on 27/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func sliderUpdated(sender: AnyObject) {
        println(slider.value)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 20 }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL_DEFAULT")
        
        var value = Int(slider.value * 10 )
        
        cell.textLabel?.text = String( value * (indexPath.row + 1) )
        
        return cell
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

