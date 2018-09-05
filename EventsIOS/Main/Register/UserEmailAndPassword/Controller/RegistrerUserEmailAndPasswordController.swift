//
//  RegistrerUserEmailAndPasswordController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 04/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import SwiftyJSON

class RegistrerUserEmailAndPasswordController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var listenerNext: UIButton!
    @IBOutlet weak var header: UIImageView!
    private var createModel: Webservice!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createModel = Webservice()
        listenerNext.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            header.image = Themes.backgroundRegister
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCreate(_ sender: DesignableButton) {
        let params = [
            "email": txtEmail.text!,
            "password": txtPassword.text!,
        ]
        self.createModel.restApi(params: params, method: .POST, action: .create) { resp in
            let data = JSON(resp)
            if data["status"] == 202 {
                self.alertSimple(this: self, titileAlert: "Alerta", bodyAlert: "Este corre ya esta asociado a una cuenta, intentalo con otra.", complete: { result in
                    self.txtEmail.text = ""
                    self.txtPassword.text = ""
                })
            }
            if data["status"] == 200 {
                self.alertSimple(this: self, titileAlert: "Exito", bodyAlert: "Tu cuenta ha sido creada con exito", complete: { result in
                    self.txtEmail.text = ""
                    self.txtPassword.text = ""
                    self.navigationController?.popViewController(animated: true)
                })
            }
            
            if data["status"] == 500 {
                self.alertSimple(this: self, titileAlert: "Alerta", bodyAlert: "Se ha producido un error, intentalo más tarde", complete: { result in
                    self.txtEmail.text = ""
                    self.txtPassword.text = ""
                })
            }
        }
    }
    
    @IBAction func changeTxtEmail(_ sender: DesignableTextField) {
        if (txtEmail.text?.count)! > 3 {
            valid()
        } else {
            listenerNext.isEnabled = false
        }
    }
    
    @IBAction func changeTxtPassword(_ sender: DesignableTextField) {
        if ( txtPassword.text?.count )! > 8 {
            valid()
        } else {
            listenerNext.isEnabled = false
        }
    }
    
    private func valid(){
        if isValidEmailAddress(email: txtEmail.text!) {
            if ( txtPassword.text?.count )! > 8 {
                listenerNext.isEnabled = true
            }
        } else {
            listenerNext.isEnabled = false
        }
    }
    
    private func isValidEmailAddress(email: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = email as NSString
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0{
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }


}
