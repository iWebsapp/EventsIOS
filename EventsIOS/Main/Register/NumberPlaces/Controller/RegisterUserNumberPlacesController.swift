//
//  NumberPlacesController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 04/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class RegisterUserNumberPlacesController: UIViewController {

    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var listenerNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doubts(_ sender: UIButton) {
        let doubts = storyboard?.instantiateViewController(withIdentifier: "RegisterUserAnswers") as! RegisterUserAnswersController
        self.present(doubts, animated: true, completion: nil )
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
