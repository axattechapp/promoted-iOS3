//
//  userSubscriptionListVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit

class userSubscriptionListVC: BaseViewController2,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var listTbl: UITableView!
    @IBOutlet weak var btnUpgrade: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnUpgrade.layer.cornerRadius = 10.0
        listTbl.delegate = self
        listTbl.dataSource = self
        
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func selectClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPaymentVC") as? userPaymentVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! planCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateDetailVC") as? CandidateDetailVC
//        self.navigationController?.pushViewController(vc!, animated: false)
     
    }
    
    
    
}
