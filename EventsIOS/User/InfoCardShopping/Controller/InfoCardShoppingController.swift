//
//  InfoCardShoppingController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 20/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class InfoCardShoppingController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: UIImageView!
    private var infoCardListViewModel: InfoCardShoppingListViewModel!
    private var infoCardModel: InfoCardShoppingModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerGobalNight
            self.view.backgroundColor = Themes.backgroundNight
        }
        self.infoCardModel = InfoCardShoppingModel()
        self.infoCardListViewModel = InfoCardShoppingListViewModel(infoCardModel: self.infoCardModel)
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.infoCardListViewModel.infoCardViewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.infoCardListViewModel.infoCardViewModel[section].open == true {
            return self.infoCardListViewModel.infoCardViewModel[section].products.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
            cell.cardView.topColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
            cell.cardView.bottomColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            
            cell.txtName.text = self.infoCardListViewModel.infoCardViewModel[indexPath.section].name
            cell.avatar.image = UIImage(named: self.infoCardListViewModel.infoCardViewModel[indexPath.section].picture)
            cell.txtDate.text = self.infoCardListViewModel.infoCardViewModel[indexPath.section].total
            return cell
        }else{
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
            cell.cardView.topColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            cell.cardView.bottomColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            cell.cardView.shadowColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            
            cell.txtName.text = self.infoCardListViewModel.infoCardViewModel[indexPath.section].products[indexPath.row - 1].name
            cell.avatar.image = UIImage(named: self.infoCardListViewModel.infoCardViewModel[indexPath.section].products[indexPath.row - 1].picture)
            cell.txtDate.text = self.infoCardListViewModel.infoCardViewModel[indexPath.section].products[indexPath.row - 1].price
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if self.infoCardListViewModel.infoCardViewModel[indexPath.section].open == true {
                self.infoCardListViewModel.infoCardViewModel[indexPath.section].open = false
                let secciones = IndexSet.init(integer: indexPath.section)
                table.reloadSections(secciones, with: .fade)
            }else{
                self.infoCardListViewModel.infoCardViewModel[indexPath.section].open = true
                let secciones = IndexSet.init(integer: indexPath.section)
                table.reloadSections(secciones, with: .fade)
            }
        }
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
