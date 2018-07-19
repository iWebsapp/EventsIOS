//
//  ReportProblemsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ReportProblemsController: UIViewController {

    @IBOutlet weak var listenerTitle: UILabel!
    @IBOutlet weak var primaryView: DesignableGradient!
    @IBOutlet weak var secundaryView: DesignableGradient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        primaryView.isHidden = false
        secundaryView.isHidden = true
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func noWork(_ sender: UIButton) {
        primaryView.isHidden = true
        secundaryView.isHidden = false
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func send(_ sender: UIButton) {
        dismiss(animated: true, completion: {
            self.primaryView.isHidden = false
            self.secundaryView.isHidden = true
        })
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        primaryView.isHidden = false
        secundaryView.isHidden = true
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
