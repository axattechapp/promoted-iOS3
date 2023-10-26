//
//  CreateProfileVC1.swift
//  promoted
//
//  Created by Vikram Sindhu on 09/12/22.
//

import UIKit
import DropDown
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class CreateProfileVC1: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfLast: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfComName: UITextField!
    @IBOutlet weak var tfComType: UITextField!
    @IBOutlet weak var tfABN: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    
    @IBOutlet weak var fromTimeView:UIView!
    @IBOutlet weak var lblFromTime: UILabel!
    @IBOutlet weak var imgFromTime: UIImageView!
    
    @IBOutlet weak var toTimeView:UIView!
    @IBOutlet weak var lblToTime: UILabel!
    @IBOutlet weak var imgToTime: UIImageView!
    
    @IBOutlet weak var fromDayView:UIView!
    @IBOutlet weak var lblFromDay: UILabel!
    @IBOutlet weak var imgFromDay: UIImageView!
    
    @IBOutlet weak var toDayView:UIView!
    @IBOutlet weak var lblToDay: UILabel!
    @IBOutlet weak var imgToDay: UIImageView!
    
    @IBOutlet weak var btnPermission: UIButton!
    
    var permission = 0
    var role: String?
    
    var imagePicker = UIImagePickerController()
    var selectImageFlag:Bool = false
    
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
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        Customise()
    }
    
    
    func Customise()
    {
        nextBtn.layer.cornerRadius = 10.0
        tfName.layer.cornerRadius = 10.0
        tfLast.layer.cornerRadius = 10.0
        tfEmail.layer.cornerRadius = 10.0
        tfPassword.layer.cornerRadius = 10.0
        tfComName.layer.cornerRadius = 10.0
        tfComType.layer.cornerRadius = 10.0
        tfABN.layer.cornerRadius = 10.0
        tfAddress.layer.cornerRadius = 10.0
        btnPermission.layer.cornerRadius = 10.0
        //#4E4E4E
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfName.placeholder ?? ""
        tfName.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder8 = tfLast.placeholder ?? ""
        tfLast.attributedPlaceholder = NSAttributedString(string: placeholder8, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfEmail.placeholder ?? ""
        tfEmail.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfPassword.placeholder ?? ""
        tfPassword.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tfComName.placeholder ?? ""
        tfComName.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder5 = tfComType.placeholder ?? ""
        tfComType.attributedPlaceholder = NSAttributedString(string: placeholder5, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder6 = tfABN.placeholder ?? ""
        tfABN.attributedPlaceholder = NSAttributedString(string: placeholder6, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder7 = tfAddress.placeholder ?? ""
        tfAddress.attributedPlaceholder = NSAttributedString(string: placeholder7, attributes: [NSAttributedString.Key.foregroundColor : color])
        tfName.delegate = self
        tfLast.delegate = self
        tfEmail.delegate = self
        tfPassword.delegate = self
        tfComName.delegate = self
        tfComType.delegate = self
        tfABN.delegate = self
        tfAddress.delegate = self
        
        FromTimeType = ["12:00 am","1:00 am","2:00 am","3:00 am","4:00 am","5:00 am","6:00 am","7:00 am","8:00 am" ,"9:00 am","10:00 am","11:00 am","12:00 pm","1:00 pm","2:00 pm","3:00 pm","4:00 pm","5:00 pm","6:00 pm","7:00 pm","8:00 pm","9:00 pm","10:00 pm","11:00 pm"]
        ToTimeType = ["12:00 am","1:00 am","2:00 am","3:00 am","4:00 am","5:00 am","6:00 am","7:00 am","8:00 am" ,"9:00 am","10:00 am","11:00 am","12:00 pm","1:00 pm","2:00 pm","3:00 pm","4:00 pm","5:00 pm","6:00 pm","7:00 pm","8:00 pm","9:00 pm","10:00 pm","11:00 pm"]
        FromDayType = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        ToDayType = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        
        
//        let img = UserDefaults.standard.value(forKey:"uprofileImage")
//        
//        if img != nil {
//            self.imgProfile.image = img as? UIImage
//        }
        tfName.text = UserDefaults.standard.value(forKey:"ComuserName") as? String
        tfLast.text = UserDefaults.standard.value(forKey:"ComuserLast") as? String
        
        tfEmail.text = UserDefaults.standard.value(forKey:"comEmail") as? String
        tfPassword.text = UserDefaults.standard.value(forKey:"comPass") as? String
        tfComName.text = UserDefaults.standard.value(forKey:"ComName") as? String
        tfComType.text = UserDefaults.standard.value(forKey:"comType") as? String
        tfABN.text = UserDefaults.standard.value(forKey:"comABN") as? String
        tfAddress.text = UserDefaults.standard.value(forKey:"comcity") as? String
        FromTimeValue = UserDefaults.standard.value(forKey:"comFromTimeValue") as? String ?? ""
        if FromTimeValue != ""{
            self.lblFromTime.text = "\(FromTimeValue)"
        }
        ToTimeValue = UserDefaults.standard.value(forKey:"comToTimeValue") as? String ?? ""
        if ToTimeValue != ""{
            self.lblToTime.text = "\(ToTimeValue)"
        }
        FromDayValue = UserDefaults.standard.value(forKey:"comFromDayValue") as? String ?? ""
        if FromDayValue != ""{
            self.lblFromDay.text = "\(FromDayValue)"
        }
        ToDayValue = UserDefaults.standard.value(forKey:"comToDayValue") as? String ?? ""
        if ToDayValue != ""{
            self.lblToDay.text = "\(ToDayValue)"
        }
        
        permission = UserDefaults.standard.value(forKey:"permission") as? Int ?? 0
        if permission == 1 {
            btnPermission.setImage(UIImage(named: "select"), for: .normal)
        }else {
            btnPermission.setImage(UIImage(named: "unselect"), for: .normal)
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == tfEmail
        {
            if (tfEmail.text?.isValidEmail())!
            {
                print("valid email")
                GetEmailExitorNot(email:tfEmail.text!)
            }
            else
            {
                print("invalid email")
                Toast(text:"Please enter valid email address",duration:Delay.long).show()
                self.tfEmail.text = ""
                
                view.endEditing(true)
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
                        self.tfEmail.text = ""
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
    
    
    
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if tfName.text == ""
        {
            self.showSimpleAlert(message: "Please Enter Your First Name")
            return
        }
        else if tfLast.text == ""
        {
            self.showSimpleAlert(message: "Please Enter Your Last Name")
            return
        }
        else if tfEmail.text == ""{
            self.showSimpleAlert(message: "Please Enter Email")
            return
        }
        else if tfPassword.text == ""{
            self.showSimpleAlert(message: "Please Enter Password")
            return
        }
        else if tfComName.text == ""
        {
            self.showSimpleAlert(message: "Please Enter Company Name")
            return
        }
        else if tfComType.text == ""
        {
            self.showSimpleAlert(message: "Please Enter Company Type")
            return
        }
        else if tfABN.text == ""
        {
            self.showSimpleAlert(message: "Please Enter ABN")
            return
        }
        else if tfAddress.text == ""
        {
            self.showSimpleAlert(message: "Please Enter City, State, Postcode")
            return
        }
        else if FromTimeValue == ""{
            self.showSimpleAlert(message: "Please Select Office Start time")
            return
        }
        else if ToTimeValue == ""{
            self.showSimpleAlert(message: "Please Select Office End time")
            return
        }
        else if FromDayValue == ""{
            self.showSimpleAlert(message: "Please Select Office Start WeekDay")
            return
        }
        else if ToDayValue == ""{
            self.showSimpleAlert(message: "Please Select Office End WeekDay")
            return
        }
        else if permission == 0
        {
            self.showSimpleAlert(message: "Please Select Our policies")
            return
        }
        else
        {
            //UserDefaults.standard.set(imgProfile.image, forKey: "uprofileImage")
            UserDefaults.standard.set(tfName.text, forKey: "ComuserName")
            UserDefaults.standard.set(tfLast.text, forKey: "ComuserLast")
            UserDefaults.standard.set(tfEmail.text, forKey: "comEmail")
            UserDefaults.standard.set(tfPassword.text, forKey: "comPass")
            UserDefaults.standard.set(tfComName.text, forKey: "ComName")
            UserDefaults.standard.set(tfComType.text, forKey: "comType")
            UserDefaults.standard.set(tfABN.text, forKey: "comABN")
            UserDefaults.standard.set(tfAddress.text, forKey: "comcity")
            UserDefaults.standard.set(FromTimeValue, forKey: "comFromTimeValue")
            UserDefaults.standard.set(ToTimeValue, forKey: "comToTimeValue")
            UserDefaults.standard.set(FromDayValue, forKey: "comFromDayValue")
            UserDefaults.standard.set(ToDayValue, forKey: "comToDayValue")
            UserDefaults.standard.set(permission, forKey: "permission")
            UserDefaults.standard.synchronize()
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateSearchVC") as? CandidateSearchVC
            vc?.role = role
            vc?.profile = imgProfile.image
            vc?.Name = tfName.text
            vc?.lastname = tfLast.text
            vc?.email = tfEmail.text
            vc?.Password = tfPassword.text
            vc?.companyName = tfComName.text
            vc?.companyType = tfComType.text
            vc?.abn = tfABN.text
            vc?.companyAddress = tfAddress.text
            vc?.fromTime = FromTimeValue
            vc?.toTime = ToTimeValue
            vc?.fromDay = FromDayValue
            vc?.toDay = ToDayValue
            self.navigationController?.pushViewController(vc!, animated: false)
            
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
    
    
    @IBAction func fromTimeClicked(_ sender: UIButton) {
        view.endEditing(true)
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
        view.endEditing(true)
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
        view.endEditing(true)
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
        view.endEditing(true)
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
    
    
    @IBAction func permissionClicked(_ sender: UIButton) {
        if permission == 0 {
            btnPermission.setImage(UIImage(named: "select"), for: .normal)
            permission = 1
        }else{
            btnPermission.setImage(UIImage(named: "unselect"), for: .normal)
            permission = 0
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        if(textField == tfABN) {
            let maxLength = 11
            let currentString: NSString = tfABN.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return result
    }
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
}

extension UIViewController {
    
    func showHUD(progressLabel:String){
        DispatchQueue.main.async{
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD?.labelText = progressLabel
        }
    }
    
    func dismissHUD(isAnimated:Bool) {
        DispatchQueue.main.async{
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
}

extension CreateProfileVC1:UINavigationControllerDelegate{
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
