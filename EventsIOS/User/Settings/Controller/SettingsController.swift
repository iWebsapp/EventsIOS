//
//  SettingsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    private var settingsViewModel: SettingsViewModel!
    private var settingsModel: SettingsModel!
    
    @IBOutlet weak var cardEmail: UIStackView!
    @IBOutlet weak var cardPassword: UIStackView!
    @IBOutlet weak var cardBirthday: UIStackView!
    @IBOutlet weak var cardPayment: UIStackView!
    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var changeEmail: UIView!
    @IBOutlet weak var changePassword: UIView!
    @IBOutlet weak var changeBirthday: UIView!
    
    //outlet save button
    @IBOutlet weak var listenerSaveEmail: UIButton!
    @IBOutlet weak var listenerSavePassword: UIButton!
    @IBOutlet weak var listenerSaveBirthday: UIButton!
    
    
    //textfield
    @IBOutlet weak var txtNewEmail: UITextField!
    @IBOutlet weak var txtPassOld: UITextField!
    @IBOutlet weak var txtPassNew: UITextField!
    @IBOutlet weak var txtChangeBirthday: UIDatePicker!
    
    @IBOutlet weak var cardPayHidden: DesignableGradient!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        cardPayHidden.isHidden = true
        
        cardEmail.isHidden = false
        cardPassword.isHidden = false
        cardBirthday.isHidden = false
        cardPayment.isHidden = false
        
        changeEmail.isHidden = true
        changePassword.isHidden = true
        changeBirthday.isHidden = true
        
        listenerSaveEmail.isHidden = true
        listenerSavePassword.isHidden = true
        listenerSaveBirthday.isHidden = true
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
                self.hideAllCards()
                listenerSaveEmail.isHidden = true
                cardEmail.isHidden = false
                changeEmail.isHidden = true
            break
            case 1:
                self.hideAllCards()
                listenerSavePassword.isHidden = true
                cardPassword.isHidden = false
                changePassword.isHidden = true
            break
            case 2:
                self.hideAllCards()
                listenerSaveBirthday.isHidden = true
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
                self.hideAllCards()
                listenerSaveEmail.isHidden = false
                cardEmail.isHidden = true
                changeEmail.isHidden = false
            break
            case 1:
                self.hideAllCards()
                listenerSavePassword.isHidden = false
                cardPassword.isHidden = true
                changePassword.isHidden = false
            break
            case 2:
                self.hideAllCards()
                listenerSaveBirthday.isHidden = false
                cardBirthday.isHidden = true
                changeBirthday.isHidden = false
            break
            default:
                self.hideAllCards()
                performSegue(withIdentifier: "goPayment", sender: self)
        }
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveEmail(_ sender: UIButton) {
        print("email...")
    }
    
    @IBAction func btnSavePassword(_ sender: UIButton) {
        print("password...")
    }
    
    @IBAction func btnSaveBirthday(_ sender: UIButton) {
        print("birthday...")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func hideAllCards(){
        cardPayment.isHidden = false
        cardEmail.isHidden = false
        cardPassword.isHidden = false
        cardBirthday.isHidden = false
        
        changeEmail.isHidden = true
        changePassword.isHidden = true
        changeBirthday.isHidden = true
        
        listenerSaveEmail.isHidden = true
        listenerSavePassword.isHidden = true
        listenerSaveBirthday.isHidden = true
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
