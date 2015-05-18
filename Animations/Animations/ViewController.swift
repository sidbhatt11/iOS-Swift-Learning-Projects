//
//  ViewController.swift
//  Animations
//
//  Created by Siddharth Bhatt on 17/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Seconds:Int = 0
    var timer = NSTimer()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: Selector("setImage"), userInfo: nil, repeats: true)
        
        //finally disable the playButton
        playButton.enabled = false
        pauseButton.enabled = true
        stopButton.enabled = true
    }
    
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        timer.invalidate()
            
        playButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = true
        
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        timer.invalidate()
        
        playButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = false
        Seconds = 0
        setImage()
    }
    
    func setImage(){
        if Seconds>=42 {
            Seconds = 0
        }
        imageView.image = UIImage(named: "\(self.Seconds).PNG")
        Seconds = Seconds + 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Following functions are written only for testing different types of animation on the image. 
    //Feel free to un-comment and experiment
    /*
    override func viewDidLayoutSubviews() {
        
        //This is to make it slide in from the left
        //Play with X,Y and +,- to try different behaviours
        imageView.center = CGPointMake(imageView.center.x - 500, imageView.center.y)
        
        //This will make it invisible
        imageView.alpha = 0
        
        //This is how you play with size, frame etc
        imageView.frame = CGRectMake(100, 20, 0, 0)

    }
    
    override func viewDidAppear(animated: Bool) {
        
    
        UIView.animateWithDuration(1, animations: { () -> Void in
        
        //This is to make it slide in from the left
        self.imageView.center = CGPointMake(self.imageView.center.x + 500, self.imageView.center.y)
        
        //This will make it visible
        self.imageView.alpha = 1
    
        //This is how you play with size, frame etc
        self.imageView.frame = CGRectMake(100, 20, 100, 200)
    
    })
    
    }
    */

}

