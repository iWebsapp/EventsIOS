//
//  NotificationController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 05/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class EventController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    private var eventListViewModel: EventListViewModel!
    private var eventData: EventModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        self.eventData = EventModel()
        self.eventListViewModel = EventListViewModel(eventModel: self.eventData)
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
        return self.eventListViewModel.eventViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        let event = self.eventListViewModel.eventViewModel[indexPath.row]
        cell.txtName.text = event.name
        cell.txtDate.text = event.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goProfileEventFromUser", sender: self )
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
