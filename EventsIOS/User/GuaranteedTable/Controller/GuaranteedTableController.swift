//
//  GuaranteedTableController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 22/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class GuaranteedTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var table: UITableView!
    private var listGuaranted: [GuaranteedTable] = [GuaranteedTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            self.view.backgroundColor = Themes.backgroundNight
        }
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Area de fumadores"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Barra"))
        listGuaranted.append( GuaranteedTable(icon: "icon-coupons", title: "Mesa"))
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
        return cell
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
