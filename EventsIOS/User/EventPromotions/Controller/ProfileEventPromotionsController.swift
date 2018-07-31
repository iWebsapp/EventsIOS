//
//  ProfileEventPromotionsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventPromotionsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var table: UITableView!
    private var eventPromotionsListViewModel: EventPromotionsListViewModel!
    private var eventPromotionsModel: EventPromotionsModel!
    private var promotions: [PromotionsEvent] = [PromotionsEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        self.eventPromotionsModel = EventPromotionsModel()
        self.eventPromotionsListViewModel = EventPromotionsListViewModel(eventPromotions: self.eventPromotionsModel)
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Themes.isNight() {
            header.image = Themes.headerEventNight
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
        return eventPromotionsListViewModel.eventPromotionsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PromotionsEventCell
        let promotion = eventPromotionsListViewModel.eventPromotionsViewModel[indexPath.row]
        cell.titlePromotions.text = promotion.title
        cell.descriptionPromotions.text = promotion.description
        cell.picturePromotions.image = UIImage(named: promotion.picture)
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
