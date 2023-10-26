//
//  CandidateSearchVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 12/12/22.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class CandidateSearchVC: UIViewController {
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var btnPartTime: UIButton!
    @IBOutlet weak var btnFullTime: UIButton!
    @IBOutlet weak var btnContract: UIButton!
    @IBOutlet weak var btnCasual: UIButton!
    @IBOutlet weak var btnTemporary: UIButton!
    
    @IBOutlet weak var industryView: UIView!
    @IBOutlet weak var lblIndustry: UILabel!
    @IBOutlet weak var imgIndustry: UIImageView!
    
    @IBOutlet weak var roleView: UIView!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var imgRole: UIImageView!
    
    @IBOutlet weak var salaryView: UIView!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var imgSalary: UIImageView!
    
    @IBOutlet weak var lengthView: UIView!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var imgLength: UIImageView!
    
    @IBOutlet weak var btnLength: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var JobType = 0
    var role: String?
    var profile:UIImage?
    var Name: String?
    var lastname: String?
    var email: String?
    var Password: String?
    var companyName: String?
    var companyType: String?
    var abn: String?
    var companyAddress: String?
    var fromTime:String?
    var toTime:String?
    var fromDay:String?
    var toDay:String?
    
    var IndustryListArr = [industryListModal]()
    let Industry = DropDown()
    var IndustryType = [String]()
    var IndustryTypeId = [String]()
    var IndustryValue = String()
    var industryid = String()
    
    var RoleListArr = [roleListModal]()
    let Role = DropDown()
    var RoleType = [String]()
    var RoleValue = String()
    
    let salary = DropDown()
    var salaryType = [String]()
    var salaryValue = String()
    
    let length = DropDown()
    var lengthType = [String]()
    var lengthValue = String()
    
    
    
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
        industryView.layer.cornerRadius = 10.0
        roleView.layer.cornerRadius = 10.0
        salaryView.layer.cornerRadius = 10.0
        lengthView.layer.cornerRadius = 10.0
        
        industryView.layer.borderWidth = 1.0
        industryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        roleView.layer.borderWidth = 1.0
        roleView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        salaryView.layer.borderWidth = 1.0
        salaryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        lengthView.layer.borderWidth = 1.0
        lengthView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        //IndustryType = ["Accounting","Administration & Office Support","Advertising, Arts & Media","Banking & Financial Services","Call Centre & Customer Service","CEO & General Management","Community Services & Development", "Construction","Consulting & Strategy","Design & Architecture","Education & Training","Engineering"]
        //RoleType = ["Accounting Officer","Accounts Payable","Accounts Receivable","Analysis & Reporting","Assistant Accountants","Audit - External","Audit - Internal","Bookkeeping & Small Practice","Business Services & Advisory","Company Secretaries","Compliance  & Risk","Cost Accounting"]
        salaryType = ["$10,000 - $20,000","$20,000 - $30,000","$30,000 - $40,000","$40,000 - $50,000","$50,000 - $60,000","$60,000 - $70,000","$70,000 - $80,000","$80,000 - $90,000","$90,000 - $100,000","$100,000 - $150,000","$150,000 - $200,000","$200,000 - $300,000","$300,000 and Above"]
        lengthType = ["1 Month","2 Months","3 Months","4 Months","5 Months","6 Months","7 Months","8 Months","9 Months","10 Months","11 Months","12 Months","12 Months+"]
        
        
        JobType = UserDefaults.standard.value(forKey:"comJobType") as? Int ?? 0
        
        if JobType == 1 {
            btnLength.isUserInteractionEnabled = false
            lengthView.isHidden = true
            btnPartTime.setImage(UIImage(named: "select"), for: .normal)
            btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
            btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
        }else if JobType == 2 {
            btnLength.isUserInteractionEnabled = false
            lengthView.isHidden = true
            btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnFullTime.setImage(UIImage(named: "select"), for: .normal)
            btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
            btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
        }else if JobType == 3 {
            btnLength.isUserInteractionEnabled = true
            lengthView.isHidden = false
            btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnContract.setImage(UIImage(named: "select"), for: .normal)
            btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
            btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
        }else if JobType == 4 {
            btnLength.isUserInteractionEnabled = false
            lengthView.isHidden = true
            btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            btnCasual.setImage(UIImage(named: "select"), for: .normal)
            btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
        }else if JobType == 5 {
            btnLength.isUserInteractionEnabled = false
            lengthView.isHidden = true
            btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
            btnTemporary.setImage(UIImage(named: "select"), for: .normal)
        }else {
            btnLength.isUserInteractionEnabled = true
            lengthView.isHidden = false
            btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
            btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
            btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
        }
        
        IndustryValue = UserDefaults.standard.value(forKey:"comIndustryValue") as? String ?? ""
        industryid = UserDefaults.standard.value(forKey:"comindustryid") as? String ?? ""
        if IndustryValue != ""{
            self.lblIndustry.text = IndustryValue
        }
        RoleValue = UserDefaults.standard.value(forKey:"comRoleValue") as? String ?? ""
        if RoleValue != ""{
            self.lblRole.text = RoleValue
        }
        salaryValue = UserDefaults.standard.value(forKey:"comsalaryValue") as? String ?? ""
        if salaryValue != ""{
            self.lblSalary.text = salaryValue
        }
        lengthValue = UserDefaults.standard.value(forKey:"comlengthValue") as? String ?? ""
        if lengthValue != ""{
            self.lblLength.text = lengthValue
        }
       
        
        
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if JobType == 0 {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Job Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if IndustryValue == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Industry Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if RoleValue == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Role Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if salaryValue == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Salary", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if lengthValue == "" && (JobType == 3 || JobType == 5) {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Contract Length", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            UserDefaults.standard.set(JobType, forKey: "comJobType")
            UserDefaults.standard.set(IndustryValue, forKey: "comIndustryValue")
            UserDefaults.standard.set(industryid, forKey: "comindustryid")
            UserDefaults.standard.set(RoleValue, forKey: "comRoleValue")
            UserDefaults.standard.set(salaryValue, forKey: "comsalaryValue")
            UserDefaults.standard.set(lengthValue, forKey: "comlengthValue")
            UserDefaults.standard.synchronize()
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateSearchVC1") as? CandidateSearchVC1
            vc?.role = role
            vc?.profile = profile
            vc?.fromTime = fromTime
            vc?.toTime = toTime
            vc?.fromDay = fromDay
            vc?.toDay = toDay
            vc?.Name = Name
            vc?.lastname = lastname
            vc?.email = email
            vc?.Password = Password
            vc?.companyName = companyName
            vc?.companyType = companyType
            vc?.abn = abn
            vc?.companyAddress = companyAddress
            vc?.role_avail = "\(JobType)"
            vc?.industry = IndustryValue
            vc?.position = RoleValue
            vc?.salary = salaryValue
            vc?.contractLength = lengthValue
            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }
    
    @IBAction func partTimeClicked(_ sender: UIButton) {
        JobType = 1
        btnLength.isUserInteractionEnabled = false
        lengthView.isHidden = true
        lengthValue = ""
        btnPartTime.setImage(UIImage(named: "select"), for: .normal)
        btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnContract.setImage(UIImage(named: "unselect"), for: .normal)
        btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
        btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func fullTimeClicked(_ sender: UIButton) {
        JobType = 2
        btnLength.isUserInteractionEnabled = false
        lengthView.isHidden = true
        lengthValue = ""
        btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnFullTime.setImage(UIImage(named: "select"), for: .normal)
        btnContract.setImage(UIImage(named: "unselect"), for: .normal)
        btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
        btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func contractClicked(_ sender: UIButton) {
        JobType = 3
        btnLength.isUserInteractionEnabled = true
        lengthView.isHidden = false
        btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnContract.setImage(UIImage(named: "select"), for: .normal)
        btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
        btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func casualClicked(_ sender: UIButton) {
        JobType = 4
        btnLength.isUserInteractionEnabled = false
        lengthView.isHidden = true
        lengthValue = ""
        btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnContract.setImage(UIImage(named: "unselect"), for: .normal)
        btnCasual.setImage(UIImage(named: "select"), for: .normal)
        btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func temporaryClicked(_ sender: UIButton) {
        JobType = 5
        btnLength.isUserInteractionEnabled = true
        lengthView.isHidden = false
        btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
        btnContract.setImage(UIImage(named: "unselect"), for: .normal)
        btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
        btnTemporary.setImage(UIImage(named: "select"), for: .normal)
    }
    
    
    @IBAction func DropIndustryClicked(_ sender: UIButton) {
        getIndustryListAPI()
    }
    
    
    @IBAction func DropRoleClicked(_ sender: UIButton) {
        if industryid == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Industry Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            getJobRoleListAPI()
        }
    }
    
    @IBAction func dropSalaryClicked(_ sender: UIButton) {
        salary.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblSalary.text = item
            self.salaryValue = item
            self.imgSalary.image = UIImage(named: "drop")
            //self.AccountselctedValue = self.accountdata[0].data[index].id
           // print(self.AccountselctedValue)
        }
        self.salary.anchorView = self.salaryView
        self.imgSalary.image = UIImage(named: "plus")
        self.salary.dataSource = salaryType
        self.salary.cellConfiguration = { (index, item) in return "\(item)" }
        
        salary.bottomOffset = CGPoint(x: 0, y:(salary.anchorView?.plainView.bounds.height)!)
        salary.setupCornerRadius(10.0)
        salary.backgroundColor = UIColor.white
        salary.textColor = UIColor(hexString: "#717171")
        salary.layer.borderColor = UIColor(hexString: "#717171").cgColor
        salary.layer.borderWidth = 1.0
        salary.direction = .bottom
        
        salary.show()
    }
    
    @IBAction func dropLengthClicked(_ sender: UIButton) {
        length.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblLength.text = item
            self.lengthValue = item
            self.imgLength.image = UIImage(named: "drop")
            //self.AccountselctedValue = self.accountdata[0].data[index].id
           // print(self.AccountselctedValue)
        }
        self.length.anchorView = self.lengthView
        self.imgLength.image = UIImage(named: "plus")
        self.length.dataSource = lengthType
        self.length.cellConfiguration = { (index, item) in return "\(item)" }
        
        length.bottomOffset = CGPoint(x: 0, y:(length.anchorView?.plainView.bounds.height)!)
        length.setupCornerRadius(10.0)
        length.backgroundColor = UIColor.white
        length.textColor = UIColor(hexString: "#717171")
        length.layer.borderColor = UIColor(hexString: "#717171").cgColor
        length.layer.borderWidth = 1.0
        length.direction = .bottom
        
        length.show()
    }
    
    func getIndustryListAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["":""]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.industryList, requestMethod: .GET, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    //let data = kSharedInstance.getDictionary(dictResult["data"])
                    //let datashow = kSharedInstance.getArray(withDictionary: data["details"])
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                        print(datashow)
                        
                        self.IndustryListArr.removeAll()
                        self.IndustryType.removeAll()
                        self.IndustryTypeId.removeAll()
                        self.IndustryListArr = datashow.map{industryListModal(data: $0)}
                        
                        for i in 0...self.IndustryListArr.count-1{
                            let obj = self.IndustryListArr[i]
                            self.IndustryType.append(obj.name!)
                            self.IndustryTypeId.append("\(obj.id!)")
                        }
                        
                        self.Industry.selectionAction = { (index: Int, item: String) in
                        print("Selected item: \(item) at index: \(index)")
                        self.lblIndustry.text = item
                            self.IndustryValue = item
                            self.industryid = self.IndustryTypeId[index]
                            self.imgIndustry.image = UIImage(named: "drop")
                        }
                        self.Industry.anchorView = self.industryView
                        self.imgIndustry.image = UIImage(named: "plus")
                        self.Industry.bottomOffset = CGPoint(x: 0, y:(self.Industry.anchorView?.plainView.bounds.height)!)
                        self.Industry.setupCornerRadius(10.0)
                        self.Industry.dataSource = self.IndustryType
                        self.Industry.cellConfiguration = { (index, item) in return "\(item)" }
                        
                        self.Industry.bottomOffset = CGPoint(x: 0, y:(self.Industry.anchorView?.plainView.bounds.height)!)
                        self.Industry.setupCornerRadius(10.0)
                        self.Industry.backgroundColor = UIColor.white
                        self.Industry.textColor = UIColor(hexString: "#717171")
                        self.Industry.layer.borderColor = UIColor(hexString: "#717171").cgColor
                        self.Industry.layer.borderWidth = 1.0
                        self.Industry.direction = .bottom
                        
                        self.Industry.show()
                        
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
    
    //industry_ids
    func getJobRoleListAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["industry_ids":industryid]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.jobRoleList, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    //let data = kSharedInstance.getDictionary(dictResult["data"])
                    //let datashow = kSharedInstance.getArray(withDictionary: data["details"])
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                        print(datashow)
                        
                        self.RoleListArr.removeAll()
                        self.RoleType.removeAll()
                        self.RoleListArr = datashow.map{roleListModal(data: $0)}
                        
                        for i in 0...self.RoleListArr.count-1{
                            let obj = self.RoleListArr[i]
                            self.RoleType.append(obj.job_role!)
                        }
                        
                        self.Role.selectionAction = { (index: Int, item: String) in
                        print("Selected item: \(item) at index: \(index)")
                        self.lblRole.text = item
                            self.RoleValue = item
                            self.imgRole.image = UIImage(named: "drop")
                        }
                        self.Role.anchorView = self.roleView
                        self.imgRole.image = UIImage(named: "plus")
                        self.Role.dataSource = self.RoleType
                        self.Role.cellConfiguration = { (index, item) in return "\(item)" }
                        
                        self.Role.bottomOffset = CGPoint(x: 0, y:(self.Role.anchorView?.plainView.bounds.height)!)
                        self.Role.setupCornerRadius(10.0)
                        self.Role.backgroundColor = UIColor.white
                        self.Role.textColor = UIColor(hexString: "#717171")
                        self.Role.layer.borderColor = UIColor(hexString: "#717171").cgColor
                        self.Role.layer.borderWidth = 1.0
                        self.Role.direction = .bottom
                        
                        self.Role.show()
                        
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

