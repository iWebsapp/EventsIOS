//
//  SettingsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var cardEmail: UIStackView!
    @IBOutlet weak var cardPassword: UIStackView!
    @IBOutlet weak var cardBirthday: UIStackView!
    @IBOutlet weak var cardPayment: UIStackView!
    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var changeEmail: UIView!
    @IBOutlet weak var changePassword: UIView!
    @IBOutlet weak var changeBirthday: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        cardEmail.isHidden = false
        cardPassword.isHidden = false
        cardBirthday.isHidden = false
        cardPayment.isHidden = false
        
        changeEmail.isHidden = true
        changePassword.isHidden = true
        changeBirthday.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hideInfo(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                cardEmail.isHidden = false
                changeEmail.isHidden = true
            break
            case 1:
                cardPassword.isHidden = false
                changePassword.isHidden = true
            break
            case 2:
                cardBirthday.isHidden = false
                changeBirthday.isHidden = true
            break
        default:
            performSegue(withIdentifier: "goPayment", sender: self)
        }
    }
    
    @IBAction func showInfo(_ sender: UIButton) {
        switch sender.tag {
            case 0:
                cardEmail.isHidden = true
                changeEmail.isHidden = false
            break
            case 1:
                cardPassword.isHidden = true
                changePassword.isHidden = false
            break
            case 2:
                cardBirthday.isHidden = true
                changeBirthday.isHidden = false
            break
            default:
                performSegue(withIdentifier: "goPayment", sender: self)
        }
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
