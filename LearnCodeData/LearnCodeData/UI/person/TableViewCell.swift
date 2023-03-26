//
//  TableViewCell.swift
//  LearnCodeData
//
//  Created by Thanh Hien on 25/03/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutImage()
        // Initialization code
    }

    private func layoutImage() {
        imageAvatar?.layer.cornerRadius = imageAvatar.bounds.width / 2
        imageAvatar?.layer.borderWidth = 1
        imageAvatar?.layer.borderColor = UIColor.lightGray.cgColor
        imageAvatar?.layer.shadowColor = UIColor.lightGray.cgColor
        imageAvatar?.layer.shadowOpacity = 0.5
        imageAvatar?.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageAvatar?.layer.shadowRadius = 2.0
        imageAvatar?.clipsToBounds = true
        imageAvatar?.contentMode = .scaleAspectFill
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        imageAvatar?.contentSize = CGSize(width: view.frame.width,: CGFloat(10 * 120)

        // Configure the view for the selected state
    }

}
