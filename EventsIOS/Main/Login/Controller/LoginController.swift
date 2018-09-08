//
//  ViewController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 02/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginController: UIViewController, UITextFieldDelegate {
    
    private var loginModel: Webservice!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var listenerLogin: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var txtMode: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginModel = Webservice()
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        if self.envWhatModeIs() == "debug" {
            listenerLogin.isEnabled = true
            txtMode.isHidden = false
        } else {
            listenerLogin.isEnabled = false
            txtMode.isHidden = true
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            background.image = Themes.backgroundLoginNight
        }
    }
    
    private func loginData(email: String, password: String){
        let params = [
            "email": email,
            "password": password
        ]
        self.loginModel.restApi(params: params, method: .POST, action: .login, complete: { resp in
            let data = JSON(resp)
            if data["status"] == 200 {
                let token = "\(data["token"])"
                let setToken: Bool = self.setToken(data: token)
                if setToken {
                    self.performSegue(withIdentifier: "goMainFromLogin", sender: self)
                } else if data["status"] == 404 {
                    self.alertSimple(this: self, titileAlert: "Usuario no encontrado", bodyAlert: "Este usuario no existe en el sistema, intentalo con otro o crea tu cuenta", complete: { (resp) in
                        self.txtEmail.text = ""
                        self.txtPassword.text = ""
                    })
                } else if data["status"] == 404 {
                    self.alertSimple(this: self, titileAlert: "Usuario inexistente", bodyAlert: "Este usuario no existe en el sistema", complete: { (resp) in
                        self.txtEmail.text = ""
                        self.txtPassword.text = ""
                    })
                } else if data["status"] == 400 {
                    self.alertSimple(this: self, titileAlert: "Contraseña incorrecta", bodyAlert: "Este la contraseña no coincide con este usuario", complete: { (resp) in
                        self.txtEmail.text = ""
                        self.txtPassword.text = ""
                    })
                } else {
                    self.alertSimple(this: self, titileAlert: "Se ha producido un error", bodyAlert: "Intentalo mas tarde", complete: { (resp) in
                        self.txtEmail.text = ""
                        self.txtPassword.text = ""
                    })
                }
            }
         })
        
    }
    
    @IBAction func btnLogin(_ sender: DesignableButton) {
        
        if self.envWhatModeIs() == "debug" {
            self.loginData(email: "luis@mail.com", password: "jimyluis")
        } else {
            self.loginData( email: txtEmail.text!, password: txtPassword.text! )
        }

    }
    
    @IBAction func changeTxtEmail(_ sender: DesignableTextField) {
        if (txtEmail.text?.count)! > 3 {
            valid()
        } else {
            listenerLogin.isEnabled = false
        }
    }
    
    @IBAction func changeTxtPassword(_ sender: DesignableTextField) {
        if ( txtPassword.text?.count )! > 7 {
            valid()
        } else {
            listenerLogin.isEnabled = false
        }
    }
    
    private func valid(){
        if isValidEmailAddress(email: txtEmail.text!) {
            if ( txtPassword.text?.count )! > 7 {
                listenerLogin.isEnabled = true
            }
        } else {
            listenerLogin.isEnabled = false
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

