//
//  CompanyinfoVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 19/12/22.
//

import UIKit
import DropDown
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD
import MobileCoreServices
import UniformTypeIdentifiers

class CompanyinfoVC: BaseViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UIDocumentPickerDelegate {
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view1img: UIView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnView1Edit: UIButton!
    @IBOutlet weak var view1TF: UIView!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var btnView1Delete: UIButton!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view2img: UIView!
    @IBOutlet weak var lblcontact: UILabel!
    @IBOutlet weak var btnView2Edit: UIButton!
    @IBOutlet weak var view2TF: UIView!
    @IBOutlet weak var tfcontact: UITextField!
    @IBOutlet weak var btnView2Delete: UIButton!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view3img: UIView!
    @IBOutlet weak var lbllocation: UILabel!
    @IBOutlet weak var btnView3Edit: UIButton!
    @IBOutlet weak var view3TF: UIView!
    @IBOutlet weak var tflocation: UITextField!
    @IBOutlet weak var btnView3Delete: UIButton!
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view4img: UIView!
    @IBOutlet weak var btnView4Edit: UIButton!
    @IBOutlet weak var btnView4Delete: UIButton!
    
    
    @IBOutlet weak var fromTimeView:UIView!
    @IBOutlet weak var lblFromTime: UILabel!
    @IBOutlet weak var imgFromTime: UIImageView!
    @IBOutlet weak var btnfromTime: UIButton!
    
    @IBOutlet weak var toTimeView:UIView!
    @IBOutlet weak var lblToTime: UILabel!
    @IBOutlet weak var imgToTime: UIImageView!
    @IBOutlet weak var btntoTime: UIButton!
    
    @IBOutlet weak var fromDayView:UIView!
    @IBOutlet weak var lblFromDay: UILabel!
    @IBOutlet weak var imgFromDay: UIImageView!
    @IBOutlet weak var btnfromDay: UIButton!
    
    @IBOutlet weak var toDayView:UIView!
    @IBOutlet weak var lblToDay: UILabel!
    @IBOutlet weak var imgToDay: UIImageView!
    @IBOutlet weak var btntoDay: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    
    let FromTime = DropDown()
    var FromTimeType = [String]()
    var FromTimeValue = String()
    
    let ToTime = DropDown()
    var ToTimeType = [String]()
    var ToTimeValue = String()
    
    let FromDay = DropDown()
    var FromDayType = [String]()
    var FromDayValue = String()
    
    let ToDay = DropDown()
    var ToDayType = [String]()
    var ToDayValue = String()
    
    var uploadFlag = 0
    var profile:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Customise()
        getCompanyProfileAPI()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        FromTimeValue = ""
        ToTimeValue = ""
        FromDayValue = ""
        ToDayValue = ""
        profile = nil
        
        
        btnSave.layer.cornerRadius = 10.0
        view1.layer.cornerRadius = 10.0
        view1img.layer.cornerRadius = 7.0
        view1TF.layer.borderWidth = 1.0
        view1TF.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view1TF.isHidden = true
        btnView1Delete.isHidden = true
        
        view2.layer.cornerRadius = 10.0
        view2img.layer.cornerRadius = 7.0
        view2TF.layer.borderWidth = 1.0
        view2TF.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view2TF.isHidden = true
        btnView2Delete.isHidden = true
        
        view3.layer.cornerRadius = 10.0
        view3img.layer.cornerRadius = 7.0
        view3TF.layer.borderWidth = 1.0
        view3TF.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view3TF.isHidden = true
        btnView3Delete.isHidden = true
        
        view4.layer.cornerRadius = 10.0
        view4img.layer.cornerRadius = 7.0
        btnView4Delete.isHidden = true
        
        
        
        btnfromTime.isUserInteractionEnabled = false
        btntoTime.isUserInteractionEnabled = false
        btnfromDay.isUserInteractionEnabled = false
        btntoDay.isUserInteractionEnabled = false
        
        
        // shadow
        view1.layer.shadowColor = UIColor.black.cgColor
        view1.layer.shadowOffset = CGSize(width: 3, height: 3)
        view1.layer.shadowOpacity = 0.7
        view1.layer.shadowRadius = 4.0
        
        // shadow
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOffset = CGSize(width: 3, height: 3)
        view2.layer.shadowOpacity = 0.7
        view2.layer.shadowRadius = 4.0
        
        // shadow
        view3.layer.shadowColor = UIColor.black.cgColor
        view3.layer.shadowOffset = CGSize(width: 3, height: 3)
        view3.layer.shadowOpacity = 0.7
        view3.layer.shadowRadius = 4.0
        
        // shadow
        view4.layer.shadowColor = UIColor.black.cgColor
        view4.layer.shadowOffset = CGSize(width: 3, height: 3)
        view4.layer.shadowOpacity = 0.7
        view4.layer.shadowRadius = 4.0
        
    }
    
    func Customise(){
        tfemail.delegate = self
        tfcontact.delegate = self
        tflocation.delegate = self
        
        
        
        FromTimeType = ["12:00 am","1:00 am","2:00 am","3:00 am","4:00 am","5:00 am","6:00 am","7:00 am","8:00 am" ,"9:00 am","10:00 am","11:00 am","12:00 pm","1:00 pm","2:00 pm","3:00 pm","4:00 pm","5:00 pm","6:00 pm","7:00 pm","8:00 pm","9:00 pm","10:00 pm","11:00 pm"]
        ToTimeType = ["12:00 am","1:00 am","2:00 am","3:00 am","4:00 am","5:00 am","6:00 am","7:00 am","8:00 am" ,"9:00 am","10:00 am","11:00 am","12:00 pm","1:00 pm","2:00 pm","3:00 pm","4:00 pm","5:00 pm","6:00 pm","7:00 pm","8:00 pm","9:00 pm","10:00 pm","11:00 pm"]
        FromDayType = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        ToDayType = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func deleteAccountClicked(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Procruited",
                                                message: "Are you sure you want to delete your Account?",
                                                preferredStyle: .alert)
        let alertActionYes = UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.DeleteAccount()
        })
        let alertActionNO = UIAlertAction(title: "No", style: .default, handler: { _ in
        })
        alertController.addAction(alertActionYes)
        alertController.addAction(alertActionNO)
        self.present(alertController, animated: true)
    }
    
    func DeleteAccount(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.deleteAccount, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let data = kSharedInstance.getDictionary(dictResult["data"])
                    print(data)
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    UserDefaults.standard.setValue(false, forKey: kIsLogin)
                    UserDefaults.standard.synchronize()
                    self.navigationController?.popToRootViewController(animated: true)
                    
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
    
    
    
    
    @IBAction func saveClicked(_ sender: UIButton) {
        view1TF.isHidden = true
        btnView1Delete.isHidden = true
        btnView1Edit.isHidden = false
        
        view2TF.isHidden = true
        btnView2Delete.isHidden = true
        btnView2Edit.isHidden = false
        
        view3TF.isHidden = true
        btnView3Delete.isHidden = true
        btnView3Edit.isHidden = false
        

        btnView4Delete.isHidden = true
        btnView4Edit.isHidden = false
        btnfromTime.isUserInteractionEnabled = true
        btntoTime.isUserInteractionEnabled = true
        btnfromDay.isUserInteractionEnabled = true
        btntoDay.isUserInteractionEnabled = true
        
        updateCompanyProfileAPI()
        
        
        
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
//            self.profile = img
//            self.imgProfile.contentMode = .scaleAspectFill
//            self.imgProfile.isHidden=false
//        }
        
        
        
    }
    
    
    @IBAction func view1EditClicked(_ sender: UIButton) {
        tfemail.text = lblEmail.text
        view1TF.isHidden = false
        btnView1Delete.isHidden = false
        btnView1Edit.isHidden = true
    }
    
    @IBAction func view1DeleteClicked(_ sender: UIButton) {
        tfemail.text = ""
    }
    
    
    @IBAction func view2EditClicked(_ sender: UIButton) {
        tfcontact.text = lblcontact.text
        view2TF.isHidden = false
        btnView2Delete.isHidden = false
        btnView2Edit.isHidden = true
    }
    
    @IBAction func view2DeleteClicked(_ sender: UIButton) {
        tfcontact.text = ""
    }
    
    @IBAction func view3EditClicked(_ sender: UIButton) {
        tflocation.text = lbllocation.text
        view3TF.isHidden = false
        btnView3Delete.isHidden = false
        btnView3Edit.isHidden = true
    }
    
    @IBAction func view3DeleteClicked(_ sender: UIButton) {
        tflocation.text = ""
    }
    
    @IBAction func view4EditClicked(_ sender: UIButton) {
        btnView4Delete.isHidden = false
        btnView4Edit.isHidden = true
        btnfromTime.isUserInteractionEnabled = true
        btntoTime.isUserInteractionEnabled = true
        btnfromDay.isUserInteractionEnabled = true
        btntoDay.isUserInteractionEnabled = true
    }
    
    @IBAction func view4DeleteClicked(_ sender: UIButton) {
        FromTimeValue = ""
        ToTimeValue = ""
        FromDayValue = ""
        ToDayValue = ""
        
        lblFromTime.text = "From - Time"
        lblToTime.text = "To - Time"
        lblFromDay.text = "From - Day"
        lblToDay.text = "To - Day"
        
    }
    
    
    @IBAction func fromTimeClicked(_ sender: UIButton) {
        FromTime.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromTime.text = "\(item)"
            self.FromTimeValue = item
            self.imgFromTime.image = UIImage(named: "drop")
        }
        self.FromTime.anchorView = self.fromTimeView
        imgFromTime.image = UIImage(named: "plus")
        self.FromTime.dataSource = FromTimeType
        self.FromTime.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromTime.bottomOffset = CGPoint(x: 0, y:(FromTime.anchorView?.plainView.bounds.height)!)
        FromTime.setupCornerRadius(10.0)
        FromTime.backgroundColor = UIColor.white
        FromTime.textColor = UIColor(hexString: "#717171")
        FromTime.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromTime.layer.borderWidth = 1.0
        FromTime.direction = .bottom
        
        FromTime.show()
    }
    
    
    @IBAction func toTimeClicked(_ sender: UIButton) {
        ToTime.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToTime.text = "\(item)"
            self.ToTimeValue = item
            self.imgToTime.image = UIImage(named: "drop")
        }
        self.ToTime.anchorView = self.toTimeView
        imgToTime.image = UIImage(named: "plus")
        self.ToTime.dataSource = ToTimeType
        self.ToTime.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToTime.bottomOffset = CGPoint(x: 0, y:(ToTime.anchorView?.plainView.bounds.height)!)
        ToTime.setupCornerRadius(10.0)
        ToTime.backgroundColor = UIColor.white
        ToTime.textColor = UIColor(hexString: "#717171")
        ToTime.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToTime.layer.borderWidth = 1.0
        ToTime.direction = .bottom
        
        ToTime.show()
    }
    
    
    @IBAction func fromDayClicked(_ sender: UIButton) {
        FromDay.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromDay.text = "\(item)"
            self.FromDayValue = item
            self.imgFromDay.image = UIImage(named: "drop")
        }
        self.FromDay.anchorView = self.fromDayView
        imgFromDay.image = UIImage(named: "plus")
        self.FromDay.dataSource = FromDayType
        self.FromDay.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromDay.bottomOffset = CGPoint(x: 0, y:(FromDay.anchorView?.plainView.bounds.height)!)
        FromDay.setupCornerRadius(10.0)
        FromDay.backgroundColor = UIColor.white
        FromDay.textColor = UIColor(hexString: "#717171")
        FromDay.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromDay.layer.borderWidth = 1.0
        FromDay.direction = .bottom
        
        FromDay.show()
    }
    
    
    @IBAction func toDayClicked(_ sender: UIButton) {
        ToDay.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToDay.text = "\(item)"
            self.ToDayValue = item
            self.imgToDay.image = UIImage(named: "drop")
        }
        self.ToDay.anchorView = self.toDayView
        imgToDay.image = UIImage(named: "plus")
        self.ToDay.dataSource = ToDayType
        self.ToDay.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToDay.bottomOffset = CGPoint(x: 0, y:(ToDay.anchorView?.plainView.bounds.height)!)
        ToDay.setupCornerRadius(10.0)
        ToDay.backgroundColor = UIColor.white
        ToDay.textColor = UIColor(hexString: "#717171")
        ToDay.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToDay.layer.borderWidth = 1.0
        ToDay.direction = .bottom
        
        ToDay.show()
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
                        
                        self.imgProfile.kf.setImage(with: url)
                        //self.imgProfile.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                        self.lblEmail.text = String.getString(data["email"])
                        self.tfemail.text = String.getString(data["email"])
                        self.lblcontact.text = String.getString(data["phone"])
                        self.tfcontact.text = String.getString(data["phone"])
                        self.lbllocation.text = String.getString(data["city_state_postcode"])
                        self.tflocation.text = String.getString(data["city_state_postcode"])
                        let fromTime = String.getString(data["company_availibilty_from"])
                        if fromTime != ""{
                            self.FromTimeValue = fromTime
                            self.lblFromTime.text = fromTime
                        }else{
                            self.FromTimeValue = ""
                            self.lblFromTime.text = "From - Time"
                        }
                        let toTime = String.getString(data["company_availibilty_to"])
                        if toTime != ""{
                            self.ToTimeValue = toTime
                            self.lblToTime.text = toTime
                        }else{
                            self.ToTimeValue = ""
                            self.lblToTime.text = "To - Time"
                        }
                        let fromDay = String.getString(data["company_availibilty_day_from"])
                        if fromDay != ""{
                            self.FromDayValue = fromDay
                            self.lblFromDay.text = fromDay
                        }else{
                            self.FromDayValue = ""
                            self.lblFromDay.text = "From - Day"
                        }
                        let toDay = String.getString(data["company_availibilty_day_to"])
                        if toDay != ""{
                            self.ToDayValue = toDay
                            self.lblToDay.text = toDay
                        }else{
                            self.ToDayValue = ""
                            self.lblToDay.text = "To - Day"
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
    
    // MARK:- Update Company Profile API
    func updateCompanyProfileAPI() {
        CommonUtils.showHudWithNoInteraction(show: true)
        let url: String = kBASEURL + ServiceName.updateCompanyProfile
             print(url)
         var header = [String: String]()
         if let token = UserDefaults.standard.value(forKey:"token"){
         header = ["Content-Type" : "application/json","Authorization": "Bearer \(token)"]
         } else {
                     header = [:]
                 }
         print(header)
        let params = ["phone": "\(tfcontact.text!)", "email": "\(tfemail.text!)", "city_state_postcode":"\(tflocation.text!)", "company_availibilty_from":"\(FromTimeValue)", "company_availibilty_to":"\(ToTimeValue)", "company_availibilty_day_from":"\(FromDayValue)","company_availibilty_day_to":"\(ToDayValue)"] as [String : String]
         
             print("paramstes \(params)")
        
             Alamofire.upload(
                multipartFormData: { multipartFormData in
                    for (key, value) in params {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                    }
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "offer_letter")
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "confidential_agreement")
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "employment_contract")
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "TFN_declaration")
                    if self.profile != nil {
                        let imgData = self.profile!.jpegData(compressionQuality: 1)
                        let currentDateTime = Date()
                        let formatter = DateFormatter()
                        formatter.dateFormat = "ddMMMMyyyyhhmma"
                        let someDateTime = formatter.string(from: currentDateTime)
                        multipartFormData.append(imgData!, withName: "profile_image", fileName: "Profile\(someDateTime).jpg", mimeType:"image/jpeg")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "profile_image")
                    }
                    
                    },
                    to: url, method: .post, headers: header) { (result) in
                        
                        switch result{
                        case .success(let upload, _, _):
                            upload.uploadProgress(closure: { (progress) in
                                let progressVal = String(format: "%.2f%%", progress.fractionCompleted * 100)
                                print("\(progressVal)")
                            })
                            
                            upload.responseJSON{ response in
                                print(response)
                                CommonUtils.showHudWithNoInteraction(show: false)
                                if response.result.isSuccess {
                                    let data = JSON(response.result.value!)
                                    print(data)
                                    print(data["message"])
                                    if "\(data["status"])" == "FAIL"{
                                        Toast(text:"\(data["message"])", duration: Delay.long).show()
                                    }else{
                                        Toast(text:"\(data["message"])", duration: Delay.long).show()
                                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
                                        self.navigationController?.pushViewController(vc!, animated: false)
                                    }
                                  } else {
                                      //print(response.result.value!)
                                      print(response.result.isFailure)
                                      let data = JSON(response.result.value!)
                                      print(data)

                                      Toast(text:"\(data["message"])", duration: Delay.long).show()
                                }
                                
                            }
                        case .failure(let error):
                            CommonUtils.showHudWithNoInteraction(show: false)
                            print("Error in upload: \(error.localizedDescription)")
                           
                        }
                    }
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
        else if textField == tfcontact {
            if tfcontact.text!.count > 8 {
                GetnumberValid(number:tfcontact.text!)
            }else{
                print("invalid email")
                Toast(text:"Please enter valid phone number",duration:Delay.long).show()
                self.tfcontact.text = ""
                
                view.endEditing(true)
            }
        }
    }
    
    // MARK: - mobile number valid or not
    func GetnumberValid(number:String)  {
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
                        self.tfcontact.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = true
        if(textField == tfcontact) {
            let maxLength = 11
            let currentString: NSString = tfcontact.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return result
    }
}

extension CompanyinfoVC:UINavigationControllerDelegate{
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
                self.profile = image
                self.imgProfile.contentMode = .scaleAspectFill
                self.imgProfile.isHidden=false
    self.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
}
