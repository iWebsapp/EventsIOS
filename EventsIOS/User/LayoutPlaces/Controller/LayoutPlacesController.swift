//
//  LayoutPlacesController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 23/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class LayoutPlacesController: UIViewController {

    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var listenerNew: UIButton!
    @IBOutlet weak var listenerList: UIButton!
    private var contNew: Int = 0
    private var contList: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listenerNew.setImage(UIImage(named: "icon-add"), for: .normal)
        listenerList.setImage(UIImage(named: "icon-list"), for: .normal)
        mapView.alpha = 1
        newView.alpha = 0
        listView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newEvent(_ sender: UIButton) {
        if contNew == 0 {
            listenerNew.setImage(UIImage(named: "menu-map-white"), for: .normal)
            listenerList.isHidden = true
            mapView.alpha = 0
            newView.alpha = 1
            listView.alpha = 0
            contNew = 1
        } else {
            listenerNew.setImage(UIImage(named: "icon-add"), for: .normal)
            listenerList.isHidden = false
            mapView.alpha = 1
            newView.alpha = 0
            listView.alpha = 0
            contNew = 0
        }
    }
    
    @IBAction func listEvent(_ sender: UIButton) {
        if contList == 0 {
            listenerList.setImage(UIImage(named: "menu-map-white"), for: .normal)
            listenerNew.isHidden = true
            mapView.alpha = 0
            newView.alpha = 0
            listView.alpha = 1
            contList = 1
        } else {
            listenerList.setImage(UIImage(named: "icon-list"), for: .normal)
            listenerNew.isHidden = false
            mapView.alpha = 1
            newView.alpha = 0
            listView.alpha = 0
            contList = 0
        }
    }
    
}
