//
//  userPaymentVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Foundation
import Stripe

class userPaymentVC: BaseViewController2,UITextFieldDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var btnPayment: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tfCard: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var expiryView: UIView!
    @IBOutlet weak var tfExpiry: UITextField!
    @IBOutlet weak var cvvView: UIView!
    @IBOutlet weak var tfCvv: UITextField!
    
    
    var videoFlag = Int()
    var PortFlag = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfCard.inputAccessoryView = toolBar()
        tfCvv.inputAccessoryView = toolBar()
        tfName.inputAccessoryView = toolBar()
        tfExpiry.inputAccessoryView = toolBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnPayment.layer.cornerRadius = 10.0
        btnCancel.layer.cornerRadius = 10.0
        
        cardView.layer.cornerRadius = 10.0
        cardView.layer.borderWidth = 1.0
        cardView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        nameView.layer.cornerRadius = 10.0
        nameView.layer.borderWidth = 1.0
        nameView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        expiryView.layer.cornerRadius = 10.0
        expiryView.layer.borderWidth = 1.0
        expiryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        cvvView.layer.cornerRadius = 10.0
        cvvView.layer.borderWidth = 1.0
        cvvView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        tfCard.delegate = self
        tfCvv.delegate = self
        tfExpiry.delegate = self
        tfName.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfCard.placeholder ?? ""
        tfCard.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfCvv.placeholder ?? ""
        tfCvv.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfExpiry.placeholder ?? ""
        tfExpiry.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tfName.placeholder ?? ""
        tfName.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        
        self.tfCard.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func selectClicked(_ sender: UIButton) {
        
        if self.tfCard.text == ""{
            Toast(text:"Please enter card number",duration:Delay.long).show()
        }
        else if self.tfName.text == ""{
            Toast(text:"Please enter cardholder name",duration:Delay.long).show()
        }
        else if self.tfExpiry.text == "" {
            Toast(text:"Please enter card expiry month and year",duration:Delay.long).show()
        }
        else if self.tfExpiry.text!.count < 5{
            Toast(text:"Please enter valid card expiry month and year",duration:Delay.long).show()
        }
        else if self.tfCvv.text == ""{
            Toast(text:"Please enter card CVV",duration:Delay.long).show()
        }
        else if self.tfCvv.text!.count < 3 {
            Toast(text:"Please enter valid card CVV",duration:Delay.long).show()
        }
        else{
            GetStripeToken()
        }
    }
    
    
    //MARK:- GetStripeToken
    
    func GetStripeToken()
    {
        let cardParams = STPCardParams()
        let fullName    = tfExpiry.text
        let fullNameArr = fullName!.components(separatedBy: "/")

        let month    = fullNameArr[0]
        let year = fullNameArr[1]
        cardParams.number = "\(self.tfCard.text!.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil))"
               cardParams.expMonth = UInt(month)!
               cardParams.expYear = UInt(year)!
               cardParams.cvc = self.tfCvv.text!
               cardParams.name = self.tfName.text!
               
        STPAPIClient.shared.createToken(withCard: cardParams) { (token: STPToken?, error: Error?) in
        guard let token = token, error == nil else {
                      
            print("stripe error is \(String(describing: error))")
                      // self.activity?.stopAnimating()
                return
            }
            
                self.PaymentApi(token_Id: "\(token)")
            
        }
    }
    
    
    @IBAction func CancelClicked(_ sender: UIButton) {
        tfCard.text = ""
        tfCvv.text = ""
        tfExpiry.text = ""
        tfName.text = ""
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @objc func didChangeText(textField:UITextField) {
        textField.text = self.modifyCreditCardString(creditCardString: textField.text!)
    }
    
    func modifyCreditCardString(creditCardString : String) -> String {
        let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()

        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""

        if(arrOfCharacters.count > 0) {
            for i in 0...arrOfCharacters.count-1 {
                modifiedCreditCardString.append(arrOfCharacters[i])
                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                    modifiedCreditCardString.append(" ")
                }
            }
        }
        return modifiedCreditCardString
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        
         let newLength = (textField.text ?? "").count + string.count - range.length
         if(textField == tfCard) {
             return newLength <= 19
         }

        var result = true
        let prospectiveText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == tfCvv {
            if prospectiveText.count > 0 {
                let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789").inverted
                let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
            let resultingStringLengthIsLegal = prospectiveText.count <= 3
                
                let scanner = Scanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.isAtEnd
                
                result = replacementStringIsLegal &&
                    resultingStringLengthIsLegal &&
                resultingTextIsNumeric
            }
        }
        if textField == tfExpiry {
            if textField.text?.count == 2 {
                let str = textField.text
                textField.text = "\(str!)/"
            }
                   let maxLength = 5
                   let currentString: NSString = tfExpiry.text! as NSString
                   let newString: NSString =
                       currentString.replacingCharacters(in: range, with: string) as NSString
                   return newString.length <= maxLength
                  
               }
           return result
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func PaymentApi(token_Id:String)
    {
        CommonUtils.showHudWithNoInteraction(show: true)
        
        let fullName    = tfExpiry.text
        let fullNameArr = fullName!.components(separatedBy: "/")

        let month    = fullNameArr[0]
        let year = fullNameArr[1]
        
        let params:[String:Any] = [
            "video":"\(videoFlag)",
            "portfolio":"\(PortFlag)","amount":"40","card_number":"\(tfCard.text!)","exp_month":"\(month)", "exp_year":"\(year)", "cvc":"\(tfCvv.text!)","source_token":"\(token_Id)"]
        print(params)
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.userPayment,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            if errorType == .requestSuccess{
                let dictResult = kSharedInstance.getDictionary(result)  //result as! [String: Any]
                switch Int.getInt(statusCode) {
                case 200:
                    let status = String.getString(dictResult["status"])
                    if status == "SUCCESS"{
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPaymentSuccessVC") as? userPaymentSuccessVC
                        self?.navigationController?.pushViewController(vc!, animated: false)
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        
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
