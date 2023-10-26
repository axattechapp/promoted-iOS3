//
//  CandidateSearchVC1.swift
//  promoted
//
//  Created by Vikram Sindhu on 12/12/22.
//

import UIKit

class CandidateSearchVC1: UIViewController,UITextFieldDelegate {
    
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
    
    
    @IBOutlet weak var accredationLbl: UILabel!
    
    @IBOutlet weak var issuerLbl: UILabel!
    
    
    @IBOutlet weak var topContraint: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var btnCertYes: UIButton!
    @IBOutlet weak var btnCertNo: UIButton!
    
    @IBOutlet weak var btnDicuss: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    var expFlag = String()
    var EduFlag = Int()
    var ProFlag = String()
    var certFlag = String()
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
    var role_avail: String?
    var industry: String?
    var position: String?
    var salary: String?
    var contractLength: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        nextBtn.layer.cornerRadius = 10.0
        
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
        
        tfPreferTitle.layer.cornerRadius = 10.0
        tfPreferIssue.layer.cornerRadius = 10.0
        
        btnCertYes.layer.cornerRadius = 10.0
        btnCertNo.layer.cornerRadius = 10.0
        btnDicuss.layer.cornerRadius = 10.0
        tfPreferIssue.delegate = self
        tfPreferTitle.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfPreferIssue.placeholder ?? ""
        tfPreferIssue.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfPreferTitle.placeholder ?? ""
        tfPreferTitle.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        
        UserDefaults.standard.set(expFlag, forKey: "ComexpFlag")
        UserDefaults.standard.set(EduFlag, forKey: "comEduFlag")
        UserDefaults.standard.set(ProFlag, forKey: "comProFlag")
        UserDefaults.standard.set(tfPreferTitle.text, forKey: "compreferTitle")
        UserDefaults.standard.set(tfPreferIssue.text, forKey: "compreferIssue")
        UserDefaults.standard.set(certFlag, forKey: "comcertFlag")
        
        expFlag = UserDefaults.standard.value(forKey:"ComexpFlag") as? String ?? ""
        if expFlag == "1" {
            btnExpYes.setImage(UIImage(named: "select"), for: .normal)
            btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
        }else if expFlag == "0"{
            btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnExpNo.setImage(UIImage(named: "select"), for: .normal)
        }else{
            btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
        }
        
        EduFlag = UserDefaults.standard.value(forKey:"comEduFlag") as? Int ?? 0
        
        if EduFlag == 1{
            btnEdu1.setImage(UIImage(named: "select"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 2{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "select"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 3{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "select"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 4{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "select"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 5{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "select"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 6{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "select"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 7{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "select"), for: .normal)
        }else {
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu7.setImage(UIImage(named: "unselect"), for: .normal)
        }
        
        ProFlag = UserDefaults.standard.value(forKey:"comProFlag") as? String ?? ""
        
        if ProFlag == "1" {
            btnProYes.setImage(UIImage(named: "select"), for: .normal)
            btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
            topContraint.constant = 253.0
            tfPreferTitle.isHidden = false
            tfPreferIssue.isHidden = false
            accredationLbl.isHidden = false
            issuerLbl.isHidden = false
        }else if ProFlag == "0"{
            btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnProNo.setImage(UIImage(named: "select"), for: .normal)
            topContraint.constant = 34.0
            tfPreferTitle.isHidden = true
            tfPreferIssue.isHidden = true
            accredationLbl.isHidden = true
            issuerLbl.isHidden = true
        }else{
            btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
            topContraint.constant = 253.0
            tfPreferTitle.isHidden = false
            tfPreferIssue.isHidden = false
            accredationLbl.isHidden = false
            issuerLbl.isHidden = false
        }
        
        certFlag = UserDefaults.standard.value(forKey:"comcertFlag") as? String ?? ""
        
        if certFlag == "1" {
            btnCertYes.setImage(UIImage(named: "select"), for: .normal)
            btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
            btnDicuss.setImage(UIImage(named: "unselect"), for: .normal)
        }else if certFlag == "2" {
            btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
            btnDicuss.setImage(UIImage(named: "select"), for: .normal)
        }else if certFlag == "0"{
            btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnCertNo.setImage(UIImage(named: "select"), for: .normal)
            btnDicuss.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
            btnDicuss.setImage(UIImage(named: "unselect"), for: .normal)
        }
        
        
        tfPreferTitle.text = UserDefaults.standard.value(forKey:"compreferTitle") as? String ?? ""
        tfPreferIssue.text = UserDefaults.standard.value(forKey:"compreferIssue") as? String ?? ""
        
        
    }
    
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if expFlag == "" {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer previous experience?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if EduFlag == nil {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Education", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if ProFlag == "" {
            
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer professional accreditation?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if ProFlag == "1" && tfPreferTitle.text == "" {
                let alert = UIAlertController(title: "Procruited", message: "Please Enter Preferred title", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if tfPreferIssue.text == "" && ProFlag == "1" {
                let alert = UIAlertController(title: "Procruited", message: "Please Enter Preferred issuer", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        else if certFlag == "" {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Your Prefer uploaded certificate?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            UserDefaults.standard.set(expFlag, forKey: "ComexpFlag")
            UserDefaults.standard.set(EduFlag, forKey: "comEduFlag")
            UserDefaults.standard.set(ProFlag, forKey: "comProFlag")
            UserDefaults.standard.set(tfPreferTitle.text, forKey: "compreferTitle")
            UserDefaults.standard.set(tfPreferIssue.text, forKey: "compreferIssue")
            UserDefaults.standard.set(certFlag, forKey: "comcertFlag")
            
            UserDefaults.standard.synchronize()
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateSearchVC2") as? CandidateSearchVC2
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
            vc?.role_avail = role_avail
            vc?.industry = industry
            vc?.position = position
            vc?.salary = salary
            vc?.contractLength = contractLength
            vc?.preferExperince = "\(expFlag)"
            vc?.preferEducation = "\(EduFlag)"
            vc?.preferAccreditation = "\(ProFlag)"
            vc?.preferTitle = tfPreferTitle.text
            vc?.preferIssuer = tfPreferIssue.text
            vc?.PreferCertificate = "\(certFlag)"
            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }
    
    @IBAction func expYesClicked(_ sender: UIButton) {
        expFlag = "1"
        btnExpYes.setImage(UIImage(named: "select"), for: .normal)
        btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func expNoClicked(_ sender: UIButton) {
        expFlag = "0"
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
        ProFlag = "1"
        btnProYes.setImage(UIImage(named: "select"), for: .normal)
        btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
        topContraint.constant = 253.0
        tfPreferTitle.isHidden = false
        tfPreferIssue.isHidden = false
        accredationLbl.isHidden = false
        issuerLbl.isHidden = false
        
    }
    
    @IBAction func ProfessionNoClicked(_ sender: UIButton) {
        ProFlag = "0"
        btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnProNo.setImage(UIImage(named: "select"), for: .normal)
        topContraint.constant = 34.0
        tfPreferTitle.isHidden = true
        tfPreferIssue.isHidden = true
        accredationLbl.isHidden = true
        issuerLbl.isHidden = true
    }
    
    
    @IBAction func certYesClicked(_ sender: UIButton) {
        certFlag = "1"
        btnCertYes.setImage(UIImage(named: "select"), for: .normal)
        btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func certNoClicked(_ sender: UIButton) {
        certFlag = "0"
        btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnCertNo.setImage(UIImage(named: "select"), for: .normal)
        btnDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func dicussionClicked(_ sender: UIButton) {
        certFlag = "2"
        btnCertYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnCertNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnDicuss.setImage(UIImage(named: "select"), for: .normal)

    }
}
