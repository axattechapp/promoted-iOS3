//
//  leftViewCell.swift
//  promoted
//
//  Created by Vikram Sindhu on 19/12/22.
//

import UIKit

class leftViewCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // corner radius
        chatView.layer.cornerRadius = 10.0
        userImg.layer.cornerRadius = 10.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)



    }
    
    
}
