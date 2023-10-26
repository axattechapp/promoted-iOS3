//
//  CompanyProfileVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 16/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class CompanyProfileVC: BaseViewController{
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var companyImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnNewJobListing: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var com1view: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var com2view: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var com3view: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var com4view: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var com5view: UIView!
//    @IBOutlet weak var view6: UIView!
//    @IBOutlet weak var com6view: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var com7view: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.layer.cornerRadius = 10.0
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
        
        btnSearch.layer.cornerRadius = 10.0
        btnNewJobListing.layer.cornerRadius = 10.0
        com1view.layer.cornerRadius = 10.0
        com2view.layer.cornerRadius = 10.0
        com3view.layer.cornerRadius = 10.0
        com4view.layer.cornerRadius = 10.0
        com5view.layer.cornerRadius = 10.0
        //com6view.layer.cornerRadius = 10.0
        com7view.layer.cornerRadius = 10.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        getCompanyProfileAPI()
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        view3.isUserInteractionEnabled = true
        view4.isUserInteractionEnabled = true
        view5.isUserInteractionEnabled = true
        //view6.isUserInteractionEnabled = true
        view7.isUserInteractionEnabled = true
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(searchSelect))
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(shortlistSelect))
        view2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(infoSelect))
        view3.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(notifySelect))
        view4.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(chatSelect))
        view5.addGestureRecognizer(tapGesture5)
        
//        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(subscSelect))
//        view6.addGestureRecognizer(tapGesture6)
        
        let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(faqSelect))
        view7.addGestureRecognizer(tapGesture7)
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    
    @IBAction func searchClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CurrentJobListVC") as? CurrentJobListVC
        vc?.type = "Search"
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func newJobListingClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IdealCandidateVC2") as? IdealCandidateVC2
        vc?.newFlag = true
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func logOutClicked(_ sender: UIButton) {
        
        logout()
    }
    
    func logout(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.logout, requestMethod: .POST, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        print(data)
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        UserDefaults.standard.setValue(false, forKey: kIsLogin)
                        UserDefaults.standard.synchronize()
                        self.navigationController?.popToRootViewController(animated: true)
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
    
    
    
    @objc func searchSelect() {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IdealCandidateVC") as? IdealCandidateVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func shortlistSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CurrentJobListVC") as? CurrentJobListVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func infoSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyinfoVC") as? CompanyinfoVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func notifySelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationMenuVC") as? NotificationMenuVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func chatSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatJobListVC") as? ChatJobListVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
//    @objc func subscSelect() {
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MySubscriptionVC") as? MySubscriptionVC
//        self.navigationController?.pushViewController(vc!, animated: false)
//    }
    
    @objc func faqSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyFAQVC") as? CompanyFAQVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    func getCompanyProfileAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.companyProfile, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        
                        
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        print(data)
                        let imageurl =  String.getString(data["profile_image"])
                        let url = URL(string: "\(imageurl.removeWhitespace())")
                        
                        self.companyImage.kf.setImage(with: url)
                        self.lblName.text = String.getString(data["company_name"])
                        
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
