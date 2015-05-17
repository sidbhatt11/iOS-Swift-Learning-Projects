//
//  ViewController.swift
//  Weather App
//
//  Created by Siddharth Bhatt on 16/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

var citiesList = [String]()
//var citiesList = ["Pune", "Rajkot"]

class ViewController: UIViewController, UITableViewDelegate {

    
    var nibLoaded = false
    var dataLoaded = false
    var weather:String = "Error Updating Weather. Please check your internet connection or city name."

    @IBOutlet weak var citiesTableView: UITableView!
    
    @IBAction func refreshWeather(sender: AnyObject) {
        citiesTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("citiesList") != nil {
            citiesList = NSUserDefaults.standardUserDefaults().objectForKey("citiesList") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if !nibLoaded {
            tableView.registerNib(UINib(nibName: "customCell", bundle: nil), forCellReuseIdentifier: "city")
            nibLoaded = true
        }

        let cell = tableView.dequeueReusableCellWithIdentifier("city", forIndexPath: indexPath) as! customCellClass
        cell.cityName.text = citiesList[indexPath.row]
        var city = citiesList[indexPath.row].stringByReplacingOccurrencesOfString(" ", withString: "-")
        
        
            
            var url = NSURL(string: "http://www.weather-forecast.com/locations/"+city+"/forecasts/latest")
            var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
                
                if error == nil {
                    var dataContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                    var trashArray = dataContent?.componentsSeparatedByString("<span class=\"phrase\">") as! [String]
                    var anothertrashArray = trashArray[1].componentsSeparatedByString("</span>")
                    self.weather = anothertrashArray[0] as String
                    self.weather = self.weather.stringByReplacingOccurrencesOfString("&deg;", withString: "ºC")
                    //println(self.weather)
                    self.dataLoaded = true
                    //println("data content downloaded and loaded into 'weather'")
                    
                    dispatch_async(dispatch_get_main_queue()){
                        if self.dataLoaded{
                            //println("data loaded. Updating the textlabel")
                            cell.tempString.text = self.weather
                            self.dataLoaded = false
                        }else{
                            //println("data not updated.")
                        }
                    }
                    
                }
            })
            task.resume()
            //println("resuming the task")
        return cell
    }
   
    override func viewDidAppear(animated: Bool) {
        citiesTableView.reloadData()
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            citiesList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(citiesList, forKey: "citiesList")
            citiesTableView.reloadData()
        }
    }
    
    func getWeather(city: String!) {

        

        var url = NSURL(string: "http://www.weather-forecast.com/locations/"+city+"/forecasts/latest")
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) in
            
            if error == nil {
                var dataContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                //println(dataContent!)
                var trashArray = dataContent?.componentsSeparatedByString("<span class=\"phrase\">") as! [String]
                var anothertrashArray = trashArray[1].componentsSeparatedByString("</span>")
                self.weather = anothertrashArray[0] as String
                println(self.weather)
            }
        })
            
        task.resume()
            

    }

}

