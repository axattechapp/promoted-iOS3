//
//  OfferDetailVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class OfferDetailVC: BaseViewController2{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnAccept: UIButton!
    
    
    @IBOutlet weak var btnAlternative: UIButton!
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMatch: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    
    @IBOutlet weak var lblCompany: UILabel!
    
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var lblDays: UILabel!
    
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    var interview_id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        btnAccept.isHidden = true
        btnAccept.isUserInteractionEnabled = false
        btnAccept.layer.cornerRadius = 10.0
        btnAlternative.isHidden = true
        btnAlternative.isUserInteractionEnabled = false
        btnAlternative.layer.cornerRadius = 10.0
        bottomConstraint.constant = 13.0
        scrollView.layer.cornerRadius = 10.0
        cardView.layer.cornerRadius = 10.0
        getMatchedInterviewdetailAPI()
    }
    
    
    
    @IBAction func AcceptClicked(_ sender: UIButton) {
        
        AcceptInterviewAPi()
    }
    
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func AlternativeClicked(_ sender: UIButton) {
        //The recruiter has been notified and will be in touch with you to discuss a new time.
        RescheduleInterviewAPi()
        
    }
    
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        
        onSlideMenuButtonPressed(sender)
        
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    func getMatchedInterviewdetailAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        let params:[String:Any] = [
            "interview_id":"\(interview_id)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.matchedInterviewDetail,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        
                        let imageurl = String.getString(data["profile_image"])
                        print(imageurl)
                        let url = URL(string: "\(imageurl.removeWhitespace())")
                        
                        self!.profileImg.kf.setImage(with: url)
                        //self!.profileImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                        self!.lblName.text = String.getString(data["position"])
                        let status = Int.getInt(data["status"])
                        if status == 1 {
                            self?.btnAccept.isHidden = true
                            self?.btnAccept.isUserInteractionEnabled = false
                            self?.btnAlternative.isHidden = true
                            self?.btnAlternative.isUserInteractionEnabled = false
                            self?.bottomConstraint.constant = 13.0
                        }else{
                            self?.btnAccept.isHidden = false
                            self?.btnAccept.isUserInteractionEnabled = true
                            self?.btnAlternative.isHidden = false
                            self?.btnAlternative.isUserInteractionEnabled = true
                            self?.bottomConstraint.constant = 195.0
                        }
                        
                        let secjob = String.getString(data["job_type"])
                        
                        if secjob == "1"{
                            self?.lblJob.text = "Part-Time"
                        }else if secjob == "2"{
                            self?.lblJob.text = "Full-Time"
                        }else if secjob == "3"{
                            self?.lblJob.text = "Contract"
                        }else if secjob == "4"{
                            self?.lblJob.text = "Casual"
                        }else if secjob == "5"{
                            self?.lblJob.text = "Temporary"
                        }else{
                            self?.lblJob.text = " "
                        }
                        
                        
                        if String.getString(data["company_name"]) == ""{
                            if String.getString(data["city_state_postcode"]) == ""{
                                self?.lblCompany.text = ""
                            }else{
                                self?.lblCompany.text = "\(String.getString(data["city_state_postcode"]))"
                            }
                        }else{
                            if String.getString(data["city_state_postcode"]) == ""{
                                self?.lblCompany.text = "\(String.getString(data["company_name"]))"
                            }else{
                                self?.lblCompany.text = "\(String.getString(data["company_name"])) | \(String.getString(data["city_state_postcode"]))"
                            }
                        }
                        
                        if String.getString(data["company_email"]) == ""{
                            if String.getString(data["phone"]) == ""{
                                self?.lblContact.text = ""
                            }else{
                                self?.lblContact.text = "\(String.getString(data["phone"]))"
                            }
                        }else{
                            if String.getString(data["phone"]) == ""{
                                self?.lblContact.text = "\(String.getString(data["company_email"]))"
                            }else{
                                self?.lblContact.text = "\(String.getString(data["company_email"])) | \(String.getString(data["phone"]))"
                            }
                        }
                        
                        self?.lblContact.text = "\(String.getString(data["company_email"])) | \(String.getString(data["phone"]))"
                        self?.lblDays.text = "\(String.getString(data["date"]))  \(String.getString(data["time_available"]))"
                        self?.lblMatch.text = "Profile match \(String.getString(data["percentage"]))%"
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
    
    func AcceptInterviewAPi(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        //type_of_notification,to,notes
        let params:[String:Any] = ["interview_id":interview_id, "is_accept":"1"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.acceptInterview, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                let status = String.getString(dictResult["status"])
                
                if status == "SUCCESS"{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "acceptOfferVC") as? acceptOfferVC
                    self.navigationController?.pushViewController(vc!, animated: false)
                }else{
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
    
    
    func RescheduleInterviewAPi(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        //type_of_notification,to,notes
        let params:[String:Any] = ["interview_id":interview_id]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.rescheduleInreview, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                let status = String.getString(dictResult["status"])
                
                if status == "SUCCESS"{
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
//                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "acceptOfferVC") as? acceptOfferVC
//                    self.navigationController?.pushViewController(vc!, animated: false)
                }else{
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
