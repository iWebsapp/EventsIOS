//
//  NewGuaranteedTableController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 23/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class NewGuaranteedTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    private var listGuaranted: [GuaranteedTable] = [GuaranteedTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Area de fumadores"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Barra"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Mesa"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Cerca de una ventana"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Cerca de la cocina"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Cerca de la salida"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listGuaranted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewGuaranteedTableCell
        let guadanted = listGuaranted[indexPath.row]
        cell.txtIcon.image = UIImage(named: guadanted.icon)
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
    
    @IBAction func behind(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
