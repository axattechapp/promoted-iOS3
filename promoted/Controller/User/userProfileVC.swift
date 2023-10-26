//
//  userProfileVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 23/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class userProfileVC: BaseViewController2{
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
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
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var com6view: UIView!
    //@IBOutlet weak var view7: UIView!
    //@IBOutlet weak var com7view: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var com8view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.layer.cornerRadius = 10.0
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
        profImg.layer.cornerRadius = 10.0
        com1view.layer.cornerRadius = 10.0
        com2view.layer.cornerRadius = 10.0
        com3view.layer.cornerRadius = 10.0
        com4view.layer.cornerRadius = 10.0
        com5view.layer.cornerRadius = 10.0
        com6view.layer.cornerRadius = 10.0
        //com7view.layer.cornerRadius = 10.0
        com8view.layer.cornerRadius = 10.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let defaults = UserDefaults.standard
        let notificationType = defaults.value(forKey:"notificationType")
        let interview_id = defaults.value(forKey:"interview_id")
        if notificationType != nil {
            if notificationType as! String == "interview_schedule"{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OfferDetailVC") as? OfferDetailVC
                vc?.interview_id = "\(interview_id!)"
                self.navigationController?.pushViewController(vc!, animated: false)
                defaults.set(nil, forKey: "notificationType")
                defaults.synchronize()
            }else{
                
            }
        }
        
        
        
        getUserProfileAPI()
        
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        view3.isUserInteractionEnabled = true
        view4.isUserInteractionEnabled = true
        view5.isUserInteractionEnabled = true
        view6.isUserInteractionEnabled = true
        //view7.isUserInteractionEnabled = true
        view8.isUserInteractionEnabled = true
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(detailSelect))
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(expSelect))
        view2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(offerSelect))
        view3.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(jobSelect))
        view4.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(notifySelect))
        view5.addGestureRecognizer(tapGesture5)
        
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(chatSelect))
        view6.addGestureRecognizer(tapGesture6)
        
        //let tapGesture7 = UITapGestureRecognizer(target: self, action: #selector(subscSelect))
        //view7.addGestureRecognizer(tapGesture7)
        
        let tapGesture8 = UITapGestureRecognizer(target: self, action: #selector(faqSelect))
        view8.addGestureRecognizer(tapGesture8)
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
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
    
    
    @objc func detailSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userDetailVC") as? userDetailVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func expSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userExperienceVC") as? userExperienceVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func offerSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userOfferVC") as? userOfferVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func jobSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userJobSettingVC") as? userJobSettingVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func notifySelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userNotificationMenuVC") as? userNotificationMenuVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @objc func chatSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userChatListVC") as? userChatListVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
//    @objc func subscSelect() {
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPortfolioUpgradeVC") as? userPortfolioUpgradeVC
//        self.navigationController?.pushViewController(vc!, animated: false)
//    }
    
    @objc func faqSelect() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userFAQVC") as? userFAQVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    func getUserProfileAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.userProfile, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        
                        self.profImg.kf.setImage(with: url)
                        //self.profImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                        self.lblName.text = "\(String.getString(data["first_name"])) \(String.getString(data["last_name"]))"
                        let email = String.getString(data["email"])
                        let phone = String.getString(data["phone"])
                        self.lblContact.text = "\(email) | \(phone)"
                        self.lblJob.text = String.getString(data["position"])
//                        let salary = String.getString(data["position"])
//                        let salaryArr = salary.components(separatedBy: ",")
//                        let firstsalary: String = salaryArr[0]
//                        self!.lblJob.text = firstsalary
                        if String.getString(data["portfolio"]) != ""{
                            UserDefaults.standard.setValue(true, forKey: "portfolio")
                            UserDefaults.standard.synchronize()
                        }else{
                            if Int.getInt(data["portfolio_unlocked"]) == 1{
                                UserDefaults.standard.setValue(true, forKey: "portfolio")
                                UserDefaults.standard.synchronize()
                            }else{
                                UserDefaults.standard.setValue(false, forKey: "portfolio")
                                UserDefaults.standard.synchronize()
                            }
                        }
                        
                        if String.getString(data["video"]) != ""{
                            UserDefaults.standard.setValue(true, forKey: "video")
                            UserDefaults.standard.synchronize()
                        }else{
                            if Int.getInt(data["video_unlocked"]) == 1{
                                UserDefaults.standard.setValue(true, forKey: "video")
                                UserDefaults.standard.synchronize()
                            }else{
                                UserDefaults.standard.setValue(false, forKey: "video")
                                UserDefaults.standard.synchronize()
                            }
                        }
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
