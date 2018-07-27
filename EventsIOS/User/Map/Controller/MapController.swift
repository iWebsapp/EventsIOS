//
//  MapController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 05/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var header: UIImageView!
    private let regionRadious: CLLocationDistance = 70
    private let locationManager = CLLocationManager()
    @IBOutlet weak var listenerGeoLocalization: DesignableGradient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let initialLocation = CLLocation(latitude: 20.030275968647413, longitude: -98.77558698690915)
        zoomMapOn(location: initialLocation)
        let samples = InvitationCard(title: "San Francisco", locationName: "Guerrero ST", coordinate: CLLocationCoordinate2D(latitude: 20.029438425927204, longitude: -98.77709448337555))
        map.addAnnotation(samples)
        map.delegate = self
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
            listenerGeoLocalization.topColor = Themes.buttomLocalizationColorNight!
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        checkLocationServicesAuth()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkLocationServicesAuth(){
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            map.showsUserLocation = true
            locationManager.stopUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingHeading()
        }
    }
    
    func zoomMapOn(location: CLLocation){
        let coordinationRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadious * 2.0, regionRadious * 2.0)
        map.setRegion(coordinationRegion, animated: true)
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
