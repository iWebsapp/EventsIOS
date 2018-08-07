//
//  NewEventHoursController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 07/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class NewEventHoursController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: UIImageView!
    public var menuItemsProfile:[ProfileEvent] = [ProfileEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Lunes") )
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Martes") )
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Miercoles") )
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Jueves") )
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Viernes") )
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Sabado") )
        menuItemsProfile.append( ProfileEvent(icon: "", title: "Domingo") )
        DispatchQueue.main.async {
            self.table.reloadData()
        }
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItemsProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewGuaranteedTableCell
        let guadanted = self.menuItemsProfile[indexPath.row]
        cell.txtTitle.text = guadanted.title
        cell.txtSelected.image = UIImage(named: "icon-check")
        cell.txtSelected.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:NewGuaranteedTableCell = tableView.cellForRow(at: indexPath) as! NewGuaranteedTableCell
        selectedCell.txtSelected.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedCell:NewGuaranteedTableCell = tableView.cellForRow(at: indexPath) as! NewGuaranteedTableCell
        selectedCell.txtSelected.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
