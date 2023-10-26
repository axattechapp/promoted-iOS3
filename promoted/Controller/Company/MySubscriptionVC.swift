//
//  MySubscriptionVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 20/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MySubscriptionVC: BaseViewController{
    
    @IBOutlet weak var btnUpgrade: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewImg: UIView!
    @IBOutlet weak var lblPlanName: UILabel!
    @IBOutlet weak var lblPlanRate: UILabel!
    
    @IBOutlet weak var lblCandidate: UILabel!
    
    @IBOutlet weak var candidateProgress: UIProgressView!
    
    
    var jobID = ""
    
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
        
        btnUpgrade.setTitle("CHOOSE PLAN", for: .normal)
        cardView.isHidden = true
        
        getCurrentPlanAPI()
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func upgradeClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SubscriptionListVC") as? SubscriptionListVC
        vc?.jobID = jobID
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    @IBAction func CancelClicked(_ sender: UIButton) {
    
        
    }
    
    func getCurrentPlanAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.companyCurrentPlan, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    
                    let status = String.getString(dictResult["status"])
                    
                    if status == "FAIL"{
                        self.btnUpgrade.setTitle("CHOOSE PLAN", for: .normal)
                        self.cardView.isHidden = true
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        self.jobID = ""
                    }else{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        print(data)
                        self.btnUpgrade.setTitle("CHANGE PLAN", for: .normal)
                        self.cardView.isHidden = false
                        let total = Int.getInt(data["plan_job_benefit"])
                        self.lblPlanName.text = "1 to \(total) Jobs"
                        let amount = Int.getInt(data["amount"])
                        let interval = String.getString(data["interval"])
                        self.lblPlanRate.text = "$\(amount)/\(interval)"
                        let remain = Int.getInt(data["remaining_benefit"])
                        self.lblCandidate.text = "\(remain) candidate searches left"
                        let progress = Float(remain)/Float(total)
                        self.candidateProgress.progress = progress
                        self.jobID = "\(String.getString(data["plan_id"]))"
                    }
        
                default:
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                   // CommonUtils.showError(.error, String.getString(dictResult["meassage"]))
                }
            }
            else if errorType == .noNetwork{
                CommonUtils.showToastForInternetUnavailable()
            }
            else {
               // CommonUtils.showToast(message: kDefaultErrorMsg)
                CommonUtils.showToastForDefaultError()
            }
        }
    }
    
    
}
