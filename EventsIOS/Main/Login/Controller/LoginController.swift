//
//  ViewController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 02/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import Crashlytics

class LoginController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var listenerLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func crasher(_ sender: UIButton) {
        Crashlytics.sharedInstance().crash()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

