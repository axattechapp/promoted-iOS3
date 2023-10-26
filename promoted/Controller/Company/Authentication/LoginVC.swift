//
//  LoginVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 09/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class LoginVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    var iconClick = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.layer.cornerRadius = 10.0
        tfPassword.layer.cornerRadius = 10.0
        loginBtn.layer.cornerRadius = 10.0
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfPassword.placeholder ?? ""
        tfPassword.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfEmail.placeholder ?? ""
        tfEmail.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        tfEmail.delegate = self
        tfPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func forgotClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "forgotVC") as? forgotVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        self.ValidationSignIn()
    }
    
    
    @IBAction func eyeClicked(_ sender: UIButton) {
        if iconClick {
            tfPassword.isSecureTextEntry = false
            } else {
                tfPassword.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    
    
    
    func ValidationSignIn()
         {
             if String.getString(self.tfEmail.text).isEmpty{
                 self.showSimpleAlert(message: Notifications.KEmailOrMobileNumber)
                 return
             }
          
             else if String.getString(self.tfPassword.text).isEmpty{
                 self.showSimpleAlert(message: Notifications.kPassword)
                 return
                }
             self.LoginApi()
         
         }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "urole")
        UserDefaults.standard.set(nil, forKey: "uprofileImage")
        UserDefaults.standard.set(nil, forKey: "ComuserName")
        UserDefaults.standard.set(nil, forKey: "ComuserLast")
        UserDefaults.standard.set(nil, forKey: "comEmail")
        UserDefaults.standard.set(nil, forKey: "comPass")
        UserDefaults.standard.set(nil, forKey: "ComName")
        UserDefaults.standard.set(nil, forKey: "comType")
        UserDefaults.standard.set(nil, forKey: "comABN")
        UserDefaults.standard.set(nil, forKey: "comcity")
        UserDefaults.standard.set(nil, forKey: "comFromTimeValue")
        UserDefaults.standard.set(nil, forKey: "comToTimeValue")
        UserDefaults.standard.set(nil, forKey: "comFromDayValue")
        UserDefaults.standard.set(nil, forKey: "comToDayValue")
        UserDefaults.standard.set(nil, forKey: "permission")
        UserDefaults.standard.set(nil, forKey: "comJobType")
        UserDefaults.standard.set(nil, forKey: "comIndustryValue")
        UserDefaults.standard.set(nil, forKey: "comindustryid")
        UserDefaults.standard.set(nil, forKey: "comRoleValue")
        UserDefaults.standard.set(nil, forKey: "comsalaryValue")
        UserDefaults.standard.set(nil, forKey: "comlengthValue")
        UserDefaults.standard.set(nil, forKey: "ComexpFlag")
        UserDefaults.standard.set(nil, forKey: "comEduFlag")
        UserDefaults.standard.set(nil, forKey: "comProFlag")
        UserDefaults.standard.set(nil, forKey: "compreferTitle")
        UserDefaults.standard.set(nil, forKey: "compreferIssue")
        UserDefaults.standard.set(nil, forKey: "comcertFlag")
        
        UserDefaults.standard.synchronize()
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupVC1") as? SignupVC1
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

// Mark:- Login Api

extension LoginVC
{
    func LoginApi()
    {
        CommonUtils.showHudWithNoInteraction(show: true)
        let deviceid = UserDefaults.standard.value(forKey:"DeviceId")
       let devicetoken = UserDefaults.standard.value(forKey:"DeviceToken")
        let params:[String:Any] = [
            "email":String.getString(tfEmail.text),
            "password":String.getString(tfPassword.text),"device_token":"\(devicetoken!)","device_id":"\(deviceid!)","device_type":"2"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.login,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            if errorType == .requestSuccess{
                let dictResult = kSharedInstance.getDictionary(result)  //result as! [String: Any]
                switch Int.getInt(statusCode) {
                case 200:
                    let status = String.getString(dictResult["status"])
                    if status == "SUCCESS"{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        let detail = kSharedInstance.getDictionary(data["details"])
                        kSharedUserDefaults.setLoggedInAccessToken(loggedInAccessToken: String.getString(dictResult[kLoggedInAccessToken]))
                        //String.getString(dictResult["token"])
                        let tokenValue = String.getString(data["access_token"])
                        kSharedUserDefaults.setLoggedInAccessToken(loggedInAccessToken: tokenValue)
                        let role = String.getString(detail["role"])
                        
                        UserDefaults.standard.set(role, forKey: "role")
                        UserDefaults.standard.set(self?.tfEmail.text, forKey: "email")
                        UserDefaults.standard.set(self?.tfPassword.text, forKey: "password")
                        UserDefaults.standard.setValue(true, forKey: kIsLogin)
                        UserDefaults.standard.synchronize()
                        
                        if role == "job_seeker"{
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
                            self?.navigationController?.pushViewController(vc!, animated: false)
                        }
                        else{
                            let compnayName = String.getString(detail["company_name"])
                            UserDefaults.standard.set(compnayName, forKey: "compnayName")
                            UserDefaults.standard.synchronize()
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
                            self?.navigationController?.pushViewController(vc!, animated: false)
                        }
                    }
                    else {
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }
                    
                default:
                    // CommonUtils.showToast(message: String.getString(dictResult["message"]))
                    //  CommonUtils.showError(.error, String.getString(dictResult["message"]))
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                }
            }
            else if errorType == .noNetwork{
                //CommonUtils.showToast(message: kNoInternetMsg)
                CommonUtils.showToastForInternetUnavailable()
                
            }
            else {
                // CommonUtils.showToast(message: kDefaultErrorMsg)
                CommonUtils.showToastForDefaultError()
            }
        }
        
    }
}
