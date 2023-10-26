//
//  SendOfferVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 15/12/22.
//

import UIKit

class SendOfferVC: BaseViewController{
    
    @IBOutlet weak var btnOK: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnOK.layer.cornerRadius = 10.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func okClicked(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }

}
