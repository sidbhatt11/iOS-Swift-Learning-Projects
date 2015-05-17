//
//  ViewController.swift
//  Stopwatch
//
//  Created by Siddharth Bhatt on 25/03/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Hours:Int = 0
    var Mins:Int = 0
    var Seconds:Int = 0
    var timer = NSTimer()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    @IBAction func play(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("iteration"), userInfo: nil, repeats: true)
        
        //finally disable the playButton
        playButton.enabled = false
        pauseButton.enabled = true
        stopButton.enabled = true

    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        
        playButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = true
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        
        playButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = false
        
        Hours = 0
        Mins = 0
        Seconds = 0
        updateLabel()
    }
    
    func updateLabel() {
        //update the timeLabel every second
        timeLabel.text = "\(Hours) : \(Mins) : \(Seconds)"
    }
    
    func iteration() {
        //this function executes every second
        
        //Check for Seconds first
        if Seconds < 59 {
            Seconds++
        }else if Seconds == 59 {
            Mins++
            Seconds = 0
        }
        
        //Check for Mins now
        if Mins == 59 {
            Hours++
            Mins = 0
        }
        
        updateLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pauseButton.enabled = false
        stopButton.enabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

