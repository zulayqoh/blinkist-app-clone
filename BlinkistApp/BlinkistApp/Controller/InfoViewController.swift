//
//  PaymentViewController.swift
//  BlinkistApp
//
//  Created by Decagon on 28/07/2021.
//

//"id": 1,
//"title": "Elon Musk",
//"author": "Ashlee Vance",
//"book_type": "audiobook",
//"length": 144,
//"image": "Elo",
//"description": "Elon Musk is the the biography of an icon named Elon Musk",
//"access": "free"

import UIKit

class InfoViewController: UIViewController {
  
  var dataFromFirstScreen: Authors?
  
  @IBOutlet weak var detailImageView: UIImageView!
  @IBOutlet weak var lengthLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let hourLength = String(describing: dataFromFirstScreen!.length / 60) + "hr "
    let minuteLength = String(describing: dataFromFirstScreen!.length % 60) + "min"
    detailImageView.image = UIImage(named: dataFromFirstScreen?.image ?? "")
    titleLabel.text = dataFromFirstScreen?.title
    descriptionLabel.text = dataFromFirstScreen?.description
    authorLabel.text = dataFromFirstScreen?.author
    lengthLabel.text = hourLength + minuteLength
  }
}
