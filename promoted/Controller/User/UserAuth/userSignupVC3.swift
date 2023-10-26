//
//  userSignupVC3.swift
//  promoted
//
//  Created by Vikram Sindhu on 22/12/22.
//

import UIKit
import DropDown
import Alamofire
import MBProgressHUD
import Toaster

class userSignupVC3: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblVideo: UILabel!
    
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
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var profile:UIImage?
    var Name: String?
    var lastName: String?
    var email: String?
    var Password: String?
    var Phone: String?
    var Address: String?
    var expArray = [[String: String]]()
    
    var JobTypeItems = [String]()
    
    var partTime = Int()
    var fullTime = Int()
    var contract = Int()
    var casual = Int()
    var temperary = Int()
    var videoFlag = Int()
    
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
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
//        IndustryValue.removeAll()
//        RoleValue.removeAll()
//        salaryValue.removeAll()
//        lengthValue.removeAll()
        
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
        
        Customise()
        
    }
    
    
    func Customise()
    {
        videoFlag = UserDefaults.standard.value(forKey:"videoFlag") as? Int ?? 1
        
        if videoFlag == 0 {
            imgVideo.image = UIImage(named: "yes")
            lblVideo.text = "Yes"
        }else{
            imgVideo.image = UIImage(named: "no")
            lblVideo.text = "No"
        }
        
        JobTypeItems = UserDefaults.standard.stringArray(forKey: "JobTypeItems") ?? [String]()
        
        if JobTypeItems.count != 0 {
            if JobTypeItems.contains("1"){
                partTime = 1
                btnPartTime.setImage(UIImage(named: "select"), for: .normal)
            }else{
                //unselect
                partTime = 0
                btnPartTime.setImage(UIImage(named: "unselect"), for: .normal)
            }
            
            if JobTypeItems.contains("2") {
                fullTime = 1
                btnFullTime.setImage(UIImage(named: "select"), for: .normal)
            }else{
                fullTime = 0
                btnFullTime.setImage(UIImage(named: "unselect"), for: .normal)
            }
            
            if JobTypeItems.contains("3") {
                contract = 1
                btnContract.setImage(UIImage(named: "select"), for: .normal)
            }else{
                contract = 0
                btnContract.setImage(UIImage(named: "unselect"), for: .normal)
            }
            
            if JobTypeItems.contains("4") {
                casual = 1
                btnCasual.setImage(UIImage(named: "select"), for: .normal)
            }else{
                casual = 0
                btnCasual.setImage(UIImage(named: "unselect"), for: .normal)
            }
            
            if JobTypeItems.contains("5") {
                temperary = 1
                btnTemporary.setImage(UIImage(named: "select"), for: .normal)
            }else{
                temperary = 0
                btnTemporary.setImage(UIImage(named: "unselect"), for: .normal)
            }
        }
        
        IndustryValue = UserDefaults.standard.stringArray(forKey: "IndustryValue") ?? [String]()
        self.tblIndustry.reloadData()
        self.tblIndustryConstraint.constant = CGFloat(50*IndustryValue.count)
        
        industryid = UserDefaults.standard.stringArray(forKey: "industryid") ?? [String]()
        
        
        RoleValue = UserDefaults.standard.stringArray(forKey: "RoleValue")  ?? [String]()
        self.tblRole.reloadData()
        self.tblRoleConstraint.constant = CGFloat(50*RoleValue.count)
        
        salaryValue = UserDefaults.standard.stringArray(forKey: "salaryValue")  ?? [String]()
        self.tblSalary.reloadData()
        self.tblSalaryConstraint.constant = CGFloat(50*salaryValue.count)
        
        
        lengthValue = UserDefaults.standard.stringArray(forKey: "lengthValue")  ?? [String]()
        self.tblLength.reloadData()
        self.tblLengthConstraint.constant = CGFloat(50*lengthValue.count)
        
        
        nextBtn.layer.cornerRadius = 10.0
        industryView.layer.cornerRadius = 10.0
        roleView.layer.cornerRadius = 10.0
        salaryView.layer.cornerRadius = 10.0
        lengthView.layer.cornerRadius = 10.0
        
        imgVideo.image = UIImage(named: "yes")
        lblVideo.text = "Yes"
        
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
        salaryType = ["$10000 - $20000","$20000 - $30000","$30000 - $40000","$40000 - $50000","$50000 - $60000","$60000 - $70000","$70000 - $80000","$80000 - $90000","$90000 - $100000","$100000 - $150000","$150000 - $200000","$200000 - $300000","$300,000 and Above"]
        lengthType = ["1 Month","2 Months","3 Months","4 Months","5 Months","6 Months","7 Months","8 Months","9 Months","10 Months","11 Months","12 Months","12 Months+"]
        
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
        
        if videoFlag == 0 {
            JobTypeItems.removeAll()
            IndustryValue.removeAll()
            RoleValue.removeAll()
            salaryValue.removeAll()
            lengthValue.removeAll()
            
            UserDefaults.standard.set(videoFlag, forKey: "videoFlag")
            UserDefaults.standard.set(nil, forKey: "JobTypeItems")
            UserDefaults.standard.set(nil, forKey: "IndustryValue")
            UserDefaults.standard.set(nil, forKey: "industryid")
            UserDefaults.standard.set(nil, forKey: "RoleValue")
            UserDefaults.standard.set(nil, forKey: "salaryValue")
            UserDefaults.standard.set(nil, forKey: "lengthValue")
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignup4") as? userSignup4
            vc?.profile = profile
            vc?.Name = Name
            vc?.lastName = lastName
            vc?.email = email
            vc?.Password = Password
            vc?.Phone = Phone
            vc?.Address = Address
            vc?.expArray = expArray
            vc?.lookingForFlag = videoFlag
            vc?.JobTypeItems = JobTypeItems
            vc?.IndustryValue = IndustryValue
            vc?.RoleValue = RoleValue
            vc?.salaryValue = salaryValue
            vc?.lengthValue = lengthValue
            self.navigationController?.pushViewController(vc!, animated: false)
            
        }else{
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
            else{
                
                UserDefaults.standard.set(videoFlag, forKey: "videoFlag")
                UserDefaults.standard.set(JobTypeItems, forKey: "JobTypeItems")
                UserDefaults.standard.set(IndustryValue, forKey: "IndustryValue")
                UserDefaults.standard.set(industryid, forKey: "industryid")
                UserDefaults.standard.set(RoleValue, forKey: "RoleValue")
                UserDefaults.standard.set(salaryValue, forKey: "salaryValue")
                UserDefaults.standard.set(lengthValue, forKey: "lengthValue")
                
                UserDefaults.standard.synchronize()
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignup4") as? userSignup4
                vc?.profile = profile
                vc?.Name = Name
                vc?.lastName = lastName
                vc?.email = email
                vc?.Password = Password
                vc?.Phone = Phone
                vc?.Address = Address
                vc?.expArray = expArray
                vc?.lookingForFlag = videoFlag
                vc?.JobTypeItems = JobTypeItems
                vc?.IndustryValue = IndustryValue
                vc?.RoleValue = RoleValue
                vc?.salaryValue = salaryValue
                vc?.lengthValue = lengthValue
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        }
        
       
    }
    
    @IBAction func videoToggleClicked(_ sender: UIButton) {
        if videoFlag == 0 {
            imgVideo.image = UIImage(named: "yes")
            lblVideo.text = "Yes"
            videoFlag = 1
        }else{
            imgVideo.image = UIImage(named: "no")
            lblVideo.text = "No"
            videoFlag = 0
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
            
            self?.salary.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
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
        self.salary.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
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
                
                self?.length.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
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
            self.length.customCellConfiguration = { (index: Indexe, item: String, cell: DropDownCell) -> Void in
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
