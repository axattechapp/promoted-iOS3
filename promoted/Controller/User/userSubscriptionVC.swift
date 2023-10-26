//
//  userSubscriptionVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit

class userSubscriptionVC: BaseViewController2{
    
    @IBOutlet weak var btnUpgrade: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewImg: UIView!
    @IBOutlet weak var lblPlanName: UILabel!
    @IBOutlet weak var lblPlanType: UILabel!
    @IBOutlet weak var lblPlanRate: UILabel!
    
    @IBOutlet weak var lblPortfolio: UILabel!
    
    @IBOutlet weak var portfolioProgress: UIProgressView!
    @IBOutlet weak var lblVideo: UILabel!
    @IBOutlet weak var videoProgress: UIProgressView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnUpgrade.layer.cornerRadius = 10.0
        btnCancel.layer.cornerRadius = 10.0
        cardView.layer.cornerRadius = 10.0
        cardViewImg.layer.cornerRadius = 10.0
        
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func upgradeClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSubscriptionListVC") as? userSubscriptionListVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    @IBAction func CancelClicked(_ sender: UIButton) {
    
        
    }
    
    
}
