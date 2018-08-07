//
//  NewEventMenuController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 06/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class NewEventMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: UIImageView!
    public var menuItemsProfile:[ProfileEvent] = [ProfileEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        menuItemsProfile.append( ProfileEvent(icon: "menu-map", title: "Agregar su ubicación") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-settings", title: "Agrega tus servicios") )
        menuItemsProfile.append( ProfileEvent(icon: "icon-categories", title: "Agrega su Categoría") )
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItemsProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileEventCell
        let profile = self.menuItemsProfile[indexPath.row]
        cell.icon.image = UIImage(named: profile.icon)
        cell.txtTitle.text = profile.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.menuItemsProfile[indexPath.row].icon {
            case "menu-map":
                performSegue(withIdentifier: "goNewEventAddress", sender: self )
            case "icon-categories":
                performSegue(withIdentifier: "goNewEventCategories", sender: self )
            default:
                performSegue(withIdentifier: "goNewEventServices", sender: self )
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
