//
//  ViewController.swift
//  Map
//
//  Created by Siddharth Bhatt on 19/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        //Setup basic map vairables
        var latitude:CLLocationDegrees = 22.308907
        var longitude:CLLocationDegrees = 70.778553
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        
        //setup map
        mapView.setRegion(region, animated: true)
        
        
        //create annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Rajkot Airport"
        annotation.subtitle = "Small but busy"
        //add annotation to the map
        mapView.addAnnotation(annotation)
        
        //create longtouchgesturerecognizer
        var lpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        lpgr.minimumPressDuration = 2
        
        //add it to the map
        mapView.addGestureRecognizer(lpgr)
        
        
    }
    
    func action(longPressGestureRecognizer: UILongPressGestureRecognizer){
        println("Long press detected")
        var touchPoint = longPressGestureRecognizer.locationInView(self.mapView)
        var newCoordinate: CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        //lets add an annotaion here
        //create annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place !"
        annotation.subtitle = "What's here ?"
        //add annotation to the map
        mapView.addAnnotation(annotation)
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations)
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        //setup map
        self.mapView.setRegion(region, animated: true)
        
        //The following is pretty bad usage of annotations and is discouraged.
        //create annotation
        /*
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "User Trail"
        annotation.subtitle = "Waldo Tracks You.."
        //add annotation to the map
        mapView.addAnnotation(annotation)
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

