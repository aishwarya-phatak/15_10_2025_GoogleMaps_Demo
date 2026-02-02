//
//  ViewController.swift
//  15_10_2025_GoogleMaps_Demo
//
//  Created by Vishal Jagtap on 02/02/26.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    var puneMarker : GMSMarker?
    var mumbaiMarker : GMSMarker?
    var bitcodeMarker : GMSMarker?
    
    @IBOutlet weak var googleMaps1: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSettings()

        puneMarker = showMarker(lat: 18.5246, long: 73.8786)
        mumbaiMarker = showMarker(lat: 18.9582, long: 72.8321)
        bitcodeMarker = showMarker(lat: 18.32, long: 73.51)
    }
    
    func showMarker(lat : CLLocationDegrees, long : CLLocationDegrees)->GMSMarker{
        var markerPosition = CLLocationCoordinate2D(latitude: lat, longitude: long)
        var marker1 = GMSMarker(position: markerPosition)
        return marker1
    }
    
    func initializeSettings(){
        googleMaps1.isBuildingsEnabled = true
        googleMaps1.isTrafficEnabled = true
        googleMaps1.isIndoorEnabled = true
        googleMaps1.settings.myLocationButton = true
        googleMaps1.settings.rotateGestures = true
        googleMaps1.settings.scrollGestures = true
        googleMaps1.settings.tiltGestures = true
        googleMaps1.settings.zoomGestures = true
        googleMaps1.settings.compassButton = true
        googleMaps1.isMyLocationEnabled = true
        googleMaps1.mapType = .normal
    }
    
    
    


}
