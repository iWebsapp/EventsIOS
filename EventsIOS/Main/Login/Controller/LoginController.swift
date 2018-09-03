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

    private var loginViewModel: LoginViewModel!
    private var loginModel: Webservice!
    
    @IBOutlet weak var txtEmail: BindingTextField! {
        didSet {
            txtEmail.bind {
                self.loginViewModel.email = $0
            }
        }
    }
    @IBOutlet weak var txtPassword: BindingTextField! {
        didSet {
            txtPassword.bind {
                self.loginViewModel.password = $0
            }
        }
    }
    
    @IBOutlet weak var listenerLogin: UIButton!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
        loginModel = Webservice()
        txtEmail.delegate = self
        txtPassword.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            background.image = Themes.backgroundLoginNight
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    }
                } else if data["status"] == 404 {
                    self.alertSimple(this: self, titileAlert: "Usuario no encontrado", bodyAlert: "Este usuario no existe en el sistema, intentalo con otro o crea tu cuenta", complete: { (resp) in
                            //empty textfilds
                    })
                } else if data["status"] == 404 {
                    self.alertSimple(this: self, titileAlert: "Usuario inexistente", bodyAlert: "Este usuario no existe en el sistema", complete: { (resp) in
                            //empty textfilds
                    })
                } else if data["status"] == 400 {
                    self.alertSimple(this: self, titileAlert: "Contraseña incorrecta", bodyAlert: "Este la contraseña no coincide con este usuario", complete: { (resp) in
                            //empty textfilds
                    })
                } else {
                    self.alertSimple(this: self, titileAlert: "Se ha producido un error", bodyAlert: "Intentalo mas tarde", complete: { (resp) in
                            //empty textfilds
                    })
                }
        
         })
        
    }
    
    @IBAction func btnLogin(_ sender: DesignableButton) {
        
        self.loginViewModel.email = self.txtEmail.text!
        self.loginViewModel.password = self.txtPassword.text!
        if self.envWhatModeIs() == "debug" {
            self.loginData(email: "luis@mail.com", password: "jimyluis")
        } else {
            if (self.loginViewModel.isValid) {
                self.loginData( email: self.loginViewModel.email!, password: self.loginViewModel.password! )
            } else {
                let messege = self.loginViewModel.brokenRules[0].messege
                if messege == "email is not valid" {
                    self.alertSimple(this: self, titileAlert: "Correo no valido", bodyAlert: "Este no es un correo", complete: { data in })
                }
                if messege == "this password requires at least 8 characters" {
                    self.alertSimple(this: self, titileAlert: "Advertencia¡", bodyAlert: "La contraseña requiere 8 digitos como minimo", complete: { data in })
                } else {
                    self.alertSimple(this: self, titileAlert: "Campos obligatorios", bodyAlert: "Todos los campos son obligatorios", complete: { data in })
                }
            }
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

