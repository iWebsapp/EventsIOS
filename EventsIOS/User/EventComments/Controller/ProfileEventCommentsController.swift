//
//  ProfileEventCommentsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 11/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class ProfileEventCommentsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    private var listComents: [Comments] = [Comments]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        listComents.append( Comments(comment: "Mensaje 1", user: "Luis Castillo", date: "27/03/18", avatar: "avatar") )
        listComents.append( Comments(comment: "Mensaje 2", user: "Mireyitha Jim", date: "15/03/18", avatar: "avatar") )
        listComents.append( Comments(comment: "Mensaje 3", user: "Rott Castillo", date: "10/03/18", avatar: "avatar") )
        listComents.append( Comments(comment: "Mensaje 4", user: "Suly Castillo", date: "19/10/18", avatar: "avatar") )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listComents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCommentsCell
        let comment = listComents[indexPath.row]
        cell.avatar.image = UIImage(named: comment.avatar)
        cell.txtUserName.text = comment.user
        cell.txtComment.text = comment.comment
        cell.txtDate.text = comment.date
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
