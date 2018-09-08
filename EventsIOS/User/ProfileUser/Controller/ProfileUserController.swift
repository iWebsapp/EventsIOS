//
//  ProfileUserController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 05/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileUserController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var txtMode: UILabel!
    private var profileUserListViewModel: ProfileUserListViewModel!
    private var profileUserModel: ProfileUserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        self.profileUserModel = ProfileUserModel()
        self.profileUserListViewModel = ProfileUserListViewModel(profileUserModel: self.profileUserModel)
        
        if self.envWhatModeIs() == "debug" {
            txtMode.isHidden = false
        } else {
            txtMode.isHidden = true
        }
        
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
            self.tabBarController?.tabBar.barTintColor = Themes.backgroundNight
            self.tabBarController?.tabBar.tintColor = Themes.tintColorNight
            self.tabBarController?.tabBar.unselectedItemTintColor = Themes.unselectedColorNight
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileUserListViewModel.itemsProfileUserModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileEventCell
        let profile = self.profileUserListViewModel.itemsProfileUserModel[indexPath.row]
        cell.icon.image = UIImage(named: profile.icon)
        cell.txtTitle.text = profile.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.profileUserListViewModel.itemsProfileUserModel[indexPath.row].title! {
            case "Configuración":
                performSegue(withIdentifier: "goSettings", sender: self )
            case "Mis Eventos":
                performSegue(withIdentifier: "goMyEvents", sender: self )
            case "Quiénes somos":
                performSegue(withIdentifier: "goAbout", sender: self )
            case "Reportar un problema":
                performSegue(withIdentifier: "goReportProblem", sender: self )
            case "Servicio de ayuda":
                performSegue(withIdentifier: "goHelp", sender: self )
            case "Privacidad y condiciones":
                performSegue(withIdentifier: "goPrivacy", sender: self )
            default:
                self.logout()
        }
    }
    
    private func logout(){
        self.alertAvanced(this: self, titileAlert: "Cerrar sesión", bodyAlert: "¿Estas seguro de cerrar tu sesión?") { resp in
            if resp == "acept" {
                let remove:Bool = self.deleteToken()
                if remove {
                    self.performSegue(withIdentifier: "goLogout", sender: self )
                } else {
                    self.hendlerError(this: self, complete: { data in
                        print(data)
                    })
                }
            }
        }
    }
    

}
