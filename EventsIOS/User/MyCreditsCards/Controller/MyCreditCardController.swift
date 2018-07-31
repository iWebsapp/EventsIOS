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
    @IBOutlet weak var header: UIImageView!
    private var mycardListViewModel : MyCreditsCardsListViewModel!
    private var mycardModel: MyCreditsCardsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.delegate = self
        collection.dataSource = self
        self.mycardModel = MyCreditsCardsModel()
        self.mycardListViewModel = MyCreditsCardsListViewModel(mycards: self.mycardModel)
        DispatchQueue.main.async {
            self.collection.reloadData()
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
    
    func lastNumber(numer: String) -> String {
        let lastFourNumbers: String = String(numer.dropFirst(15))
        return lastFourNumbers
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mycardListViewModel.mycardViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCreditsCardsCell
        let card = self.mycardListViewModel.mycardViewModel[indexPath.row]
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
