//
//  IdealCandidateVC2.swift
//  promoted
//
//  Created by Vikram Sindhu on 16/12/22.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class IdealCandidateVC2: BaseViewController, UITextViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var lblTitle: UILabel!
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
    
    
    
    @IBOutlet weak var btnExpYes: UIButton!
    @IBOutlet weak var btnExpNo: UIButton!
    
    @IBOutlet weak var btnEdu1: UIButton!
    @IBOutlet weak var btnEdu2: UIButton!
    @IBOutlet weak var btnEdu3: UIButton!
    @IBOutlet weak var btnEdu4: UIButton!
    @IBOutlet weak var btnEdu5: UIButton!
    @IBOutlet weak var btnEdu6: UIButton!
    @IBOutlet weak var btnEdu7: UIButton!
    
    @IBOutlet weak var btnProYes: UIButton!
    @IBOutlet weak var btnProNo: UIButton!
    
    @IBOutlet weak var tfPreferTitle: UITextField!
    @IBOutlet weak var tfPreferIssue: UITextField!
    
    @IBOutlet weak var accridationLbl: UILabel!
    @IBOutlet weak var issuerLbl: UILabel!
    
    @IBOutlet weak var topContraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var btnCertYes: UIButton!
    @IBOutlet weak var btnCertNo: UIButton!
    @IBOutlet weak var btnCertDicuss: UIButton!
    
    @IBOutlet weak var btnRelocateYes: UIButton!
    @IBOutlet weak var btnRelocateNo: UIButton!
    @IBOutlet weak var btnRelocateDicuss: UIButton!
    
    @IBOutlet weak var btnInHouse: UIButton!
    @IBOutlet weak var btnRemote: UIButton!
    @IBOutlet weak var btnHybrid: UIButton!
    @IBOutlet weak var btnDiscuss: UIButton!
    
    @IBOutlet weak var noteView: UIView!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    
    var jobid = Int()
    var JobType = 0
    var expFlag = Int()
    var EduFlag = Int()
    var ProFlag = Int()
    var certFlag = Int()
    var relocateFlag = Int()
    var workFlag = 0
    var newFlag = Bool()
    
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
        
        Customise()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        IndustryValue = ""
        RoleValue = ""
        salaryValue = ""
        lengthValue = ""
        btnLength.isUserInteractionEnabled = true
        lengthView.isHidden = false
        
        if newFlag == true{
            lblTitle.text = "New Job Listing"
            saveBtn.setTitle("CREATE NEW JOB LISTING", for: .normal)
        }else{
            lblTitle.text = "Edit Job Listing"
            saveBtn.setTitle("SAVE", for: .normal)
            getJobListingDetailApi()
        }
        
    }
    
    func Customise()
    {
        
        saveBtn.layer.cornerRadius = 10.0
        industryView.layer.cornerRadius = 10.0
        roleView.layer.cornerRadius = 10.0
        salaryView.layer.cornerRadius = 10.0
        lengthView.layer.cornerRadius = 10.0
        
        btnExpYes.layer.cornerRadius = 10.0
        btnExpNo.layer.cornerRadius = 10.0
        
        btnEdu1.layer.cornerRadius = 10.0
        btnEdu2.layer.cornerRadius = 10.0
        btnEdu3.layer.cornerRadius = 10.0
        btnEdu4.layer.cornerRadius = 10.0
        btnEdu5.layer.cornerRadius = 10.0
        btnEdu6.layer.cornerRadius = 10.0
        btnEdu7.layer.cornerRadius = 10.0
        
        btnProYes.layer.cornerRadius = 10.0
        btnProNo.layer.cornerRadius = 10.0
        
        noteView.layer.cornerRadius = 10.0
        noteTextView.inputAccessoryView = toolBar()
        
        btnRelocateYes.layer.cornerRadius = 10.0
        btnRelocateNo.layer.cornerRadius = 10.0
        btnRelocateDicuss.layer.cornerRadius = 10.0
        
        btnInHouse.layer.cornerRadius = 10.0
        btnRemote.layer.cornerRadius = 10.0
        btnHybrid.layer.cornerRadius = 10.0
        btnDiscuss.layer.cornerRadius = 10.0
        
        tfPreferTitle.layer.cornerRadius = 10.0
        tfPreferIssue.layer.cornerRadius = 10.0
        
        btnCertYes.layer.cornerRadius = 10.0
        btnCertNo.layer.cornerRadius = 10.0
        btnCertDicuss.layer.cornerRadius = 10.0
        
        industryView.layer.borderWidth = 1.0
        industryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        roleView.layer.borderWidth = 1.0
        roleView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        salaryView.layer.borderWidth = 1.0
        salaryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        lengthView.layer.borderWidth = 1.0
        lengthView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        //IndustryType = ["Accounting","Administration & Office Support","Advertising, Arts & Media","Banking & Financial Services","Call Centre & Customer Service","CEO & General Management","Community Services & Development", "Construction","Consulting & Strategy","Design & Architecture","Education & Training","Engineering"]
        //RoleType = ["Accounting Officer","Accounts Payable","Accounts Receivable","Analysis & Reporting","Assistant Accountants","Audit - External","Audit - Internal","Bookkeeping & Small Practice","Business Services & Advisory","Company Secretaries","Compliance  & Risk","Cost Accounting"]
        salaryType = ["$10,000 - $20,000","$20,000 - $30,000","$30,000 - $40,000","$40,000 - $50,000","$50,000 - $60,000","$60,000 - $70,000","$70,000 - $80,000","$80,000 - $90,000","$90,000 - $100,000","$100,000 - $150,000","$150,000 - $200,000","$200,000 - $300,000","$300,000 and Above"]
        lengthType = ["1 Month","2 Months","3 Months","4 Months","5 Months","6 Months","7 Months","8 Months","9 Months","10 Months","11 Months","12 Months","12 Months+"]
        
        tfPreferIssue.delegate = self
        tfPreferTitle.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfPreferIssue.placeholder ?? ""
        tfPreferIssue.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfPreferTitle.placeholder ?? ""
        tfPreferTitle.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
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
        else if lengthValue == "" && (JobType == 3 || JobType == 5){
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Contract Length", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else if expFlag == nil {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer previous experience?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if EduFlag == nil {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Education", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if ProFlag == nil {
            
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer professional accreditation?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if ProFlag == 1 && tfPreferTitle.text == ""{
            
                let alert = UIAlertController(title: "Procruited", message: "Please Enter Preferred title", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if tfPreferIssue.text == "" && ProFlag == 1  {
                let alert = UIAlertController(title: "Procruited", message: "Please Enter Preferred issuer", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        
        else if certFlag == nil {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer uploaded certificate?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if relocateFlag == nil {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer Willing to relocate?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if workFlag == 0 {
            let alert = UIAlertController(title: "Procruited", message: "Please Select work model", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            if newFlag == true{
                JobListRegisterApi()
            }else{
                JobListUpdateApi()
            }
        }
        
        
    }
    
    @IBAction func partTimeClicked(_ sender: UIButton) {
        JobType = 1
        btnLength.isUserInteractionEnabled = false
        lengthView.isHidden = true
            self.lengthValue = ""
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
            self.lengthValue = ""
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
            self.lengthValue = ""
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
        view.endEditing(true)
        getIndustryListAPI()
        
        
        
    }
    
    @IBAction func DropRoleClicked(_ sender: UIButton) {
        view.endEditing(true)
        
        if industryid == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Industry Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            getJobRoleListAPI()
        }
        
    }
    
    @IBAction func dropSalaryClicked(_ sender: UIButton) {
        view.endEditing(true)
        salary.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblSalary.text = item
            self.salaryValue = item
            self.imgSalary.image = UIImage(named: "drop")
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
        view.endEditing(true)
        length.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblLength.text = item
            self.lengthValue = item
            self.imgLength.image = UIImage(named: "drop")
            //self.imgLength.image = UIImage(named: "drop")
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
    
    @IBAction func expYesClicked(_ sender: UIButton) {
        expFlag = 1
        btnExpYes.setImage(UIImage(named: "select"), for: .normal)
        btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func expNoClicked(_ sender: UIButton) {
        expFlag = 0
        btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnExpNo.setImage(UIImage(named: "select"), for: .normal)
    }
    
    @IBAction func anyClicked(_ sender: UIButton) {
        EduFlag = 1
        btnEdu1.setImage(UIImage(named: "select"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func highSchoolClicked(_ sender: UIButton) {
        EduFlag = 2
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "select"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func associateClicked(_ sender: UIButton) {
        EduFlag = 3
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "select"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func tafeClicked(_ sender: UIButton) {
        EduFlag = 4
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "select"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func bachelorClicked(_ sender: UIButton) {
        EduFlag = 5
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "select"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func masterClicked(_ sender: UIButton) {
        EduFlag = 6
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "select"), for: .normal)
        btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func doctrateClicked(_ sender: UIButton) {
        EduFlag = 7
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu7.setImage(UIImage(named: "select"), for: .normal)
    }
    
    
    @IBAction func ProfessionYesClicked(_ sender: UIButton) {
        ProFlag = 1
        btnProYes.setImage(UIImage(named: "select"), for: .normal)
        btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
        topContraint.constant = 251.0
        tfPreferTitle.isHidden = false
        tfPreferIssue.isHidden = false
        accridationLbl.isHidden = false
        issuerLbl.isHidden = false
        
    }
    
    @IBAction func ProfessionNoClicked(_ sender: UIButton) {
        ProFlag = 0
        btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnProNo.setImage(UIImage(named: "select"), for: .normal)
        topContraint.constant = 32.0
        tfPreferTitle.isHidden = true
        tfPreferIssue.isHidden = true
        accridationLbl.isHidden = true
        issuerLbl.isHidden = true
    }
    
    
    @IBAction func certYesClicked(_ sender: UIButton) {
        certFlag = 1
        btnCertYes.setImage(UIImage(named: "select"), for: .normal)
        btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnCertDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func certNoClicked(_ sender: UIButton) {
        certFlag = 0
        btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnCertNo.setImage(UIImage(named: "select"), for: .normal)
        btnCertDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func certDicussionClicked(_ sender: UIButton) {
        certFlag = 2
        btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnCertDicuss.setImage(UIImage(named: "select"), for: .normal)

    }
    
    @IBAction func relocateYesClicked(_ sender: UIButton) {
        relocateFlag = 1
        btnRelocateYes.setImage(UIImage(named: "select"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func relocateNoClicked(_ sender: UIButton) {
        relocateFlag = 0
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "select"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func relocateDiscussClicked(_ sender: UIButton) {
        relocateFlag = 2
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "select"), for: .normal)
    }
    
    @IBAction func inHouseClicked(_ sender: UIButton) {
        workFlag = 1
        btnInHouse.setImage(UIImage(named: "select"), for: .normal)
        btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
        btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func remoteClicked(_ sender: UIButton) {
        workFlag = 2
        btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
        btnRemote.setImage(UIImage(named: "select"), for: .normal)
        btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func hybridClicked(_ sender: UIButton) {
        workFlag = 3
        btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
        btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
        btnHybrid.setImage(UIImage(named: "select"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func discussionClicked(_ sender: UIButton) {
        workFlag = 4
        btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
        btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
        btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
        btnDiscuss.setImage(UIImage(named: "select"), for: .normal)
    }
    
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if noteTextView.text.count <= 200
            {
                // Code here
            }
            else
            {
                //Code Here
//                noteTextView.endEditing(true)
//                let alert = UIAlertController(title: "Procruited", message: "Max 200 words Reached!", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
            }
            return true
        }
    
    
}

//MARK: - MObileNumberApi

extension IdealCandidateVC2{
    
    func JobListRegisterApi(){
        CommonUtils.showHudWithNoInteraction(show: true)
            var params = [String:Any]()
        
        params = ["job_type":JobType,"job_role":RoleValue,"industry":IndustryValue, "position":RoleValue, "salary":salaryValue,"contract_length":lengthValue, "prefer_previous_experience":expFlag, "preferred_educational_level":EduFlag, "prefer_professional_accreditation":ProFlag, "preferred_title":tfPreferTitle.text!, "prefereed_issuer":tfPreferIssue.text!, "willing_to_relocate":"\(relocateFlag)","work_model":"\(workFlag)","anything_else_for_job":noteTextView.text!,"preferred_uploaded_certificate":certFlag
            ]
        print(params)
            //,"prefer_uploaded_certificate":certFlag!
                    
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.newJobListing,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
            { (result:Any?, error:Error?, errortype:ErrorType?, statusCode:Int?) in
                CommonUtils.showHudWithNoInteraction(show: false)
                if errortype == .requestSuccess {
                    let dictResult = kSharedInstance.getDictionary(result)
                    switch Int.getInt(statusCode) {
                    case 200:
                        let staus  = String.getString(dictResult["status"])
                        if staus == "SUCCESS"
                        {
                           // self.showSimpleAlert(message: "profile pic updated successfully" )
                           // self.view.makeToast("This is a piece of toast", duration: 3.0, position: .top)
                                        
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
                            self.navigationController?.pushViewController(vc!, animated: false)
                            Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        }else{
                            Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MySubscriptionVC") as? MySubscriptionVC
                            self.navigationController?.pushViewController(vc!, animated: false)
                        }
                        
                    default:
                     Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        //CommonUtils.showError(.info, String.getString(dictResult["message"]))
                    }
                } else if errortype == .noNetwork {
                    CommonUtils.showToastForInternetUnavailable()
                } else {
                    CommonUtils.showToastForDefaultError()
                }
            }
        }
    
    func JobListUpdateApi(){
        CommonUtils.showHudWithNoInteraction(show: true)
            var params = [String:Any]()
        
        params = ["job_listing_id":"\(jobid)","job_type":JobType,"job_role":RoleValue,"industry":IndustryValue, "position":RoleValue, "salary":salaryValue,"contract_length":lengthValue, "prefer_previous_experience":expFlag, "preferred_educational_level":EduFlag, "prefer_professional_accreditation":ProFlag, "preferred_title":tfPreferTitle.text!, "prefereed_issuer":tfPreferIssue.text!, "willing_to_relocate":"\(relocateFlag)","work_model":"\(workFlag)","anything_else_for_job":noteTextView.text!,"preferred_uploaded_certificate":certFlag
            ]
        print(params)
           
                    
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.updateJobListing,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
            { (result:Any?, error:Error?, errortype:ErrorType?, statusCode:Int?) in
                CommonUtils.showHudWithNoInteraction(show: false)
                if errortype == .requestSuccess {
                    let dictResult = kSharedInstance.getDictionary(result)
                    switch Int.getInt(statusCode) {
                    case 200:
                        let staus  = String.getString(dictResult["status"])
                        if staus == "SUCCESS"
                        {
                            
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
                            self.navigationController?.pushViewController(vc!, animated: false)
                            Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                            
                        }else{
                            Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MySubscriptionVC") as? MySubscriptionVC
                            self.navigationController?.pushViewController(vc!, animated: false)
                        }
                        
                    default:
                     Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        //CommonUtils.showError(.info, String.getString(dictResult["message"]))
                    }
                } else if errortype == .noNetwork {
                    CommonUtils.showToastForInternetUnavailable()
                } else {
                    CommonUtils.showToastForDefaultError()
                }
            }
        }
    
    func getJobListingDetailApi()
    {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["job_listing_id":"\(jobid)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getJobListingDetail,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            if errorType == .requestSuccess{
                let dictResult = kSharedInstance.getDictionary(result)  //result as! [String: Any]
                switch Int.getInt(statusCode) {
                case 200:
                    let status = String.getString(dictResult["status"])
                    if status == "SUCCESS"{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        
                        self!.lblIndustry.text = String.getString(data["industry"])
                        self!.IndustryValue = String.getString(data["industry"])
                        self!.imgIndustry.image = UIImage(named: "drop")
                        self!.lblRole.text = String.getString(data["position"])
                        self!.RoleValue = String.getString(data["position"])
                        self!.imgRole.image = UIImage(named: "drop")
                        self!.lblSalary.text = String.getString(data["salary"])
                        self!.salaryValue = String.getString(data["salary"])
                        self!.imgSalary.image = UIImage(named: "drop")
                        //self!.lblLength.text = String.getString(data["contract_length"])
                        //self!.lengthValue = String.getString(data["contract_length"])
                        self!.imgLength.image = UIImage(named: "drop")
                        self!.tfPreferTitle.text = String.getString(data["preferred_title"])
                        self!.tfPreferIssue.text = String.getString(data["prefereed_issuer"])
                        self!.noteTextView.text = String.getString(data["anything_else_for_job"])
                        
                        let jobValue = Int.getInt(data["job_type"])
                        if jobValue == 1 {
                            self!.JobType = 1
                            self!.btnLength.isUserInteractionEnabled = false
                            self!.lengthView.isHidden = true
                            self!.lengthValue = ""
                            self!.lblLength.text = String.getString(data["contract_length"])
                            self!.lengthValue = String.getString(data["contract_length"])
                            self!.btnPartTime.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValue == 2 {
                            self!.JobType = 2
                            self!.btnLength.isUserInteractionEnabled = false
                            self!.lengthView.isHidden = true
                            self!.lengthValue = ""
                            self!.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnFullTime.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValue == 3 {
                            self!.JobType = 3
                            self!.btnLength.isUserInteractionEnabled = true
                            self!.lengthView.isHidden = false
                            self!.lblLength.text = String.getString(data["contract_length"])
                            self!.lengthValue = String.getString(data["contract_length"])
                            self!.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnContract.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValue == 4 {
                            self!.JobType = 4
                            self!.btnLength.isUserInteractionEnabled = false
                            self!.lengthView.isHidden = true
                            self!.lengthValue = ""
                            self!.lblLength.text = String.getString(data["contract_length"])
                            self!.lengthValue = String.getString(data["contract_length"])
                            self!.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCasual.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValue == 5 {
                            self!.JobType = 5
                            self!.btnLength.isUserInteractionEnabled = true
                            self!.lengthView.isHidden = false
                            self!.lblLength.text = String.getString(data["contract_length"])
                            self!.lengthValue = String.getString(data["contract_length"])
                            self!.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnTemporary.setImage(UIImage(named: "select"), for: .normal)
                        }else {
                            self!.btnLength.isUserInteractionEnabled = true
                            self!.lengthView.isHidden = false
                            self!.lblLength.text = String.getString(data["contract_length"])
                            self!.lengthValue = String.getString(data["contract_length"])
                            self!.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let expValue = Int.getInt(data["prefer_previous_experience"])
                        if expValue == 1 {
                            self!.expFlag = 1
                            self!.btnExpYes.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if expValue == 0 {
                            self!.expFlag = 1
                            self!.btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnExpNo.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            self!.btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let eduValue = Int.getInt(data["preferred_educational_level"])
                        if eduValue == 1 {
                            self!.EduFlag = 1
                            self!.btnEdu1.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 2 {
                            self!.EduFlag = 2
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 3 {
                            self!.EduFlag = 3
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 4 {
                            self!.EduFlag = 4
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 5 {
                            self!.EduFlag = 5
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 6 {
                            self!.EduFlag = 6
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 7 {
                            self!.EduFlag = 7
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            self!.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let proValue = Int.getInt(data["prefer_professional_accreditation"])
                        if proValue == 1 {
                            self!.ProFlag = 1
                            self!.btnProYes.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.topContraint.constant = 251.0
                            self!.tfPreferTitle.isHidden = false
                            self!.tfPreferIssue.isHidden = false
                            self!.accridationLbl.isHidden = false
                            self!.issuerLbl.isHidden = false
                        }else if proValue == 0 {
                            self!.ProFlag = 0
                            self!.btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnProNo.setImage(UIImage(named: "select"), for: .normal)
                            self!.topContraint.constant = 32.0
                            self!.tfPreferTitle.isHidden = true
                            self!.tfPreferIssue.isHidden = true
                            self!.accridationLbl.isHidden = true
                            self!.issuerLbl.isHidden = true
                        }else{
                            self!.btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.topContraint.constant = 251.0
                            self!.tfPreferTitle.isHidden = false
                            self!.tfPreferIssue.isHidden = false
                            self!.accridationLbl.isHidden = false
                            self!.issuerLbl.isHidden = false
                        }
                        
                        let certValue = Int.getInt(data["preferred_uploaded_certificate"])
                        if certValue == 1{
                            self!.certFlag = 1
                            self!.btnCertYes.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCertDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if certValue == 0{
                            self!.certFlag = 0
                            self!.btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCertNo.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnCertDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if certValue == 2{
                            self!.certFlag = 2
                            self!.btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCertDicuss.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            
                            self!.btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnCertDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let relocateValue = Int.getInt(data["willing_to_relocate"])
                        if relocateValue == 1{
                            self!.relocateFlag = 1
                            self!.btnRelocateYes.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if relocateValue == 0{
                            self!.relocateFlag = 0
                            self!.btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRelocateNo.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if relocateValue == 2{
                            self!.relocateFlag = 2
                            self!.btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRelocateDicuss.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            self!.btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let workValue = Int.getInt(data["work_model"])
                        if workValue == 1{
                            self!.workFlag = 1
                            self!.btnInHouse.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if workValue == 2{
                            self!.workFlag = 2
                            self!.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRemote.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if workValue == 3{
                            self!.workFlag = 3
                            self!.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnHybrid.setImage(UIImage(named: "select"), for: .normal)
                            self!.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if workValue == 4{
                            self!.workFlag = 4
                            self!.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnDiscuss.setImage(UIImage(named: "select"), for: .normal)
                        }else {
                            self!.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self!.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
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
