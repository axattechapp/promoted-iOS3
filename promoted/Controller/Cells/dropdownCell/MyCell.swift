//
//  MyCell.swift
//  DropDown
//
//  Created by Kevin Hirsch on 17/08/16.
//  Copyright © 2016 Kevin Hirsch. All rights reserved.
//

import UIKit
import DropDown

class MyCell: DropDownCell {
	
    @IBOutlet weak var logoImageView: UIImageView!
	
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //logoImageView.image = UIImage(named: "select")

    }
}
