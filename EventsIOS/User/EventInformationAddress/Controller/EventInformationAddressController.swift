//
//  EventInformationAddressController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 28/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class EventInformationAddressController: UIViewController {
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtAddress: UILabel!
    @IBOutlet weak var map: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtAddress.text = "Calle Antiguo Camino de F.F.C.C. 164, San Antonio, 42111 Pachuca de Soto, Hgo."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getMap()
        if Themes.isNight() {
            txtTitle.textColor = Themes.unselectedColorNight
            txtAddress.textColor = Themes.unselectedColorNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMap(){
        let mapView = map.showMap(lat: 19.441504, lon: -99.155923)
        self.view.addSubview(mapView)
        let marker = map.addMarker(lat: 19.441504, lon: -99.155923, title: "Sydney", snippet: "CDMX")
        marker.map = mapView
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
