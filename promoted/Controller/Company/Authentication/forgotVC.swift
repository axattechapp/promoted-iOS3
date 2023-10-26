//
//  forgotVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 25/01/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class forgotVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet  weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.layer.cornerRadius = 10.0
        sendBtn.layer.cornerRadius = 10.0
        tfEmail.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder2 = tfEmail.placeholder ?? ""
        tfEmail.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forgotClicked(_ sender: UIButton) {
        ValidationSignIn()
    }
    
    func ValidationSignIn()
         {
             if String.getString(self.tfEmail.text).isEmpty{
                 self.showSimpleAlert(message: Notifications.KEmailOrMobileNumber)
                 return
             }
             self.ForgotApi()
         
         }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func ForgotApi()
    {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = [
            "email":String.getString(tfEmail.text)]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.forgotPassword,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            if errorType == .requestSuccess{
                let dictResult = kSharedInstance.getDictionary(result)  //result as! [String: Any]
                switch Int.getInt(statusCode) {
                case 200:
                    let status = String.getString(dictResult["status"])
                    if status == "SUCCESS"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        self?.navigationController?.popViewController(animated: true)
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
