//
//  userJobSettingVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 23/12/22.
//

import UIKit
import DropDown
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD
import MobileCoreServices
import UniformTypeIdentifiers

class userJobSettingVC: BaseViewController2, UITableViewDataSource, UITableViewDelegate,UITextViewDelegate,UITextFieldDelegate,UIDocumentPickerDelegate {
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var btnPartTime: UIButton!
    @IBOutlet weak var btnFullTime: UIButton!
    @IBOutlet weak var btnContract: UIButton!
    @IBOutlet weak var btnCasual: UIButton!
    @IBOutlet weak var btnTemporary: UIButton!
    
    @IBOutlet weak var industryView: UIView!
    @IBOutlet weak var lblIndustry: UILabel!
    @IBOutlet weak var imgIndustry: UIImageView!
    @IBOutlet weak var btnIndustry: UIButton!
    @IBOutlet weak var tblIndustry: UITableView!
    @IBOutlet weak var tblIndustryConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var roleView: UIView!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var imgRole: UIImageView!
    @IBOutlet weak var btnRole: UIButton!
    @IBOutlet weak var tblRole: UITableView!
    @IBOutlet weak var tblRoleConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var salaryView: UIView!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var imgSalary: UIImageView!
    @IBOutlet weak var btnSalary: UIButton!
    @IBOutlet weak var tblSalary: UITableView!
    @IBOutlet weak var tblSalaryConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lengthView: UIView!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var imgLength: UIImageView!
    @IBOutlet weak var btnLength: UIButton!
    @IBOutlet weak var tblLength: UITableView!
    @IBOutlet weak var tblLengthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var addBtnConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var btnExpYes: UIButton!
    @IBOutlet weak var btnExpNo: UIButton!
    
    @IBOutlet weak var btnEdu1: UIButton!
    @IBOutlet weak var btnEdu2: UIButton!
    @IBOutlet weak var btnEdu3: UIButton!
    @IBOutlet weak var btnEdu4: UIButton!
    @IBOutlet weak var btnEdu5: UIButton!
    @IBOutlet weak var btnEdu6: UIButton!
    
    @IBOutlet weak var btnProYes: UIButton!
    @IBOutlet weak var btnProNo: UIButton!
    
    @IBOutlet weak var tfPreferTitle: UITextField!
    @IBOutlet weak var tfPreferIssue: UITextField!
    @IBOutlet weak var certView:UIView!
    @IBOutlet weak var certLbl:UILabel!
    
    
    @IBOutlet weak var View1:UIView!
    @IBOutlet weak var tfPreferTitleView1: UITextField!
    @IBOutlet weak var tfPreferIssueView1: UITextField!
    @IBOutlet weak var View1certView:UIView!
    @IBOutlet weak var certLblView1:UILabel!
    
    
    @IBOutlet weak var View2:UIView!
    @IBOutlet weak var tfPreferTitleView2: UITextField!
    @IBOutlet weak var tfPreferIssueView2: UITextField!
    @IBOutlet weak var View2certView:UIView!
    @IBOutlet weak var certLblView2:UILabel!
    
    
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var tfPreferTitleView3: UITextField!
    @IBOutlet weak var tfPreferIssuerView3: UITextField!
    @IBOutlet weak var View3certView: UIView!
    @IBOutlet weak var certLblView3: UILabel!
    
    @IBOutlet weak var View4: UIView!
    @IBOutlet weak var tfPreferTitleView4: UITextField!
    @IBOutlet weak var tfPreferIssuerView4: UITextField!
    @IBOutlet weak var View4certView: UIView!
    @IBOutlet weak var certLblView4: UILabel!
    
    @IBOutlet weak var btnRelocateYes: UIButton!
    @IBOutlet weak var btnRelocateNo: UIButton!
    @IBOutlet weak var btnRelocateDicuss: UIButton!
    
    @IBOutlet weak var btnInHouse: UIButton!
    @IBOutlet weak var btnRemote: UIButton!
    @IBOutlet weak var btnHybrid: UIButton!
    @IBOutlet weak var btnDiscuss: UIButton!
    
    @IBOutlet weak var noteView: UIView!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    
    var partTime = Int()
    var fullTime = Int()
    var contract = Int()
    var casual = Int()
    var temperary = Int()
    
    var expFlag = Int()
    var EduFlag = Int()
    var ProFlag = Int()
    var certFlag = Int()
    var uploadFlag = 0
    
    var doc1 = NSURL()
    var doc2 = NSURL()
    var doc3 = NSURL()
    var doc4 = NSURL()
    var doc5 = NSURL()
    
    var relocateFlag = Int()
    var workFlag = 0
    
    var JobTypeItems = [String]()
    
    var IndustryListArr = [industryListModal]()
    let Industry = DropDown()
    var IndustryType = [String]()
    var IndustryTypeID = [String]()
    var IndustryValue = [String]()
    var industryid = [String]()
    
    var RoleListArr = [roleListModal]()
    let Role = DropDown()
    var RoleType = [String]()
    var RoleValue = [String]()
    
    let salary = DropDown()
    var salaryType = [String]()
    var salaryValue = [String]()
    
    let length = DropDown()
    var lengthType = [String]()
    var lengthValue = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Customise()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        IndustryValue.removeAll()
        RoleValue.removeAll()
        salaryValue.removeAll()
        lengthValue.removeAll()
        tblIndustry.delegate = self
        tblIndustry.dataSource = self
        tblRole.delegate = self
        tblRole.dataSource = self
        tblSalary.delegate = self
        tblSalary.dataSource = self
        tblLength.delegate = self
        tblLength.dataSource = self
        
        tblIndustryConstraint.constant = 0.0
        tblRoleConstraint.constant = 0.0
        tblSalaryConstraint.constant = 0.0
        tblLengthConstraint.constant = 0.0
        
        View1.isHidden = true
        View2.isHidden = true
        View4.isHidden = true
        View3.isHidden = true
        addBtnConstraint.constant = 45.0
        
        getCandidateJobSettingAPI()
        
    }
    
    
    func Customise()
    {
        
        saveBtn.layer.cornerRadius = 10.0
        industryView.layer.cornerRadius = 10.0
        roleView.layer.cornerRadius = 10.0
        salaryView.layer.cornerRadius = 10.0
        lengthView.layer.cornerRadius = 10.0
        
        addBtn.layer.cornerRadius = 10.0
        
        btnExpYes.layer.cornerRadius = 10.0
        btnExpNo.layer.cornerRadius = 10.0
        
        btnEdu1.layer.cornerRadius = 10.0
        btnEdu2.layer.cornerRadius = 10.0
        btnEdu3.layer.cornerRadius = 10.0
        btnEdu4.layer.cornerRadius = 10.0
        btnEdu5.layer.cornerRadius = 10.0
        btnEdu6.layer.cornerRadius = 10.0
        
        btnProYes.layer.cornerRadius = 10.0
        btnProNo.layer.cornerRadius = 10.0
        
        tfPreferTitle.layer.cornerRadius = 10.0
        tfPreferIssue.layer.cornerRadius = 10.0
        
        btnRelocateYes.layer.cornerRadius = 10.0
        btnRelocateNo.layer.cornerRadius = 10.0
        btnRelocateDicuss.layer.cornerRadius = 10.0
        
        btnInHouse.layer.cornerRadius = 10.0
        btnRemote.layer.cornerRadius = 10.0
        btnHybrid.layer.cornerRadius = 10.0
        btnDiscuss.layer.cornerRadius = 10.0
        
        
        industryView.layer.borderWidth = 1.0
        industryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        roleView.layer.borderWidth = 1.0
        roleView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        salaryView.layer.borderWidth = 1.0
        salaryView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        lengthView.layer.borderWidth = 1.0
        lengthView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        noteView.layer.cornerRadius = 10.0
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        certView.layer.cornerRadius = 10.0
        certView.layer.borderWidth = 1.0
        certView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        View1certView.layer.cornerRadius = 10.0
        View1certView.layer.borderWidth = 1.0
        View1certView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        View2certView.layer.cornerRadius = 10.0
        View2certView.layer.borderWidth = 1.0
        View2certView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        View3certView.layer.cornerRadius = 10.0
        View3certView.layer.borderWidth = 1.0
        View3certView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        View4certView.layer.cornerRadius = 10.0
        View4certView.layer.borderWidth = 1.0
        View4certView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        
        
        //IndustryType = ["Accounting","Administration & Office Support","Advertising, Arts & Media","Banking & Financial Services","Call Centre & Customer Service","CEO & General Management","Community Services & Development", "Construction","Consulting & Strategy","Design & Architecture","Education & Training","Engineering"]
        //RoleType = ["Accounting Officer","Accounts Payable","Accounts Receivable","Analysis & Reporting","Assistant Accountants","Audit - External","Audit - Internal","Bookkeeping & Small Practice","Business Services & Advisory","Company Secretaries","Compliance  & Risk","Cost Accounting"]
        salaryType = ["$10000 - $20000","$20000 - $30000","$30000 - $40000","$40000 - $50000","$50000 - $60000","$60000 - $70000","$70000 - $80000","$80000 - $90000","$90000 - $100000","$100000 - $150000","$150000 - $200000","$200000 - $300000","$300,000 and Above"]
        lengthType = ["1 Month","2 Months","3 Months","4 Months","5 Months","6 Months","7 Months","8 Months","9 Months","10 Months","11 Months","12 Months","12 Months+"]
        
        
        tfPreferIssue.delegate = self
        tfPreferTitle.delegate = self
        tfPreferTitleView1.delegate = self
        tfPreferIssueView1.delegate = self
        tfPreferIssueView2.delegate = self
        tfPreferTitleView2.delegate = self
        tfPreferIssuerView3.delegate = self
        tfPreferTitleView3.delegate = self
        tfPreferIssuerView4.delegate = self
        tfPreferTitleView4.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfPreferIssueView1.placeholder ?? ""
        tfPreferIssueView1.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfPreferTitleView1.placeholder ?? ""
        tfPreferTitleView1.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfPreferIssueView2.placeholder ?? ""
        tfPreferIssueView2.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tfPreferTitleView2.placeholder ?? ""
        tfPreferTitleView2.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder5 = tfPreferIssuerView3.placeholder ?? ""
        tfPreferIssuerView3.attributedPlaceholder = NSAttributedString(string: placeholder5, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder6 = tfPreferTitleView3.placeholder ?? ""
        tfPreferTitleView3.attributedPlaceholder = NSAttributedString(string: placeholder6, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder7 = tfPreferIssuerView4.placeholder ?? ""
        tfPreferIssuerView4.attributedPlaceholder = NSAttributedString(string: placeholder7, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder8 = tfPreferTitleView4.placeholder ?? ""
        tfPreferTitleView4.attributedPlaceholder = NSAttributedString(string: placeholder8, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder9 = tfPreferIssue.placeholder ?? ""
        tfPreferIssue.attributedPlaceholder = NSAttributedString(string: placeholder9, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder10 = tfPreferTitle.placeholder ?? ""
        tfPreferTitle.attributedPlaceholder = NSAttributedString(string: placeholder10, attributes: [NSAttributedString.Key.foregroundColor : color])
        noteTextView.inputAccessoryView = toolBar()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func saveClicked(_ sender: UIButton) {
        if JobTypeItems.count == 0{
            self.showSimpleAlert(message: "Please select atleast one Job Type")
            return
        }
        else if IndustryValue.count == 0{
            self.showSimpleAlert(message: "Please select atleast one Industry Type")
            return
        }
        else if RoleValue.count == 0{
            self.showSimpleAlert(message: "Please select atleast one Position Type")
            return
        }
        else if salaryValue.count == 0{
            self.showSimpleAlert(message: "Please select atleast one Salary Type")
            return
        }
        else if expFlag == nil{
            self.showSimpleAlert(message: "Please select relevant Experince options ")
            return
        }
        else if EduFlag == 0{
            self.showSimpleAlert(message: "Please select Your Educational Level ")
            return
        }
        else if ProFlag == nil{
            self.showSimpleAlert(message: "Please select professional accreditation options ")
            return
        }
        else if ProFlag == 1 && doc1 == nil || ProFlag == 1 && tfPreferTitleView1.text == "" || ProFlag == 1 && tfPreferIssueView1.text == ""{
            self.showSimpleAlert(message: "Please add atleast one accreditation detail")
            return
        }else if relocateFlag == nil{
            self.showSimpleAlert(message: "Please select Relocate options ")
            return
        }
        else if workFlag == 0{
            self.showSimpleAlert(message: "Please select work model ")
            return
        }else{
            UpdateJobInterestAPI()
        }
        
        
        
        
    }
    
    
    
    @IBAction func partTimeClicked(_ sender: UIButton) {
        
        if partTime == 1{
            partTime = 0
            if let index = JobTypeItems.firstIndex(of: "1") {
                JobTypeItems.remove(at: index)
            }
            btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            partTime = 1
            JobTypeItems.append("1")
            btnPartTime.setImage(UIImage(named: "select"), for: .normal)
        }
    }
    
    
    @IBAction func fullTimeClicked(_ sender: UIButton) {
        if fullTime == 1{
            fullTime = 0
            if let index = JobTypeItems.firstIndex(of: "2") {
                JobTypeItems.remove(at: index)
            }
            btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            fullTime = 1
            JobTypeItems.append("2")
            btnFullTime.setImage(UIImage(named: "select"), for: .normal)
        }
    }
    
    @IBAction func contractClicked(_ sender: UIButton) {
        if contract == 1{
            contract = 0
            if let index = JobTypeItems.firstIndex(of: "3") {
                JobTypeItems.remove(at: index)
            }
            btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            
        }else{
            contract = 1
            JobTypeItems.append("3")
            btnContract.setImage(UIImage(named: "select"), for: .normal)
            
        }
    }
    
    
    @IBAction func casualClicked(_ sender: UIButton) {
        if casual == 1{
            casual = 0
            if let index = JobTypeItems.firstIndex(of: "4") {
                JobTypeItems.remove(at: index)
            }
            btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            casual = 1
            JobTypeItems.append("4")
            btnCasual.setImage(UIImage(named: "select"), for: .normal)
        }
    }
    
    @IBAction func temporaryClicked(_ sender: UIButton) {
        if temperary == 1{
            temperary = 0
            if let index = JobTypeItems.firstIndex(of: "5") {
                JobTypeItems.remove(at: index)
            }
            btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            temperary = 1
            JobTypeItems.append("5")
            btnTemporary.setImage(UIImage(named: "select"), for: .normal)
        }
    }
    
    
    @IBAction func DropIndustryClicked(_ sender: UIButton) {
        
        getIndustryListAPI()
    }
    
    
    @IBAction func DropRoleClicked(_ sender: UIButton) {
        if industryid.count == 0{
            self.showSimpleAlert(message: "Please select atleast one Industry Type")
            return
        }else{
            getJobRoleListAPI()
        }
    }
    
    @IBAction func dropSalaryClicked(_ sender: UIButton) {
        salary.multiSelectionAction = { [weak self] (indices, items) in
            print("Muti selection action called with: \(items)")
            if items.isEmpty {
                self!.salaryValue.removeAll()
                self!.tblSalary.reloadData()
                self!.tblSalaryConstraint.constant = 0.0
            }else{
                print(items)
                self!.salaryValue.removeAll()
                self!.salaryValue.append(contentsOf: items)
                self!.tblSalary.reloadData()
                self!.tblSalaryConstraint.constant = CGFloat(50*items.count)
            }
            self?.salary.customCellConfiguration = { (index: _, item: String, cell: DropDownCell) -> Void in
               guard let cell = cell as? MyCell else { return }
                
                if indices.contains(index) {
                    // Setup your custom UI components
                    cell.logoImageView.image = UIImage(named: "select")
                }else{
                    // Setup your custom UI components
                    cell.logoImageView.image = UIImage(named: "unselect")
                }
            }
            self!.imgSalary.image = UIImage(named: "drop")
        }
        
        self.salary.anchorView = self.btnSalary
        self.imgSalary.image = UIImage(named: "plus")
        self.salary.dataSource = salaryType
        //self.salary.cellConfiguration = { (index, item) in return "\(item)" }
        self.salary.cellNib = UINib(nibName: "MyCell", bundle: nil)
        self.salary.customCellConfiguration = { (index: _, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? MyCell else { return }

           // Setup your custom UI components
           cell.logoImageView.image = UIImage(named: "unselect")
        }
        
        salary.bottomOffset = CGPoint(x: 0, y:(salary.anchorView?.plainView.bounds.height)!)
        salary.setupCornerRadius(10.0)
        salary.backgroundColor = UIColor.white
        salary.textColor = UIColor(hexString: "#717171")
        salary.selectionBackgroundColor = UIColor.white
        salary.selectedTextColor = UIColor(hexString: "#717171")
        salary.layer.borderColor = UIColor(hexString: "#717171").cgColor
        salary.layer.borderWidth = 1.0
        salary.direction = .bottom
        
        salary.show()
    }
    
    @IBAction func dropLengthClicked(_ sender: UIButton) {
        
        if JobTypeItems.contains("3") || JobTypeItems.contains("5"){
            length.multiSelectionAction = { [weak self] (indices, items) in
                print("Muti selection action called with: \(items)")
                if items.isEmpty {
                    self!.lengthValue.removeAll()
                    self!.tblLength.reloadData()
                    self!.tblLengthConstraint.constant = 0.0
                }else{
                    print(items)
                    self!.lengthValue.removeAll()
                    self!.lengthValue.append(contentsOf: items)
                    self!.tblLength.reloadData()
                    self!.tblLengthConstraint.constant = CGFloat(50*items.count)
                }
                self?.length.customCellConfiguration = { (index: _, item: String, cell: DropDownCell) -> Void in
                    guard let cell = cell as? MyCell else { return }
                    
                    if indices.contains(index) {
                        // Setup your custom UI components
                        cell.logoImageView.image = UIImage(named: "select")
                    }else{
                        // Setup your custom UI components
                        cell.logoImageView.image = UIImage(named: "unselect")
                    }
                }
                self!.imgSalary.image = UIImage(named: "drop")
            }
            
            self.length.anchorView = self.btnLength
            self.imgLength.image = UIImage(named: "plus")
            self.length.dataSource = lengthType
            //self.length.cellConfiguration = { (index, item) in return "\(item)" }
            self.length.cellNib = UINib(nibName: "MyCell", bundle: nil)
            self.length.customCellConfiguration = { (index: _, item: String, cell: DropDownCell) -> Void in
                guard let cell = cell as? MyCell else { return }
                
                // Setup your custom UI components
                cell.logoImageView.image = UIImage(named: "unselect")
            }
            
            length.bottomOffset = CGPoint(x: 0, y:(length.anchorView?.plainView.bounds.height)!)
            length.setupCornerRadius(10.0)
            length.backgroundColor = UIColor.white
            length.textColor = UIColor(hexString: "#717171")
            length.selectionBackgroundColor = UIColor.white
            length.selectedTextColor = UIColor(hexString: "#717171")
            length.layer.borderColor = UIColor(hexString: "#717171").cgColor
            length.layer.borderWidth = 1.0
            length.direction = .bottom
            
            length.show()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        if tableView == tblIndustry{
            cell = tableView.dequeueReusableCell(withIdentifier: "industryCell")!
            let lblTitle : UILabel = cell.contentView.viewWithTag(100) as! UILabel
            lblTitle.text = IndustryValue[indexPath.row]
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
        }else if tableView == tblRole{
            cell = tableView.dequeueReusableCell(withIdentifier: "positionCell")!
            let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
            lblTitle.text = RoleValue[indexPath.row]
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
        }else if tableView == tblSalary{
            cell = tableView.dequeueReusableCell(withIdentifier: "salaryCell")!
            let lblTitle : UILabel = cell.contentView.viewWithTag(102) as! UILabel
            lblTitle.text = salaryValue[indexPath.row]
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "contractCell")!
            let lblTitle : UILabel = cell.contentView.viewWithTag(103) as! UILabel
            lblTitle.text = lengthValue[indexPath.row]
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.preservesSuperviewLayoutMargins = false
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblIndustry {
            return IndustryValue.count
        }else if tableView == tblRole{
            return RoleValue.count
        }else if tableView == tblSalary{
            return salaryValue.count
        }else{
            return lengthValue.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
    
    
    @IBAction func addClicked(_ sender: UIButton) {
        if certFlag == 0 {
            //280
            certFlag = 1
            View1.isHidden = false
            View2.isHidden = true
            View3.isHidden = true
            View4.isHidden = true
            addBtnConstraint.constant = 280.0
        }else if certFlag == 1{
            //535
            certFlag = 2
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = true
            View4.isHidden = true
            addBtnConstraint.constant = 535.0
        }else if certFlag == 2{
            //535
            certFlag = 3
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = true
            addBtnConstraint.constant = 790.0
            //255
        }else if certFlag == 3{
            //535
            certFlag = 4
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            addBtnConstraint.constant = 1045.0
            //255
        }
        else{
                        
            let alert = UIAlertController(title: "Procruited", message: "You can't add more accreditation", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
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
    }
    
    @IBAction func highSchoolClicked(_ sender: UIButton) {
        EduFlag = 2
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "select"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func associateClicked(_ sender: UIButton) {
        EduFlag = 3
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "select"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func tafeClicked(_ sender: UIButton) {
        EduFlag = 4
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "select"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func bachelorClicked(_ sender: UIButton) {
        EduFlag = 5
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "select"), for: .normal)
        btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func masterClicked(_ sender: UIButton) {
        EduFlag = 6
        btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
        btnEdu6.setImage(UIImage(named: "select"), for: .normal)
    }
    
    
    @IBAction func ProfessionYesClicked(_ sender: UIButton) {
        ProFlag = 1
        btnProYes.setImage(UIImage(named: "select"), for: .normal)
        btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
        
    }
    
    @IBAction func ProfessionNoClicked(_ sender: UIButton) {
        ProFlag = 2
        btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnProNo.setImage(UIImage(named: "select"), for: .normal)
    }
    
    @IBAction func Upload1Clicked(_ sender: UIButton) {
        //UIDocumentPickerDelegate
        uploadFlag = 1
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func Upload2Clicked(_ sender: UIButton) {
        uploadFlag = 2
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func Upload3Clicked(_ sender: UIButton) {
        uploadFlag = 3
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func Upload4Clicked(_ sender: UIButton) {
        uploadFlag = 4
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func Upload5Clicked(_ sender: UIButton) {
        uploadFlag = 5
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
        
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
    
    func getCandidateJobSettingAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.candidateJobSetting, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = String.getString(dictResult["status"])
                    if status == "SUCCESS"{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        print(data)
                        self.noteTextView.text = String.getString(data["anything_else_for_job"])
                        
                        let industry1 = String.getString(data["industry"])
                        let industryArr = industry1.components(separatedBy: ",")
                        for i in 0...industryArr.count-1{
                            let valStr = industryArr[i]
                            self.IndustryValue.append(valStr)
                            self.tblIndustry.reloadData()
                            self.tblIndustryConstraint.constant = CGFloat(50*industryArr.count)
                        }
                        
                        let role1 = String.getString(data["position"])
                        let roleArr = role1.components(separatedBy: ",")
                        for i in 0...roleArr.count-1{
                            let valStr = roleArr[i]
                            self.RoleValue.append(valStr)
                            self.tblRole.reloadData()
                            self.tblRoleConstraint.constant = CGFloat(50*roleArr.count)
                        }
                        
                        let salary1 = String.getString(data["salary"])
                        let salaryArr = salary1.components(separatedBy: ",")
                        for i in 0...salaryArr.count-1{
                            let valStr = salaryArr[i]
                            self.salaryValue.append(valStr)
                            self.tblSalary.reloadData()
                            self.tblSalaryConstraint.constant = CGFloat(50*salaryArr.count)
                            
                        }
                        
                       
                        
                        
                        let issuer1 = String.getString(data["first_accreditation_title"])
                        if issuer1 != "" {
                            self.certFlag = 0
                            self.tfPreferTitle.text = String.getString(data["first_accreditation_title"])
                            self.tfPreferIssue.text = String.getString(data["first_accreditation_issuer"])
                            let doc1 = String.getString(data["first_accreditation_document"])
                            let File1 = ("\(doc1)" as NSString).lastPathComponent
                            self.certLbl.text = File1
                            self.addBtnConstraint.constant = 45.0
                            
                            let issuer2 = String.getString(data["second_accreditation_title"])
                            if issuer2 != ""{
                                self.certFlag = 1
                                self.View1.isHidden = false
                                self.tfPreferTitleView1.text = String.getString(data["second_accreditation_title"])
                                self.tfPreferIssueView1.text = String.getString(data["second_accreditation_issuer"])
                                let doc2 = String.getString(data["second_accreditation_document"])
                                let File2 = ("\(doc2)" as NSString).lastPathComponent
                                self.certLblView1.text = File2
                                self.addBtnConstraint.constant = 280.0
                                
                                let issuer3 = String.getString(data["third_accreditation_title"])
                                if issuer3 != ""{
                                    
                                    self.certFlag = 2
                                    self.View2.isHidden = false
                                    self.tfPreferTitleView2.text = String.getString(data["third_accreditation_title"])
                                    self.tfPreferIssueView2.text = String.getString(data["third_accreditation_issuer"])
                                    let doc3 = String.getString(data["third_accreditation_document"])
                                    let File3 = ("\(doc3)" as NSString).lastPathComponent
                                    self.certLblView2.text = File3
                                    self.addBtnConstraint.constant = 535.0
                                    
                                    let issuer4 = String.getString(data["fourth_accreditation_title"])
                                    if issuer4 != ""{
                                        self.certFlag = 3
                                        self.View3.isHidden = false
                                        self.tfPreferTitleView3.text = String.getString(data["fourth_accreditation_title"])
                                        self.tfPreferIssuerView3.text = String.getString(data["fourth_accreditation_issuer"])
                                        let doc4 = String.getString(data["fourth_accreditation_document"])
                                        let File4 = ("\(doc4)" as NSString).lastPathComponent
                                        self.certLblView3.text = File4
                                        self.addBtnConstraint.constant = 790.0
                                        
                                        let issuer5 = String.getString(data["fifth_accreditation_title"])
                                        if issuer5 != ""{
                                            self.certFlag = 4
                                            self.View4.isHidden = false
                                            self.tfPreferTitleView4.text = String.getString(data["fifth_accreditation_title"])
                                            self.tfPreferIssuerView4.text = String.getString(data["fifth_accreditation_issuer"])
                                            let doc5 = String.getString(data["fifth_accreditation_document"])
                                            let File5 = ("\(doc5)" as NSString).lastPathComponent
                                            self.certLblView4.text = File5
                                            self.addBtnConstraint.constant = 1045.0
                                        }else{
                                            self.View4.isHidden = true
                                            self.tfPreferTitleView4.text = ""
                                            self.tfPreferIssuerView4.text = ""
                                            self.certLblView4.text = "Upload Documents"
                                        }
                                    }else{
                                        self.View3.isHidden = true
                                        self.View4.isHidden = true
                                        self.tfPreferTitleView3.text = ""
                                        self.tfPreferIssuerView3.text = ""
                                        self.certLblView3.text = "Upload Documents"
                                    }
                                }else{
                                    self.View2.isHidden = true
                                    self.View3.isHidden = true
                                    self.View4.isHidden = true
                                    self.tfPreferTitleView2.text = ""
                                    self.tfPreferIssueView2.text = ""
                                    self.certLblView2.text = "Upload Documents"
                                }
                                
                            }else{
                                self.View1.isHidden = true
                                self.View2.isHidden = true
                                self.View3.isHidden = true
                                self.View4.isHidden = true
                                self.tfPreferTitleView1.text = ""
                                self.tfPreferIssueView1.text = ""
                                self.certLblView1.text = "Upload Documents"
                            }
                            
                            
                        }else{
                            self.certFlag = 0
                            self.View1.isHidden = true
                            self.View2.isHidden = true
                            self.View3.isHidden = true
                            self.View4.isHidden = true
                            self.tfPreferTitle.text = ""
                            self.tfPreferIssue.text = ""
                            self.certLbl.text = "Upload Documents"
                            self.addBtnConstraint.constant = 45.0
                            
                            
                        }
                        
                        
                        let jobValue = String.getString(data["job_type"])
                        let jobValueArr = jobValue.components(separatedBy: ",")
                        if jobValueArr.contains("1"){
                            self.JobTypeItems.append("1")
                            self.partTime = 1
                            self.btnPartTime.setImage(UIImage(named: "select"), for: .normal)
                            self.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValueArr.contains("2") {
                            self.JobTypeItems.append("2")
                            self.fullTime = 1
                            self.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnFullTime.setImage(UIImage(named: "select"), for: .normal)
                            self.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValueArr.contains("3"){
                            self.JobTypeItems.append("3")
                            self.contract = 1
                            self.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnContract.setImage(UIImage(named: "select"), for: .normal)
                            self.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValueArr.contains("4"){
                            self.JobTypeItems.append("4")
                            self.casual = 1
                            self.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnCasual.setImage(UIImage(named: "select"), for: .normal)
                            self.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if jobValueArr.contains("5") {
                            self.JobTypeItems.append("5")
                            self.temperary = 1
                            self.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnTemporary.setImage(UIImage(named: "select"), for: .normal)
                        }else {
                            self.JobTypeItems.removeAll()
                            self.partTime = 0
                            self.fullTime = 0
                            self.contract = 0
                            self.casual = 0
                            self.temperary = 0
                            self.btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnContract.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        if self.JobTypeItems.contains("3") || self.JobTypeItems.contains("5"){
                            let length1 = String.getString(data["contract_length"])
                            let lengthArr = length1.components(separatedBy: ",")
                            for i in 0...lengthArr.count-1{
                                let valStr = lengthArr[i]
                                self.lengthValue.append(valStr)
                                self.tblLength.reloadData()
                                self.tblLengthConstraint.constant = CGFloat(50*lengthArr.count)
                            }
                        }else{
                            self.lengthValue.removeAll()
                            self.tblLength.reloadData()
                            self.tblLengthConstraint.constant = 0.0
                        }
                        
                        
                        
                        let expValue = Int.getInt(data["have_relevant_experience"])
                        if expValue == 1 {
                            self.expFlag = 1
                            self.btnExpYes.setImage(UIImage(named: "select"), for: .normal)
                            self.btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if expValue == 0 {
                            self.expFlag = 0
                            self.btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnExpNo.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            self.btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let eduValue = Int.getInt(data["educational_level"])
                        if eduValue == 1 {
                            self.EduFlag = 1
                            self.btnEdu1.setImage(UIImage(named: "select"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 2 {
                            self.EduFlag = 2
                            self.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "select"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 3 {
                            self.EduFlag = 3
                            self.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "select"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 4 {
                            self.EduFlag = 4
                            self.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "select"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 5 {
                            self.EduFlag = 5
                            self.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "select"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if eduValue == 6 {
                            self.EduFlag = 6
                            self.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            self.btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                        let proValue = Int.getInt(data["prefer_professional_accreditation"])
                        if proValue == 1 {
                            self.ProFlag = 1
                            self.btnProYes.setImage(UIImage(named: "select"), for: .normal)
                            self.btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if proValue == 0 {
                            self.ProFlag = 0
                            self.btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnProNo.setImage(UIImage(named: "select"), for: .normal)
                        }else{
                            self.btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                            let relocateValue = Int.getInt(data["willing_to_relocate"])
                            if relocateValue == 1{
                                self.relocateFlag = 1
                                self.btnRelocateYes.setImage(UIImage(named: "select"), for: .normal)
                                self.btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
                                self.btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                            }else if relocateValue == 0{
                                self.relocateFlag = 0
                                self.btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
                                self.btnRelocateNo.setImage(UIImage(named: "select"), for: .normal)
                                self.btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                            }else if relocateValue == 2{
                                self.relocateFlag = 2
                                self.btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
                                self.btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
                                self.btnRelocateDicuss.setImage(UIImage(named: "select"), for: .normal)
                            }else{
                                self.btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
                                self.btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
                                self.btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
                            }
                        
                        
                        let workValue = Int.getInt(data["work_model"])
                        if workValue == 1{
                            self.workFlag = 1
                            self.btnInHouse.setImage(UIImage(named: "select"), for: .normal)
                            self.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if workValue == 2{
                            self.workFlag = 2
                            self.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnRemote.setImage(UIImage(named: "select"), for: .normal)
                            self.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if workValue == 3{
                            self.workFlag = 3
                            self.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnHybrid.setImage(UIImage(named: "select"), for: .normal)
                            self.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }else if workValue == 4{
                            self.workFlag = 4
                            self.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnDiscuss.setImage(UIImage(named: "select"), for: .normal)
                        }else {
                            self.btnInHouse.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnRemote.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnHybrid.setImage(UIImage(named: "unselect"), for: .normal)
                            self.btnDiscuss.setImage(UIImage(named: "unselect"), for: .normal)
                        }
                        
                    }
                    else {
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
    
    // MARK:- Register Candidate API
    func UpdateJobInterestAPI() {
        CommonUtils.showHudWithNoInteraction(show: true)
         let deviceid = UserDefaults.standard.value(forKey:"DeviceToken")
        let url: String = kBASEURL + ServiceName.updateJobSetting
             print(url)
         var header = [String: String]()
         if let token = UserDefaults.standard.value(forKey:"token"){
         header = ["Content-Type" : "application/json","Authorization": "Bearer \(token)"]
         } else {
                     header = [:]
                 }
         print(header)
        //have_relevant_experience,educational_level,have_professional_accrediation,willing_to_relocate,work_model,first_accreditation_title,first_accreditation_issuer,first_accreditation_document,second_accreditation_title,second_accreditation_issuer,second_accreditation_document,third_accreditation_title,third_accreditation_issuer,third_accreditation_document,fourth_accreditation_title,fourth_accreditation_issuer,fourth_accreditation_document,fifth_accreditation_title,fifth_accreditation_issuer,fifth_accreditation_document, job_type , industry , position , salary , contract_length,anything_else_for_job
        let params = ["anything_else_for_job":"\(noteTextView.text!)","job_type":"\((JobTypeItems.map{String($0)}).joined(separator: ","))", "industry": "\((IndustryValue.map{String($0)}).joined(separator: ","))", "position": "\((RoleValue.map{String($0)}).joined(separator: ","))", "salary": "\((salaryValue.map{String($0)}).joined(separator: ","))", "contract_length": "\((lengthValue.map{String($0)}).joined(separator: ","))", "have_relevant_experience": "\(expFlag)", "educational_level": "\(EduFlag)", "have_professional_accrediation": "\(ProFlag)", "willing_to_relocate": "\(relocateFlag)", "work_model": "\(workFlag)","first_accreditation_title": "\(tfPreferTitle.text!)", "first_accreditation_issuer": "\(tfPreferIssue.text!)", "second_accreditation_title": "\(tfPreferTitleView1.text!)", "second_accreditation_issuer": "\(tfPreferIssueView1.text!)", "third_accreditation_title": "\(tfPreferTitleView2.text!)", "third_accreditation_issuer": "\(tfPreferIssueView2.text!)", "fourth_accreditation_title": "\(tfPreferTitleView3.text!)", "fourth_accreditation_issuer": "\(tfPreferIssuerView3.text!)", "fifth_accreditation_title": "\(tfPreferTitleView4.text!)", "fifth_accreditation_issuer": "\(tfPreferIssuerView4.text!)"] as [String : String]
         
             print("paramstes \(params)")
        
             Alamofire.upload(
                multipartFormData: { multipartFormData in
                    for (key, value) in params {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                    }
                    
                    if ("\(self.doc1)" as NSString) != ""{
                        let data1 = try! Data(contentsOf: self.doc1 as URL)
                        let theFileName = ("\(self.doc1)" as NSString).lastPathComponent
                        let Mime = self.mimeTypeForPath(path: "\(self.doc1)")
                                multipartFormData.append(data1, withName: "first_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "first_accreditation_document")
                    }
                    
                    if ("\(self.doc2)" as NSString) != ""{
                        let data2 = try! Data(contentsOf: self.doc2 as URL)
                        let theFileName = ("\(self.doc2)" as NSString).lastPathComponent
                        let Mime = self.mimeTypeForPath(path: "\(self.doc2)")
                                multipartFormData.append(data2, withName: "second_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "second_accreditation_document")
                    }
                    
                    if ("\(self.doc3)" as NSString) != ""{
                        let data3 = try! Data(contentsOf: self.doc3 as URL)
                        let theFileName = ("\(self.doc3)" as NSString).lastPathComponent
                        let Mime = self.mimeTypeForPath(path: "\(self.doc3)")
                                multipartFormData.append(data3, withName: "third_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "third_accreditation_document")
                    }
                    
                    if ("\(self.doc4)" as NSString) != ""{
                        let data4 = try! Data(contentsOf: self.doc4 as URL)
                        let theFileName = ("\(self.doc4)" as NSString).lastPathComponent
                        let Mime = self.mimeTypeForPath(path: "\(self.doc4)")
                                multipartFormData.append(data4, withName: "fourth_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "fourth_accreditation_document")
                    }
                    
                    if ("\(self.doc5)" as NSString) != ""{
                        let data5 = try! Data(contentsOf: self.doc5 as URL)
                        let theFileName = ("\(self.doc5)" as NSString).lastPathComponent
                        let Mime = self.mimeTypeForPath(path: "\(self.doc5)")
                                multipartFormData.append(data5, withName: "fifth_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "fifth_accreditation_document")
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
                                    
                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
                                    self.navigationController?.pushViewController(vc!, animated: false)
                                    Toast(text:"\(data["message"].rawValue)", duration: Delay.long).show()
                                    
                                  } else {
                                      //print(response.result.value!)
                                      print(response.result.isFailure)
                                      let data = JSON(response.result.value)
                                      print(data)

                                      Toast(text:"\(data["message"].rawValue)", duration: Delay.long).show()

                                }
                                
                            }
                        case .failure(let error):
                            CommonUtils.showHudWithNoInteraction(show: false)
                            print("Error in upload: \(error.localizedDescription)")
                           
                        }
                    }
         }
    
    
    
    
    // Document Picker delegates Metohds
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        let theFileName = ("\(myURL)" as NSString).lastPathComponent
        if uploadFlag == 0 {
            print("import result : \(myURL)")
        }else if uploadFlag == 1{
            certLbl.text = theFileName
            doc1 = myURL as NSURL
        }else if uploadFlag == 2{
            certLblView1.text = theFileName
            doc2 = myURL as NSURL
        }else if uploadFlag == 3{
            certLblView2.text = theFileName
            doc3 = myURL as NSURL
        }else if uploadFlag == 4{
            certLblView3.text = theFileName
            doc4 = myURL as NSURL
        }else{
            certLblView4.text = theFileName
            doc5 = myURL as NSURL
        }
        
    }
          

    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    func mimeTypeForPath(path: String) -> String {
        let url = NSURL(fileURLWithPath: path)
        let pathExtension = url.pathExtension

        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension! as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
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
                        self.IndustryTypeID.removeAll()
                        self.IndustryListArr = datashow.map{industryListModal(data: $0)}
                        
                        for i in 0...self.IndustryListArr.count-1{
                            let obj = self.IndustryListArr[i]
                            self.IndustryType.append(obj.name!)
                            self.IndustryTypeID.append("\(obj.id!)")
                        }
                        
                        self.Industry.multiSelectionAction = { [weak self] (indices, items) in
                            print("Muti selection action called with: \(items)")
                            if items.isEmpty {
                                self!.IndustryValue.removeAll()
                                self!.industryid.removeAll()
                                self!.tblIndustry.reloadData()
                                self!.tblIndustryConstraint.constant = 0.0
                            }else{
                                print(items)
                                print(indices[0])
                                self!.IndustryValue.removeAll()
                                self!.industryid.removeAll()
                                
                                self!.IndustryValue.append(contentsOf: items)
                                
                                for i in 0...indices.count-1{
                                    let inde = indices[i]
                                    let indValue = self!.IndustryTypeID[inde]
                                    self?.industryid.append("\(indValue)")
                                }
                                
                                self!.tblIndustry.reloadData()
                                self!.tblIndustryConstraint.constant = CGFloat(50*items.count)
                            }
                            self?.Industry.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
                               guard let cell = cell as? MyCell else { return }
                                
                                if indices.contains(index) {
                                    // Setup your custom UI components
                                    cell.logoImageView.image = UIImage(named: "select")
                                }else{
                                    // Setup your custom UI components
                                    cell.logoImageView.image = UIImage(named: "unselect")
                                }
                            }
                            self!.imgIndustry.image = UIImage(named: "drop")
                        }
                        
                        self.Industry.anchorView = self.btnIndustry
                        self.imgIndustry.image = UIImage(named: "plus")
                        self.Industry.dataSource = self.IndustryType
                        //self.Industry.cellConfiguration = { (index, item) in return "\(item)" }
                        self.Industry.cellNib = UINib(nibName: "MyCell", bundle: nil)

                        self.Industry.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
                           guard let cell = cell as? MyCell else { return }

                           // Setup your custom UI components
                           cell.logoImageView.image = UIImage(named: "unselect")
                        }
                        
                        self.Industry.bottomOffset = CGPoint(x: 0, y:(self.Industry.anchorView?.plainView.bounds.height)!)
                        self.Industry.setupCornerRadius(10.0)
                        self.Industry.backgroundColor = UIColor.white
                        self.Industry.selectionBackgroundColor = UIColor.white
                        self.Industry.selectedTextColor = UIColor(hexString: "#717171")
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
        let params:[String:Any] = ["industry_ids":"\((industryid.map{String($0)}).joined(separator: ","))"]
        
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
                        
                        
                        self.Role.multiSelectionAction = { [weak self] (indices, items) in
                            print("Muti selection action called with: \(items)")
                            if items.isEmpty {
                                self!.RoleValue.removeAll()
                                self!.tblRole.reloadData()
                                self!.tblRoleConstraint.constant = 0.0
                            }else{
                                print(items)
                                self!.RoleValue.removeAll()
                                self!.RoleValue.append(contentsOf: items)
                                self!.tblRole.reloadData()
                                self!.tblRoleConstraint.constant = CGFloat(50*items.count)
                            }
                            
                            self?.Role.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
                               guard let cell = cell as? MyCell else { return }
                                
                                if indices.contains(index) {
                                    // Setup your custom UI components
                                    cell.logoImageView.image = UIImage(named: "select")
                                }else{
                                    // Setup your custom UI components
                                    cell.logoImageView.image = UIImage(named: "unselect")
                                }
                            }
                            self!.imgRole.image = UIImage(named: "drop")
                        }
                    
                        self.Role.anchorView = self.btnRole
                        self.imgRole.image = UIImage(named: "plus")
                        self.Role.dataSource = self.RoleType
                        //self.Role.cellConfiguration = { (index, item) in return "\(item)" }
                        self.Role.cellNib = UINib(nibName: "MyCell", bundle: nil)
                        self.Role.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
                           guard let cell = cell as? MyCell else { return }

                           // Setup your custom UI components
                           cell.logoImageView.image = UIImage(named: "unselect")
                        }
                        
                        self.Role.bottomOffset = CGPoint(x: 0, y:(self.Role.anchorView?.plainView.bounds.height)!)
                        self.Role.setupCornerRadius(10.0)
                        self.Role.backgroundColor = UIColor.white
                        self.Role.textColor = UIColor(hexString: "#717171")
                        self.Role.selectionBackgroundColor = UIColor.white
                        self.Role.selectedTextColor = UIColor(hexString: "#717171")
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

