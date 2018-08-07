//
//  NewEventServicesController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 06/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class NewEventServicesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: UIImageView!
    private var newGuaranteedListViewModel: NewGuaranteedTableListViewModel!
    private var newGuaranteedModel: NewGuaranteedTableModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        self.newGuaranteedModel = NewGuaranteedTableModel()
        self.newGuaranteedListViewModel = NewGuaranteedTableListViewModel(newGuaranteedModel: self.newGuaranteedModel)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newGuaranteedListViewModel.newGuaranteedViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewGuaranteedTableCell
        let guadanted = self.newGuaranteedListViewModel.newGuaranteedViewModel[indexPath.row]
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
