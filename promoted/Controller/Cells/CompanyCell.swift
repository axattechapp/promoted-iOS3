//
//  CompanyCell.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var companyDetail: UILabel!
    @IBOutlet weak var contact: UILabel!
    
    @IBOutlet weak var countView: UIView!
    
    @IBOutlet weak var count: UILabel!
    
    
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
