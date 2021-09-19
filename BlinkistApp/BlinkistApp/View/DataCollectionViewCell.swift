//
//  DataCollectionViewCell.swift
//  BlinkistApp
//
//  Created by Decagon on 27/07/2021.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var cellImageView: UIImageView!
  @IBOutlet weak var cellTitleLabel: UILabel!
  @IBOutlet weak var bookType: UILabel!
  @IBOutlet weak var myAuthor: UILabel!
  
  func setUp(with authorDetails: Authors){
    cellTitleLabel.text = authorDetails.title
    cellImageView.image = UIImage(named: authorDetails.image)
    bookType.text = authorDetails.book_type
    myAuthor.text = authorDetails.author
  }
  
}
