//
//  MapController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 05/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import GoogleMaps

class MapController: UIViewController {

    @IBOutlet weak var header: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view.
        let heighHeader = CGFloat(87)
        let widthMap = self.view.frame.width
        let heightMap = self.view.frame.height - heighHeader
        let box = UIView(frame: CGRect(x: 0, y: heighHeader, width: widthMap, height: heightMap))
        box.backgroundColor = UIColor.brown
        view.addSubview(box)
        let camera = GMSCameraPosition.camera(withLatitude: 19.441504, longitude: -99.155923, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: box.frame, camera: camera)
        self.view.addSubview(mapView)

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
        
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 19.441504, longitude: -99.155923)
        marker.title = "Sydney"
        marker.snippet = "CDMX"
        marker.map = mapView
        
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
