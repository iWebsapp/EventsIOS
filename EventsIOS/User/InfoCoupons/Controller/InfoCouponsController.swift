//
//  InfoCouponsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 22/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class InfoCouponsController: UIViewController {

    @IBOutlet weak var secondView: DesignableGradient!
    @IBOutlet weak var firstView: DesignableGradient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstView.isHidden = false
        secondView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        firstView.isHidden = false
        secondView.isHidden = true
    }
    
    @IBAction func behind(_ sender: UIButton) {
        dismiss(animated: true) {
            self.firstView.isHidden = false
            self.secondView.isHidden = true
        }
    }
    
    @IBAction func add(_ sender: UIButton) {
        
    }
    
    @IBAction func giveAway(_ sender: UIButton) {
        firstView.isHidden = true
        secondView.isHidden = false
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
