//
//  MapView.swift
//  EventsIOS
//
//  Created by Luis Castillo on 05/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapView: UIView {
    
    
    func showMap( lat: Float, lon: Float ) ->GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 19.441504, longitude: -99.155923, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: self.frame, camera: camera)
        
        do {
            
            if Themes.isNight() {
                let styleURL = Bundle.main.url(forResource: "mapNight", withExtension: "json")
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL!)
            } else {
                let styleURL = Bundle.main.url(forResource: "mapDay", withExtension: "json")
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL!)
            }
            
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        return mapView
    }
    
    func addMarker( lat: Float, lon: Float, title: String, snippet: String ) ->GMSMarker {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
        marker.title = title
        marker.snippet = snippet
        return marker
    }
    
    
}

