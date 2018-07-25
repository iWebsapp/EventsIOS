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
    @IBOutlet weak var listenerMapButton: UIButton!
    @IBOutlet weak var listenerListButton: UIButton!
    @IBOutlet weak var listenerNewButton: UIButton!
    private var conta: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //listenerNew.setImage(UIImage(named: "icon-add"), for: .normal)
        //listenerList.setImage(UIImage(named: "icon-list"), for: .normal)
        mapView.alpha = 1
        newView.alpha = 0
        listView.alpha = 0
        listenerMapButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MapButton(_ sender: UIButton) {
        listenerMapButton.isHidden = true
        listenerListButton.isHidden = false
        listenerNewButton.isEnabled = true
        mapView.alpha = 1
        newView.alpha = 0
        listView.alpha = 0
    }
    
    @IBAction func newButton(_ sender: UIButton) {
        if conta == 0 {
            listenerNewButton.setImage(UIImage(named: "menu-map-white"), for: .normal)
            listenerListButton.isEnabled = false
            mapView.alpha = 0
            newView.alpha = 1
            listView.alpha = 0
            conta = 1
        } else {
            listenerNewButton.setImage(UIImage(named: "icon-add"), for: .normal)
            listenerListButton.isEnabled = true
            mapView.alpha = 1
            newView.alpha = 0
            listView.alpha = 0
            conta = 0
        }
    }
    
    @IBAction func listButton(_ sender: UIButton) {
        listenerListButton.isHidden = true
        listenerMapButton.isHidden = false
        listenerNewButton.isEnabled = false
        mapView.alpha = 0
        newView.alpha = 0
        listView.alpha = 1
    }
    
}
