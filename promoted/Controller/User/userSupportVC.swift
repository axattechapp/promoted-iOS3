//
//  userSupportVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 27/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class userSupportVC: BaseViewController2,UITextViewDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var btnsupport: UIButton!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var tvNote: UITextView!
    
    @IBOutlet weak var tfemail: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnsupport.layer.cornerRadius = 10.0
        noteView.layer.cornerRadius = 10.0
        emailView.layer.cornerRadius = 10.0
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        emailView.layer.borderWidth = 1.0
        emailView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        tfemail.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfemail.placeholder ?? ""
        tfemail.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        addDoneButtonOnKeyboard()
    }
    
    func addDoneButtonOnKeyboard(){
          let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
          doneToolbar.barStyle = .default

          let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

          let items = [flexSpace, done]
          doneToolbar.items = items
          doneToolbar.sizeToFit()
        tvNote.inputAccessoryView = doneToolbar
      }
       
       @objc func doneButtonAction(){
           tvNote.resignFirstResponder()
           
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        noteView.isUserInteractionEnabled = true
        emailView.isUserInteractionEnabled = true
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        emailView.layer.borderWidth = 1.0
        emailView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func supportClicked(_ sender: UIButton) {
        self.ValidationSignIn()
    }
    
    func ValidationSignIn()
    {
        if String.getString(self.tfemail.text).isEmpty{
            self.showSimpleAlert(message: "Please enter your e-mail")
            return
        }
        
        else if String.getString(self.tvNote.text).isEmpty{
            self.showSimpleAlert(message: "Please enter your Question")
            return
        }
        self.userSupportAPI()
        
        
    }
}

// Mark:- Submit Api

extension userSupportVC
{
    func userSupportAPI()
    {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = [
            "email":String.getString(tfemail.text),
            "question":String.getString(tvNote.text)]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.supportQuestion,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            if errorType == .requestSuccess{
                let dictResult = kSharedInstance.getDictionary(result)  //result as! [String: Any]
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
                        self?.navigationController?.pushViewController(vc!, animated: false)
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

