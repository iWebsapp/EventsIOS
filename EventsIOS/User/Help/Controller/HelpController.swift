//
//  HelpController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 17/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class HelpController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var header: UIImageView!
    private var helpListViewModel: HelpListViewModel!
    private var helpModel: HelpModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        self.helpModel = HelpModel()
        self.helpListViewModel = HelpListViewModel(helpModel: self.helpModel)
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
        return self.helpListViewModel.helpViewModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.helpListViewModel.helpViewModel[section].open == true {
            return self.helpListViewModel.helpViewModel[section].answer.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HelpCell
            cell.listenerView.topColor = UIColor(red:0.90, green:0.90, blue:0.90, alpha:1.0)
            cell.listenerView.bottomColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            cell.txtQuestion?.text = self.helpListViewModel.helpViewModel[indexPath.section].question
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HelpCell
            cell.listenerView.topColor = UIColor(red:0.90, green:0.37, blue:0.40, alpha:1.0)
            cell.listenerView.bottomColor = UIColor(red:1.04, green:0.25, blue:0.28, alpha:1.0)
            cell.txtQuestion?.text = self.helpListViewModel.helpViewModel[indexPath.section].answer[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if self.helpListViewModel.helpViewModel[indexPath.section].open == true {
                self.helpListViewModel.helpViewModel[indexPath.section].open = false
                let secciones = IndexSet.init(integer: indexPath.section)
                table.reloadSections(secciones, with: .fade)
            }else{
                self.helpListViewModel.helpViewModel[indexPath.section].open = true
                let secciones = IndexSet.init(integer: indexPath.section)
                table.reloadSections(secciones, with: .fade)
            }
        }
    }
    
    @IBAction func behind(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
