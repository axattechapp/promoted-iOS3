//
//  planCell.swift
//  promoted
//
//  Created by Vikram Sindhu on 20/12/22.
//

import UIKit

class planCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewImg: UIView!
    @IBOutlet weak var lblPlanName: UILabel!
    @IBOutlet weak var lblPlanType: UILabel!
    @IBOutlet weak var lblPlanRate: UILabel!
    
    
    @IBOutlet weak var lblCurrent: UILabel!
    
    @IBOutlet weak var lblNote: UILabel!
    
    
    @IBOutlet weak var lblCandidate: UILabel!
    
    @IBOutlet weak var candidateProgress: UIProgressView!
    @IBOutlet weak var lblOffer: UILabel!
    @IBOutlet weak var offerProgress: UIProgressView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // corner radius
        cardView.layer.cornerRadius = 10.0
        cardViewImg.layer.cornerRadius = 10.0
        
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    
}
