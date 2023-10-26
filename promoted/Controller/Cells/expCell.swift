//
//  expCell.swift
//  procruited
//
//  Created by Vikram Sindhu on 26/06/23.
//

import UIKit

class expCell: UITableViewCell {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblExp: UILabel!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // corner radius
        view1.layer.cornerRadius = 10.0
        view2.layer.cornerRadius = 10.0
        view3.layer.cornerRadius = 10.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
