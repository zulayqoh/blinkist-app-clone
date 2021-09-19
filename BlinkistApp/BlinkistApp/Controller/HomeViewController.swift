//
//  ViewController.swift
//  BlinkistApp
//
//  Created by Decagon on 27/07/2021.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  var bookDetails = [Authors]()
  var dataParser = DataParser()
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    bookDetails = dataParser.bookDetails  //
    dataParser.delegate = self  // assigning HomeViewController to the class's delegate
    dataParser.parseJSON()     //  getting data from DataParser's delegate
    //let jsonDataParserInstance = DataParser().parseJSON
  }
}

extension  HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { self.bookDetails.count }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DataCollectionViewCell
    cell.setUp(with: self.bookDetails[indexPath.row])
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let dataToSend = bookDetails[indexPath.row]
    performSegue(withIdentifier: "lastPage", sender: dataToSend)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let data = sender as? Authors {
      if let destination = segue.destination as? InfoViewController {
        destination.dataFromFirstScreen = data
      }
    }
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let bounds = collectionView.bounds
    return  CGSize(width: bounds.width/2 - 3, height: bounds.height/2)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 6 }
}

extension HomeViewController: dataDelegate {
  func parseJsonData(_ data: [Authors]) {
    self.bookDetails = data
  }
  
  
}
