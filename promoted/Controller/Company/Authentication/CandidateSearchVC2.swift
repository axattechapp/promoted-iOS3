//
//  CandidateSearchVC2.swift
//  promoted
//
//  Created by Vikram Sindhu on 13/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class CandidateSearchVC2: UIViewController, UITextViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var btnRelocateYes: UIButton!
    @IBOutlet weak var btnRelocateNo: UIButton!
    @IBOutlet weak var btnRelocateDicuss: UIButton!
    
    @IBOutlet weak var btnInHouse: UIButton!
    @IBOutlet weak var btnRemote: UIButton!
    @IBOutlet weak var btnHybrid: UIButton!
    @IBOutlet weak var btnDiscuss: UIButton!
    
    @IBOutlet weak var noteView: UIView!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    var relocateFlag = String()
    var workFlag = 0
    var role: String?
    var profile:UIImage?
    var Name: String?
    var lastname: String?
    var email: String?
    var Password: String?
    var companyName: String?
    var companyType: String?
    var abn: String?
    var companyAddress: String?
    var fromTime:String?
    var toTime:String?
    var fromDay:String?
    var toDay:String?
    var role_avail: String?
    var industry: String?
    var job_role: String?
    var position: String?
    var salary: String?
    var contractLength: String?
    var preferExperince: String?
    var preferEducation: String?
    var preferAccreditation: String?
    var preferTitle: String?
    var preferIssuer: String?
    var PreferCertificate: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        noteTextView.inputAccessoryView = toolBar()
        nextBtn.layer.cornerRadius = 10.0
        noteView.layer.cornerRadius = 10.0
        
        btnRelocateYes.layer.cornerRadius = 10.0
        btnRelocateNo.layer.cornerRadius = 10.0
        btnRelocateDicuss.layer.cornerRadius = 10.0
        
        btnInHouse.layer.cornerRadius = 10.0
        btnRemote.layer.cornerRadius = 10.0
        btnHybrid.layer.cornerRadius = 10.0
        btnDiscuss.layer.cornerRadius = 10.0
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
        
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if relocateFlag == "" {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer Willing to relocate?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if workFlag == 0 {
            let alert = UIAlertController(title: "Procruited", message: "Please Select work model", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            CompanyRegisterApi()
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchingLoadVC") as? MatchingLoadVC
//            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func relocateYesClicked(_ sender: UIButton) {
        relocateFlag = "1"
        btnRelocateYes.setImage(UIImage(named: "select"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func relocateNoClicked(_ sender: UIButton) {
        relocateFlag = "0"
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "select"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func relocateDiscussClicked(_ sender: UIButton) {
        relocateFlag = "2"
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "select"), for: .normal)
    }
    
    @IBAction func inHouseClicked(_ sender: UIButton) {
        workFlag = 1
        btnInHouse.setImage(UIImage(named: "select"), for: .normal)
        btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
        btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func remoteClicked(_ sender: UIButton) {
        workFlag = 2
        btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
        btnRemote.setImage(UIImage(named: "select"), for: .normal)
        btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func hybridClicked(_ sender: UIButton) {
        workFlag = 3
        btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
        btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
        btnHybrid.setImage(UIImage(named: "select"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func discussionClicked(_ sender: UIButton) {
        workFlag = 4
        btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
        btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
        btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "select"), for: .normal)
    }
    
   
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if noteTextView.text.count <= 200
//            {
//                // Code here
//            }
//            else
//            {
//                //Code Here
//                noteTextView.endEditing(true)
//                let alert = UIAlertController(title: "Procruited", message: "Max 200 words Reached!", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
            return true
        }
    

}

//MARK: - MObileNumberApi

extension CandidateSearchVC2{
    
    func CompanyRegisterApi(){
        CommonUtils.showHudWithNoInteraction(show: true)
        let deviceid = UserDefaults.standard.value(forKey:"DeviceId")
       let devicetoken = UserDefaults.standard.value(forKey:"DeviceToken")
        print(".........profilePic...........")
            var params = [String:Any]()
        params = ["role":role!,"first_name":Name!,"last_name":lastname!,"email":email!, "password":Password!, "company_name":companyName!,"company_type":companyType!,"abn":abn!, "city_state_postcode":companyAddress!, "role_available":role_avail!,"industry":industry!, "position":position!, "salary":salary!,"contract_length":contractLength!, "prefer_previous_experience":preferExperince!, "preferred_educational_level":preferEducation!, "prefer_professional_accreditation":preferAccreditation!, "preferred_title":preferTitle!, "prefereed_is_user":preferIssuer!,"prefer_uploaded_certificate":PreferCertificate!, "willing_to_relocate":"\(relocateFlag)","work_model":"\(workFlag)","anything_else_for_job":noteTextView.text!, "device_token":"\(devicetoken!)","device_id":"\(deviceid!)","device_type":"2","company_availibilty_from":fromTime!,"company_availibilty_to":toTime!,"company_availibilty_day_from":fromDay!, "company_availibilty_day_to":toDay!
            ]
        print(params)
            
            let uploadimage:[String:Any] = ["imageName":"profile_image","image": self.profile ?? UIImage()]
                    
            ONetworkManager.sharedInstance.requestMultiPart(withServiceName:ServiceName.companyRegister, requestMethod: .post, requestImages: [uploadimage], requestVideos: [:], requestData:params)
            { (result:Any?, error:Error?, errortype:ErrorType?, statusCode:Int?) in
                CommonUtils.showHudWithNoInteraction(show: false)
                if errortype == .requestSuccess {
                    let dictdata = kSharedInstance.getDictionary(result)
                    print(dictdata)
                    switch Int.getInt(statusCode) {
                    case 200:
                        let staus  = String.getString(dictdata["status"])
                        if staus == "SUCCESS"
                        {
                           // self.showSimpleAlert(message: "profile pic updated successfully" )
                           // self.view.makeToast("This is a piece of toast", duration: 3.0, position: .top)
                            
                            let dictResult = kSharedInstance.getDictionary(dictdata["data"])
                            let detail = kSharedInstance.getDictionary(dictResult["details"])
                            let tokenValue = String.getString(dictResult["access_token"])
                            kSharedUserDefaults.setLoggedInAccessToken(loggedInAccessToken: tokenValue)
                            // self.dismissHUD(isAnimated: true)
                            
                            let role = String.getString(detail["role"])
                            let company = String.getString(detail["company_name"])

                            UserDefaults.standard.set(role, forKey: "role")
                            UserDefaults.standard.set(company, forKey: "compnayName")
                            UserDefaults.standard.set(self.email, forKey: "email")
                            UserDefaults.standard.set(self.Password, forKey: "password")
                            UserDefaults.standard.setValue(true, forKey: kIsLogin)
                            UserDefaults.standard.synchronize()
                                        
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchingLoadVC") as? MatchingLoadVC
                            vc!.signupFlag = true
                            vc!.jobid = Int.getInt(detail["job_listing_id"])
                            self.navigationController?.pushViewController(vc!, animated: false)
                            
                        }else{
                            Toast(text:String.getString(dictdata["message"]), duration: Delay.long).show()
                        }
                        
                    default:
                     Toast(text:String.getString(dictdata["message"]), duration: Delay.long).show()
                        //CommonUtils.showError(.info, String.getString(dictResult["message"]))
                    }
                } else if errortype == .noNetwork {
                    CommonUtils.showToastForInternetUnavailable()
                } else {
                    CommonUtils.showToastForDefaultError()
                }
            }
        }
}
