//
//  rightImageCell.swift
//  procruited
//
//  Created by Vikram Sindhu on 21/06/23.
//

import UIKit

class rightImageCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var msg: UIImageView!
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
