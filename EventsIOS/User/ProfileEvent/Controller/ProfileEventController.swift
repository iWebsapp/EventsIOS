//
//  ProfileEventController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 08/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    private var notificationListViewModel: ProfileEventListViewModel!
    private var notificationData: ProfileEventModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        self.notificationData = ProfileEventModel()
        self.notificationListViewModel = ProfileEventListViewModel(data: self.notificationData)
        DispatchQueue.main.async {
            self.table.reloadData()
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
        return self.notificationListViewModel.profileEventViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileEventCell
        let notification = self.notificationListViewModel.profileEventViewModel[indexPath.row]
        cell.icon.image = UIImage(named: notification.icon)
        cell.txtTitle?.text = notification.title!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "goInformationEventProfile", sender: self )
        case 1:
            performSegue(withIdentifier: "goCommentsEventProfile", sender: self )
        case 2:
            performSegue(withIdentifier: "goCouponsEventProfile", sender: self )
        case 3:
            performSegue(withIdentifier: "goPromotionsEventProfile", sender: self )
        default:
            performSegue(withIdentifier: "goProductsEventProfile", sender: self )
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
