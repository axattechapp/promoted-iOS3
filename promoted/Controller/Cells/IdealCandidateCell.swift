//
//  IdealCandidateCell.swift
//  promoted
//
//  Created by Vikram Sindhu on 16/12/22.
//

import UIKit

class IdealCandidateCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // corner radius
        mainView.layer.cornerRadius = 10.0

        // border
//        blueView.layer.borderWidth = 1.0
//        blueView.layer.borderColor = UIColor.black.cgColor

        // shadow
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 3, height: 3)
        mainView.layer.shadowOpacity = 0.7
        mainView.layer.shadowRadius = 4.0
        
        userImg.layer.cornerRadius = 10.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)



    }
    
    
}
