//
//  UserOTPVC.swift
//  Procruited
//
//  Created by Vikram Sindhu on 10/10/23.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class UserOTPVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var resendBtn: UIButton!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    
    
    @IBOutlet weak var otpOneTextField: UITextField!
    @IBOutlet weak var otpTwoTextField: UITextField!
    @IBOutlet weak var otpThreeTextField: UITextField!
    @IBOutlet weak var otpFourTextField: UITextField!
    @IBOutlet weak var otpFiveTextField: UITextField!
    @IBOutlet weak var otpSixTextField: UITextField!
    
    @IBOutlet weak var lblOtpOne: UILabel!
    @IBOutlet weak var lblOtpTwo: UILabel!
    @IBOutlet weak var lblOtpThree: UILabel!
    @IBOutlet weak var lblOtpFour: UILabel!
    @IBOutlet weak var lblOtpFive: UILabel!
    @IBOutlet weak var lblOtpSix: UILabel!
    
    
    var otp = ""
    var profile:UIImage?
    var Name: String?
    var lastName: String?
    var email: String?
    var Password: String?
    var Phone: String?
    var Address: String?
    var countryCode : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNumber.text = "To create your account lets first verify that this is your phone number \(countryCode!)\(Phone!)"
        nextBtn.layer.cornerRadius = 10.0
        resendBtn.layer.cornerRadius = 10.0
        otpOneTextField.delegate = self
        otpTwoTextField.delegate = self
        otpThreeTextField.delegate = self
        otpFourTextField.delegate = self
        otpFiveTextField.delegate = self
        otpSixTextField.delegate = self
        
        otpOneTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        otpTwoTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        otpThreeTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        otpFourTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        otpFiveTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
       
        otpSixTextField.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        otpOneTextField.becomeFirstResponder()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
          if  text?.count == 1 {
             switch textField{
                  case otpOneTextField:
                    otpTwoTextField.becomeFirstResponder()
                      lblOtpOne.backgroundColor =  UIColor.lightGray
                  case otpTwoTextField:
                    otpThreeTextField.becomeFirstResponder()
                    lblOtpTwo.backgroundColor =  UIColor.lightGray
                  case otpThreeTextField:
                    otpFourTextField.becomeFirstResponder()
                    lblOtpThree.backgroundColor =  UIColor.lightGray
                  case otpFourTextField:
                    otpFiveTextField.becomeFirstResponder()
                    lblOtpFour.backgroundColor =  UIColor.lightGray
                  case otpFiveTextField:
                    otpSixTextField.becomeFirstResponder()
                    lblOtpFive.backgroundColor =  UIColor.lightGray
             case otpSixTextField:
               otpSixTextField.resignFirstResponder()
               lblOtpSix.backgroundColor =  UIColor.lightGray
                // self.dismissKeyboard()
                  default:
                      break
                  }
              }
              if  text?.count == 0 {
                  switch textField{
                  case otpOneTextField:
                       otpOneTextField.becomeFirstResponder()
                       lblOtpOne.backgroundColor =  UIColor.black
                  case otpTwoTextField:
                       otpOneTextField.becomeFirstResponder()
                       lblOtpTwo.backgroundColor =  UIColor.black
                  case otpThreeTextField:
                       otpTwoTextField.becomeFirstResponder()
                       lblOtpThree.backgroundColor =  UIColor.black
                  case otpFourTextField:
                       otpThreeTextField.becomeFirstResponder()
                       lblOtpFour.backgroundColor =  UIColor.black
                  case otpFiveTextField:
                    otpFourTextField.becomeFirstResponder()
                    lblOtpFive.backgroundColor =  UIColor.black
                  case otpSixTextField:
                    otpFiveTextField.becomeFirstResponder()
                    lblOtpSix.backgroundColor =  UIColor.black
                  default:
                      break
                  }
              }
          }
    
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnResendClicked(_ sender: UIButton) {
        GetResendOtp()
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        self.otp = String.getString(self.otpOneTextField.text) + String.getString(self.otpTwoTextField.text) + String.getString(self.otpThreeTextField.text) + String.getString(self.otpFourTextField.text) + String.getString(self.otpFiveTextField.text) + String.getString(self.otpSixTextField.text)
        
        GetnumberValid()
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignupVC2") as? userSignupVC2
//        vc?.profile = profile
//        vc?.Name = Name
//        vc?.lastName = lastName
//        vc?.email = email
//        vc?.Password = Password
//        vc?.Phone = "\(countryCode!)\(Phone!)"
//        vc?.Address = Address
//        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    // MARK: - mobile number valid or not
    func GetResendOtp()  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["phone":"\(Phone!)","country_code":"\(countryCode!)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.resendOtp, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = "\(dictResult["status"]!)"
                    if status == "FAIL"{
                        //Toast(text:"\(dictResult["message"]!)").show()
                        self.showSimpleAlert(message: String.getString(dictResult["message"]))
                        //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        //self.tfphone.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        Toast(text:"\(dictResult["message"]!)").show()
                        //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }
        
                default:
                    
                    print("")
                    //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
    
    
    // MARK: - mobile number valid or not
    func GetnumberValid()  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["phone":"\(Phone!)","country_code":"\(countryCode!)","otp":"\(self.otp)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.verifyOtp, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = "\(dictResult["status"]!)"
                    if status == "FAIL"{
                        //Toast(text:"\(dictResult["message"]!)").show()
                        self.showSimpleAlert(message: String.getString(dictResult["message"]))
                        //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        self.view.endEditing(true)
                    }
                    else{
                        //Toast(text:"\(dictResult["message"]!)").show()
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignupVC2") as? userSignupVC2
                        vc?.profile = self.profile
                        vc?.Name = self.Name
                        vc?.lastName = self.lastName
                        vc?.email = self.email
                        vc?.Password = self.Password
                        vc?.Phone = self.Phone
                        vc?.Address = self.Address
                        self.navigationController?.pushViewController(vc!, animated: false)
                    }
        
                default:
                    
                    print("")
                    //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
