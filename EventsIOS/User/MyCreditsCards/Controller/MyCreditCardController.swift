//
//  MyCreditsCardsController.swift
//  EventsIOS
//
//  Created by Luis Castillo on 18/07/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class MyCreditsCardsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    private var credit: [CreditCard] = [CreditCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        credit.append( CreditCard(number: "1234 4321 1111 2715", mmaa: "27/21", fullname: "Luis Manuel Castillo Zamorano"))
        credit.append( CreditCard(number: "1111 1234 4321 1527", mmaa: "27/21", fullname: "Ana Mireya Jimenez Perez"))
        credit.append( CreditCard(number: "2222 1111 4444 6067", mmaa: "27/21", fullname: "Dolores Imelda Zamorano Lugo"))
        credit.append( CreditCard(number: "4444 2222 1111 1270", mmaa: "27/21", fullname: "Yajaira Abigail Corriente Osorno"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lastNumber(numer: String) -> String {
        let lastFourNumbers: String = String(numer.dropFirst(15))
        return lastFourNumbers
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return credit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCreditsCardsCell
        let card = credit[indexPath.row]
        cell.txtFullName.text = card.fullname
        cell.txtMmaa.text = card.mmaa
        cell.txtLatest.text = lastNumber(numer: card.number)
        cell.cartView.topColor = self.randomColor()
        cell.cartView.bottomColor = self.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goInfoCard", sender: self)
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
