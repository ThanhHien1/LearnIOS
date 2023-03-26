//
//  PersonCell.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 24/03/2023.
//

import Foundation
import  UIKit

class PersonCell: UITableViewCell {
        
        //@IBOutlet weak var imageViewPerson: UIImageView!
    @IBOutlet weak var lbAddress: UILabel!    
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    
    
}
