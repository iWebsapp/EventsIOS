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
    private var itemsProfile = [ProfileEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
            self.tabBarController?.tabBar.barTintColor = Themes.backgroundNight
            self.tabBarController?.tabBar.tintColor = Themes.tintColorNight
            self.tabBarController?.tabBar.unselectedItemTintColor = Themes.unselectedColorNight
        } 
        itemsProfile.append( ProfileEvent(icon: "icon-settings", title: "Configuración") )
        itemsProfile.append( ProfileEvent(icon: "menu-events", title: "Mis Eventos") )
        itemsProfile.append( ProfileEvent(icon: "icon-info", title: "Quiénes somos") )
        itemsProfile.append( ProfileEvent(icon: "icon-report", title: "Reportar un problema") )
        itemsProfile.append( ProfileEvent(icon: "icon-help", title: "Servicio de ayuda") )
        itemsProfile.append( ProfileEvent(icon: "icon-conditions", title: "Privacidad y condiciones") )
        itemsProfile.append( ProfileEvent(icon: "icon-logout", title: "Cerrar sesión") )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileEventCell
        let profile = itemsProfile[indexPath.row]
        cell.icon.image = UIImage(named: profile.icon)
        cell.txtTitle.text = profile.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch itemsProfile[indexPath.row].title {
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
            performSegue(withIdentifier: "goLogout", sender: self )
        }
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
