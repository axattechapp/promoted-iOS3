//
//  SubscriptionListVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 20/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class SubscriptionListVC: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var listTbl: UITableView!
    @IBOutlet weak var btnUpgrade: UIButton!
    
    @IBOutlet weak var onecardView: UIView!
    @IBOutlet weak var onecardViewImg: UIView!
    @IBOutlet weak var onelblPlanName: UILabel!
    @IBOutlet weak var onelblPlanRate: UILabel!
    
    var planListArr = [planListingModal]()
    var palnFlag = 0
    var jobID = ""
    var planAmt = Int()
    var planId = String()
    var singleAmt = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnUpgrade.layer.cornerRadius = 10.0
        listTbl.delegate = self
        listTbl.dataSource = self
        onecardView.layer.cornerRadius = 10.0
        onecardViewImg.layer.cornerRadius = 10.0
        
        // shadow
        onecardView.layer.shadowColor = UIColor.black.cgColor
        onecardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        onecardView.layer.shadowOpacity = 0.7
        onecardView.layer.shadowRadius = 4.0
        if jobID != ""{
            planId = jobID
        }else{
            planId = ""
        }
        
        getSinglePlanAPI()
        getCompanyPlanListAPI()
        
        
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func oneTimePaymentClicked(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyPaymentVC") as? CompanyPaymentVC
        vc?.planId = ""
        vc?.amount = singleAmt
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    @IBAction func selectClicked(_ sender: UIButton) {
        
        if jobID == ""{
            if planId == "" {
                let alert = UIAlertController(title: "Procruited", message: "Please Select A Plan", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyPaymentVC") as? CompanyPaymentVC
                vc?.planId = planId
                vc?.amount = planAmt
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        }else{
            
            if jobID == planId {
                let alert = UIAlertController(title: "Procruited", message: "Current Plan! Please Select Another Plan", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyPaymentVC") as? CompanyPaymentVC
                vc?.planId = planId
                vc?.amount = planAmt
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        
    }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! planCell
        
        let obj = planListArr[indexPath.row]
        
        if jobID == ""{
            cell.lblCurrent.isHidden = true
        }else if obj.plan_id != jobID{
            cell.lblCurrent.isHidden = true
        }else{
            cell.lblCurrent.isHidden = false
        }
        
        if planId == obj.plan_id {
            cell.cardView.backgroundColor = UIColor(hexString: "0E7280")
            cell.lblPlanName.textColor = .white
            cell.lblPlanRate.textColor = .white
            cell.lblCandidate.textColor = .white
            cell.lblNote.textColor = .white
            cell.candidateProgress.progressTintColor = .white
        }else{
            
            cell.cardView.backgroundColor = .white
            cell.lblPlanName.textColor = UIColor(hexString: "484848")
            cell.lblPlanRate.textColor = UIColor(hexString: "484848")
            cell.lblCandidate.textColor = UIColor(hexString: "6C6C6C")
            cell.lblNote.textColor = UIColor(hexString: "6C6C6C")
            cell.candidateProgress.progressTintColor = UIColor(hexString: "0E7280")
            
        }
        
        let total = Int.getInt(obj.job_count)
        cell.lblPlanName.text = "1 to \(total) Jobs"
        let amount = Int.getInt(obj.amount)
        let interval = String.getString(obj.interval)
        cell.lblPlanRate.text = "$\(amount)/\(interval)"
        let remain = Int.getInt(obj.job_count)
        cell.lblCandidate.text = "\(remain) candidate searches"
        cell.candidateProgress.progress = 100.0
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let obj = planListArr[indexPath.row]
        planId = obj.plan_id!
        planAmt = obj.amount!
        listTbl.reloadData()
     
    }
    
    
    func getCompanyPlanListAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.companyPlanList, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                        print(datashow)
                        
                        self.planListArr.removeAll()
                        self.planListArr = datashow.map{planListingModal(data: $0)}
                        
                        self.listTbl.reloadData()
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
    
    
    func getSinglePlanAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.singlejobPlan, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        self.singleAmt = Int.getInt(data["amount"])
                        self.onelblPlanRate.text = "$\(self.singleAmt)/job post"
                        
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
