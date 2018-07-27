//
//  ProfileEventProductsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventProductsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var table: UITableView!
    private var eventProductsListViewModel: EventProductsListViewModel!
    private var eventProductModel: EventProductsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        if Themes.isNight() {
            header.image = Themes.headerEventNight
            self.view.backgroundColor = Themes.backgroundNight
        }
        self.eventProductModel = EventProductsModel()
        self.eventProductsListViewModel = EventProductsListViewModel(producModel: self.eventProductModel)
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventProductsListViewModel.eventProductViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileEventProductsCell
        let product = self.eventProductsListViewModel.eventProductViewModel[indexPath.row]
        cell.pictureProduct.image = UIImage(named: product.image)
        cell.txtTitleProduct.text = product.name
        cell.txtPriceProduct.text = product.price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goInfoProduct", sender: self)
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
