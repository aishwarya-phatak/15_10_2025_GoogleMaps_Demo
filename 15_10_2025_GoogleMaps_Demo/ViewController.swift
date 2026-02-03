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
        googleMaps1.delegate = self
        initializeSettings()

        puneMarker = markerAndCameraSettings(lat: 18.5246, long: 73.8786, snippetToBeAdded: "Hello From Pune!", desc: "Punekar!")
        mumbaiMarker = markerAndCameraSettings(lat: 18.9582, long: 72.8321, snippetToBeAdded: "Hello from Mumbai!", desc: "Mumbaikar!")
        bitcodeMarker = markerAndCameraSettings(lat: 18.32, long: 73.51, snippetToBeAdded: "Hello From Bitcode!", desc: "Bitcode Technologies!")
    }
    
    func markerAndCameraSettings(lat : CLLocationDegrees,
                        long : CLLocationDegrees,
                        snippetToBeAdded : String,
                        desc : String)->GMSMarker{
        
        let markerPosition = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let marker1 = GMSMarker(position: markerPosition)
        marker1.isDraggable = true
        marker1.isTappable = true
        marker1.rotation = 30.0
        marker1.map = googleMaps1
        marker1.snippet = snippetToBeAdded
        marker1.title = desc
        marker1.zIndex = 5
        
        let cameraPosition = GMSCameraPosition(target: markerPosition, zoom: 10.0)
        googleMaps1.camera = cameraPosition
        
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

extension ViewController : GMSMapViewDelegate{
 
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("\(marker.position.latitude) -- \(marker.position.longitude)")
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        print("did tap overlay method called")
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("didTapAt -- \(coordinate.latitude) -- \(coordinate.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging -- \(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print("didLongPressAt -- \(coordinate.latitude) -- \(coordinate.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging -- \(marker.position.latitude) -- \(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let cgRectForInfoWindow = CGRect(x: 10,
                                         y: 10,
                                         width: 280,
                                         height: 120)
        
        let infoWindow1 = UIView(frame: cgRectForInfoWindow)
        infoWindow1.backgroundColor = .white
        infoWindow1.layer.borderColor = CGColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
        infoWindow1.layer.borderWidth = 4.0
        
        let cgRectForLabel1 = CGRect(x: 20, y: 20, width: 260, height: 30)
        let label1 = UILabel(frame: cgRectForLabel1)
        label1.text = "Welcome To \(marker.title!)"
        label1.textAlignment = .center
        label1.backgroundColor = .lightGray
        label1.textColor = .black
        
        let cgRectForLabel2 = CGRect(x: 20, y: 70, width: 260, height: 30)
        let label2 = UILabel(frame: cgRectForLabel2)
        label2.text = "\(marker.snippet!)"
        label2.textAlignment = .center
        label2.backgroundColor = .lightGray
        label2.textColor = .black
        
        infoWindow1.addSubview(label1)
        infoWindow1.addSubview(label2)
        
        return infoWindow1
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    
    func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
        print("\(location.latitude) -- \(location.longitude)")
    }
    
//    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
//        <#code#>
//    }
//    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        print("didCloseInfoWindowOf")
    }
}
