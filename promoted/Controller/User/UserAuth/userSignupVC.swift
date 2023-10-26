//
//  userSignupVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 21/12/22.
//

import UIKit
import Toaster
import ADCountryPicker
import Alamofire
import SwiftyJSON
import MBProgressHUD

class userSignupVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfLastName: UITextField!
    
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfphone: UITextField!
    @IBOutlet weak var tfaddress: UITextField!
    
    
    @IBOutlet weak var codeView: UIView!
    
    @IBOutlet weak var lblCountry: UILabel!
    
    
    
    var iconClick = true
    var imagePicker = UIImagePickerController()
    var selectImageFlag:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10.0
        codeView.layer.cornerRadius = 10.0
        codeView.layer.borderWidth = 1.0
        tfName.layer.cornerRadius = 10.0
        tfLastName.layer.cornerRadius = 10.0
        tfemail.layer.cornerRadius = 10.0
        tfPassword.layer.cornerRadius = 10.0
        tfphone.layer.cornerRadius = 10.0
        tfaddress.layer.cornerRadius = 10.0
        
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfemail.placeholder ?? ""
        tfemail.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfPassword.placeholder ?? ""
        tfPassword.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfphone.placeholder ?? ""
        tfphone.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tfName.placeholder ?? ""
        tfName.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        let placeholder6 = tfLastName.placeholder ?? ""
        tfLastName.attributedPlaceholder = NSAttributedString(string: placeholder6, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder5 = tfaddress.placeholder ?? ""
        tfaddress.attributedPlaceholder = NSAttributedString(string: placeholder5, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        tfName.delegate = self
        tfLastName.delegate = self
        tfemail.delegate = self
        tfPassword.delegate = self
        
        tfphone.delegate = self
        tfaddress.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func eyeClicked(_ sender: UIButton) {
        
        if iconClick {
            tfPassword.isSecureTextEntry = false
            } else {
                tfPassword.isSecureTextEntry = true
            }
            iconClick = !iconClick
    }
    
    
    
    
    @IBAction func codeClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let picker = ADCountryPicker(style: .grouped)
        // delegate
        picker.delegate = self
        
        // Display calling codes
        picker.showCallingCodes = true
         //var showFlags = true
        
        // or closure
        picker.didSelectCountryClosure = { name, code in
            _ = picker.navigationController?.popToRootViewController(animated: true)
            print(code)
        }
        
        
        //        Use this below code to present the picker
        
        let pickerNavigationController = UINavigationController(rootViewController: picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
       if tfName.text == ""
        {
            self.showSimpleAlert(message: "Please Enter Your First Name")
            return
        }
        else if tfLastName.text == ""{
            self.showSimpleAlert(message: "Please Enter Your Last Name")
            return
        }
        else if tfemail.text == ""{
            self.showSimpleAlert(message: "Please Enter Email")
            return
        }
        else if tfPassword.text == ""{
            self.showSimpleAlert(message: "Please Enter Password")
            return
        }
        else if tfphone.text == ""
        {
            self.showSimpleAlert(message: "Please Enter Phone")
            return
        }
        else if tfaddress.text == ""
        {
            self.showSimpleAlert(message: "Please Enter City, State, Postcode")
            return
        }
        else
        {
            GetEmailExitorNot1(email:tfemail.text!)
            
            
        }
    }
    
    @IBAction func profileClicked(_ sender: UIButton) {
        imageUpload()
    }
    
    
    func imageUpload(){
        
        let imagePickerController = UIImagePickerController()
            imagePickerController.allowsEditing = true //If you want edit option set "true"
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
        
            present(imagePickerController, animated: true, completion: nil)
        
//        ImagePickerHandler.shared.showActionSheet(vc: self, view: self.view)
//        ImagePickerHandler.shared.imagePickedBlock = { (img, data) in
//            self.imgProfile.image = img
//            self.imgProfile.contentMode = .scaleAspectFill
//            self.imgProfile.isHidden=false
//            self.selectImageFlag = true
//        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == tfemail
        {
            if (tfemail.text?.isValidEmail())!
            {
                print("valid email")
                GetEmailExitorNot(email:tfemail.text!)
            }
            else
            {
                print("invalid email")
                Toast(text:"Please enter valid email address",duration:Delay.long).show()
                self.tfemail.text = ""
                
                view.endEditing(true)
            }
            
        }
        else if textField == tfphone {
            if tfphone.text!.count > 8 {
                GetnumberValidation(number:tfphone.text!)
            }else{
                print("invalid email")
                Toast(text:"Please enter valid phone number",duration:Delay.long).show()
                self.tfphone.text = ""
                
                view.endEditing(true)
            }
        }
    }
    
    // MARK: - mobile number valid or not
    func GetnumberValidation(number:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["phone":"\(number)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.checknumber, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        self.tfphone.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        //Toast(text:"\(dictResult["message"]!)").show()
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
    func GetnumberValid(number:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["phone":"\(number)","country_code":"\(self.lblCountry.text!)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.sendOtp, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        //Toast(text:"\(dictResult["message"]!)").show()
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserOTPVC") as? UserOTPVC
                        vc?.profile = self.imgProfile.image
                        vc?.Name = self.tfName.text
                        vc?.lastName = self.tfLastName.text
                        vc?.email = self.tfemail.text
                        vc?.Password = self.tfPassword.text
                        vc?.Phone = self.tfphone.text
                        vc?.Address = self.tfaddress.text
                        vc?.countryCode = self.lblCountry.text
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
    
    // MARK: - EmailAlready exit or not
    func GetEmailExitorNot(email:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["email":"\(email)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.checkUserAvil, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = "\(dictResult["status"]!)"
                    if status == "FAIL"{
                        Toast(text:"\(dictResult["message"]!)", duration: Delay.long).show()
                        self.tfemail.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        
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
    
    // MARK: - EmailAlready exit or not
    func GetEmailExitorNot1(email:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["email":"\(email)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.checkUserAvil, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = "\(dictResult["status"]!)"
                    if status == "FAIL"{
                        Toast(text:"\(dictResult["message"]!)", duration: Delay.long).show()
                        self.tfemail.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        self.GetnumberValidation1(number:self.tfphone.text!)
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
    
    // MARK: - mobile number valid or not
    func GetnumberValidation1(number:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["phone":"\(number)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.checknumber, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        self.tfphone.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        //Toast(text:"\(dictResult["message"]!)").show()
                        //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        self.GetnumberValid(number:self.tfphone.text!)
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = true
        if(textField == tfphone) {
            
            let maxLength = 11
            let currentString: NSString = tfphone.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return result
    }
    
}

extension userSignupVC: ADCountryPickerDelegate{
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        picker.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        lblCountry.text = dialCode
    }
}

extension userSignupVC:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    var image : UIImage!

    if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            {
                image = img

            }
    else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                image = img
            }
    
    //let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
                self.imgProfile.image = image
                self.imgProfile.contentMode = .scaleAspectFill
                self.imgProfile.isHidden=false
                self.selectImageFlag = true
    self.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
}
