//
//  userSignup4.swift
//  promoted
//
//  Created by Vikram Sindhu on 22/12/22.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers


class userSignup4: UIViewController, UITextFieldDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate{
    
    
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var addBtnConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
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
    
    @IBOutlet weak var View3:UIView!
    @IBOutlet weak var tfPreferTitleView3: UITextField!
    @IBOutlet weak var tfPreferIssueView3: UITextField!
    @IBOutlet weak var View3certView:UIView!
    @IBOutlet weak var certLblView3:UILabel!
    
    @IBOutlet weak var View4:UIView!
    @IBOutlet weak var tfPreferTitleView4: UITextField!
    @IBOutlet weak var tfPreferIssueView4: UITextField!
    @IBOutlet weak var View4certView:UIView!
    @IBOutlet weak var certLblView4:UILabel!
    
    @IBOutlet weak var View5:UIView!
    @IBOutlet weak var tfPreferTitleView5: UITextField!
    @IBOutlet weak var tfPreferIssueView5: UITextField!
    @IBOutlet weak var View5certView:UIView!
    @IBOutlet weak var certLblView5:UILabel!
    
    var profile:UIImage?
    var Name: String?
    var lastName: String?
    var email: String?
    var Password: String?
    var Phone: String?
    var Address: String?
    var lookingForFlag: Int?
    var expArray = [[String: String]]()
    var JobTypeItems = [String]()
    var IndustryValue = [String]()
    var RoleValue = [String]()
    var salaryValue = [String]()
    var lengthValue = [String]()
    
    var expFlag = String()
    var EduFlag = Int()
    var ProFlag = String()
    
    var certFlag = Int()
    var uploadFlag = Int()
    
    var doc1 = NSURL()
    var doc2 = NSURL()
    var doc3 = NSURL()
    var doc4 = NSURL()
    var doc5 = NSURL()
    
    
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
        View1.isHidden = true
        View2.isHidden = true
        View3.isHidden = true
        View4.isHidden = true
        View5.isHidden = true
        addBtnConstraint.constant = 45.0
        
        nextBtn.layer.cornerRadius = 10.0
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
        
        View5certView.layer.cornerRadius = 10.0
        View5certView.layer.borderWidth = 1.0
        View5certView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        tfPreferIssueView1.delegate = self
        tfPreferTitleView1.delegate = self
        tfPreferIssueView2.delegate = self
        tfPreferTitleView2.delegate = self
        tfPreferIssueView3.delegate = self
        tfPreferTitleView3.delegate = self
        tfPreferIssueView4.delegate = self
        tfPreferTitleView4.delegate = self
        tfPreferIssueView5.delegate = self
        tfPreferTitleView5.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfPreferIssueView1.placeholder ?? ""
        tfPreferIssueView1.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfPreferTitleView1.placeholder ?? ""
        tfPreferTitleView1.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfPreferIssueView2.placeholder ?? ""
        tfPreferIssueView2.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tfPreferTitleView2.placeholder ?? ""
        tfPreferTitleView2.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder5 = tfPreferIssueView3.placeholder ?? ""
        tfPreferIssueView3.attributedPlaceholder = NSAttributedString(string: placeholder5, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder6 = tfPreferTitleView3.placeholder ?? ""
        tfPreferTitleView3.attributedPlaceholder = NSAttributedString(string: placeholder6, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder7 = tfPreferIssueView4.placeholder ?? ""
        tfPreferIssueView4.attributedPlaceholder = NSAttributedString(string: placeholder7, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder8 = tfPreferTitleView4.placeholder ?? ""
        tfPreferTitleView4.attributedPlaceholder = NSAttributedString(string: placeholder8, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder9 = tfPreferIssueView5.placeholder ?? ""
        tfPreferIssueView5.attributedPlaceholder = NSAttributedString(string: placeholder9, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder10 = tfPreferTitleView5.placeholder ?? ""
        tfPreferTitleView5.attributedPlaceholder = NSAttributedString(string: placeholder10, attributes: [NSAttributedString.Key.foregroundColor : color])
        
        expFlag = UserDefaults.standard.value(forKey:"expFlag") as? String ?? ""
        
        if expFlag == "0" {
            btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnExpNo.setImage(UIImage(named: "select"), for: .normal)
        }else if expFlag == "1"{
            btnExpYes.setImage(UIImage(named: "select"), for: .normal)
            btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            btnExpYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnExpNo.setImage(UIImage(named: "unselect"), for: .normal)
        }
            
        EduFlag = UserDefaults.standard.value(forKey:"EduFlag") as? Int ?? 0
        if EduFlag == 1 {
            btnEdu1.setImage(UIImage(named: "select"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 2 {
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "select"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 3 {
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "select"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 4 {
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "select"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 5 {
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "select"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        }else if EduFlag == 6 {
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "select"), for: .normal)
        }else{
            btnEdu1.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu2.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu3.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu4.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu5.setImage(UIImage(named: "unselect"), for: .normal)
            btnEdu6.setImage(UIImage(named: "unselect"), for: .normal)
        }
        ProFlag = UserDefaults.standard.value(forKey:"ProFlag") as? String ?? ""
        if ProFlag == "0"{
            btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnProNo.setImage(UIImage(named: "select"), for: .normal)
        }else if ProFlag == "1"{
            btnProYes.setImage(UIImage(named: "select"), for: .normal)
            btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
        }else{
            btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
            btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
        }
        //certFlag = 0
        certFlag = UserDefaults.standard.value(forKey:"certFlag") as? Int ?? 0
        if certFlag == 0 {
            View1.isHidden = true
            View2.isHidden = true
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 45.0
        }
        else if certFlag == 1 {
            //280
            View1.isHidden = false
            View2.isHidden = true
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 280.0
            
            let preferTitle1 = UserDefaults.standard.value(forKey:"preferTitle1")
            tfPreferTitleView1.text = preferTitle1 as? String
            let preferIssuer1 = UserDefaults.standard.value(forKey:"preferIssuer1")
            tfPreferIssueView1.text = preferIssuer1 as? String
            let doct1 = UserDefaults.standard.value(forKey:"doc1") as? String
            certLblView1.text = ("\(String(describing: doct1))" as NSString).lastPathComponent
            doc1 = URL(string: doct1 ?? "" )! as NSURL
        }else if certFlag == 2{
            //535
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 535.0
            
            let preferTitle1 = UserDefaults.standard.value(forKey:"preferTitle1")
            tfPreferTitleView1.text = preferTitle1 as? String
            let preferIssuer1 = UserDefaults.standard.value(forKey:"preferIssuer1")
            tfPreferIssueView1.text = preferIssuer1 as? String
            let doct1 = UserDefaults.standard.value(forKey:"doc1") as? String
            certLblView1.text = ("\(String(describing: doct1))" as NSString).lastPathComponent
            doc1 = URL(string: doct1 ?? "")! as NSURL
            
            let preferTitle2 = UserDefaults.standard.value(forKey:"preferTitle2")
            tfPreferTitleView2.text = preferTitle2 as? String
            let preferIssuer2 = UserDefaults.standard.value(forKey:"preferIssuer2")
            tfPreferIssueView2.text = preferIssuer2 as? String
            let doct2 = UserDefaults.standard.value(forKey:"doc2") as? String
            certLblView2.text = ("\(String(describing: doct2))" as NSString).lastPathComponent
            doc2 = URL(string: doct2 ?? "")! as NSURL
            //255
        }else if certFlag == 3{
            //535
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 790.0
            
            let preferTitle1 = UserDefaults.standard.value(forKey:"preferTitle1")
            tfPreferTitleView1.text = preferTitle1 as? String
            let preferIssuer1 = UserDefaults.standard.value(forKey:"preferIssuer1")
            tfPreferIssueView1.text = preferIssuer1 as? String
            let doct1 = UserDefaults.standard.value(forKey:"doc1") as? String
            certLblView1.text = ("\(String(describing: doct1))" as NSString).lastPathComponent
            doc1 = URL(string: doct1 ?? "")! as NSURL
            
            let preferTitle2 = UserDefaults.standard.value(forKey:"preferTitle2")
            tfPreferTitleView2.text = preferTitle2 as? String
            let preferIssuer2 = UserDefaults.standard.value(forKey:"preferIssuer2")
            tfPreferIssueView2.text = preferIssuer2 as? String
            let doct2 = UserDefaults.standard.value(forKey:"doc2") as? String
            certLblView2.text = ("\(String(describing: doct2))" as NSString).lastPathComponent
            doc2 = URL(string: doct2 ?? "")! as NSURL
            
            let preferTitle3 = UserDefaults.standard.value(forKey:"preferTitle3")
            tfPreferTitleView3.text = preferTitle3 as? String
            let preferIssuer3 = UserDefaults.standard.value(forKey:"preferIssuer3")
            tfPreferIssueView3.text = preferIssuer3 as? String
            let doct3 = UserDefaults.standard.value(forKey:"doc3") as? String
            certLblView3.text = ("\(doct3 ?? "")" as NSString).lastPathComponent
            doc3 = URL(string: doct3 ?? "")! as NSURL
            //255
        }else if certFlag == 4{
            //535
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = true
            addBtnConstraint.constant = 1045.0
            
            let preferTitle1 = UserDefaults.standard.value(forKey:"preferTitle1")
            tfPreferTitleView1.text = preferTitle1 as? String
            let preferIssuer1 = UserDefaults.standard.value(forKey:"preferIssuer1")
            tfPreferIssueView1.text = preferIssuer1 as? String
            let doct1 = UserDefaults.standard.value(forKey:"doc1") as? String
            certLblView1.text = ("\(doct1 ?? "")" as NSString).lastPathComponent
            doc1 = URL(string: doct1 ?? "")! as NSURL
            
            let preferTitle2 = UserDefaults.standard.value(forKey:"preferTitle2")
            tfPreferTitleView2.text = preferTitle2 as? String
            let preferIssuer2 = UserDefaults.standard.value(forKey:"preferIssuer2")
            tfPreferIssueView2.text = preferIssuer2 as? String
            let doct2 = UserDefaults.standard.value(forKey:"doc2") as? String
            certLblView2.text = ("\(doct2 ?? "")" as NSString).lastPathComponent
            doc2 = URL(string: doct2 ?? "")! as NSURL
            
            let preferTitle3 = UserDefaults.standard.value(forKey:"preferTitle3")
            tfPreferTitleView3.text = preferTitle3 as? String
            let preferIssuer3 = UserDefaults.standard.value(forKey:"preferIssuer3")
            tfPreferIssueView3.text = preferIssuer3 as? String
            let doct3 = UserDefaults.standard.value(forKey:"doc3") as? String
            certLblView3.text = ("\(doct3 ?? "")" as NSString).lastPathComponent
            doc3 = URL(string: doct3 ?? "")! as NSURL
            
            let preferTitle4 = UserDefaults.standard.value(forKey:"preferTitle4")
            tfPreferTitleView4.text = preferTitle4 as? String
            let preferIssuer4 = UserDefaults.standard.value(forKey:"preferIssuer4")
            tfPreferIssueView4.text = preferIssuer4 as? String
            let doct4 = UserDefaults.standard.value(forKey:"doc4") as? String
            certLblView4.text = ("\(doct4 ?? "")" as NSString).lastPathComponent
            doc4 = URL(string: doct4 ?? "")! as NSURL
            //255
        }
        else if certFlag == 5{
            //535
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            addBtnConstraint.constant = 1300.0
            
            let preferTitle1 = UserDefaults.standard.value(forKey:"preferTitle1")
            tfPreferTitleView1.text = preferTitle1 as? String
            let preferIssuer1 = UserDefaults.standard.value(forKey:"preferIssuer1")
            tfPreferIssueView1.text = preferIssuer1 as? String
            let doct1 = UserDefaults.standard.value(forKey:"doc1") as? String
            certLblView1.text = ("\(doct1 ?? "")" as NSString).lastPathComponent
            doc1 = URL(string: doct1 ?? "")! as NSURL
            
            let preferTitle2 = UserDefaults.standard.value(forKey:"preferTitle2")
            tfPreferTitleView2.text = preferTitle2 as? String
            let preferIssuer2 = UserDefaults.standard.value(forKey:"preferIssuer2")
            tfPreferIssueView2.text = preferIssuer2 as? String
            let doct2 = UserDefaults.standard.value(forKey:"doc2") as? String
            certLblView2.text = ("\(doct2 ?? "")" as NSString).lastPathComponent
            doc2 = URL(string: doct2 ?? "")! as NSURL
            
            let preferTitle3 = UserDefaults.standard.value(forKey:"preferTitle3")
            tfPreferTitleView3.text = preferTitle3 as? String
            let preferIssuer3 = UserDefaults.standard.value(forKey:"preferIssuer3")
            tfPreferIssueView3.text = preferIssuer3 as? String
            let doct3 = UserDefaults.standard.value(forKey:"doc3") as? String
            certLblView3.text = ("\(doct3 ?? "")" as NSString).lastPathComponent
            doc3 = URL(string: doct3 ?? "")! as NSURL
            
            let preferTitle4 = UserDefaults.standard.value(forKey:"preferTitle4")
            tfPreferTitleView4.text = preferTitle4 as? String
            let preferIssuer4 = UserDefaults.standard.value(forKey:"preferIssuer4")
            tfPreferIssueView4.text = preferIssuer4 as? String
            let doct4 = UserDefaults.standard.value(forKey:"doc4") as? String
            certLblView4.text = ("\(doct4 ?? "")" as NSString).lastPathComponent
            doc4 = URL(string: doct4 ?? "")! as NSURL
            
            let preferTitle5 = UserDefaults.standard.value(forKey:"preferTitle5")
            tfPreferTitleView5.text = preferTitle5 as? String
            let preferIssuer5 = UserDefaults.standard.value(forKey:"preferIssuer5")
            tfPreferIssueView5.text = preferIssuer5 as? String
            let doct5 = UserDefaults.standard.value(forKey:"doc5") as? String
            certLblView5.text = ("\(doct5 ?? "")" as NSString).lastPathComponent
            doc5 = URL(string: doct5 ?? "")! as NSURL
            //255
        }
        else{
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            addBtnConstraint.constant = 1300.0
            
            let preferTitle1 = UserDefaults.standard.value(forKey:"preferTitle1")
            tfPreferTitleView1.text = preferTitle1 as? String
            let preferIssuer1 = UserDefaults.standard.value(forKey:"preferIssuer1")
            tfPreferIssueView1.text = preferIssuer1 as? String
            let doct1 = UserDefaults.standard.value(forKey:"doc1") as? String
            certLblView1.text = ("\(doct1 ?? "")" as NSString).lastPathComponent
            doc1 = URL(string: doct1 ?? "")! as NSURL
            
            let preferTitle2 = UserDefaults.standard.value(forKey:"preferTitle2")
            tfPreferTitleView2.text = preferTitle2 as? String
            let preferIssuer2 = UserDefaults.standard.value(forKey:"preferIssuer2")
            tfPreferIssueView2.text = preferIssuer2 as? String
            let doct2 = UserDefaults.standard.value(forKey:"doc2") as? String
            certLblView2.text = ("\(doct2 ?? "")" as NSString).lastPathComponent
            doc2 = URL(string: doct2 ?? "")! as NSURL
            
            let preferTitle3 = UserDefaults.standard.value(forKey:"preferTitle3")
            tfPreferTitleView3.text = preferTitle3 as? String
            let preferIssuer3 = UserDefaults.standard.value(forKey:"preferIssuer3")
            tfPreferIssueView3.text = preferIssuer3 as? String
            let doct3 = UserDefaults.standard.value(forKey:"doc3") as? String
            certLblView3.text = ("\(doct3 ?? "")" as NSString).lastPathComponent
            doc3 = URL(string: doct3 ?? "")! as NSURL
            
            let preferTitle4 = UserDefaults.standard.value(forKey:"preferTitle4")
            tfPreferTitleView4.text = preferTitle4 as? String
            let preferIssuer4 = UserDefaults.standard.value(forKey:"preferIssuer4")
            tfPreferIssueView4.text = preferIssuer4 as? String
            let doct4 = UserDefaults.standard.value(forKey:"doc4") as? String
            certLblView4.text = ("\(doct4 ?? "")" as NSString).lastPathComponent
            doc4 = URL(string: doct4 ?? "")! as NSURL
            
            let preferTitle5 = UserDefaults.standard.value(forKey:"preferTitle5")
            tfPreferTitleView5.text = preferTitle5 as? String
            let preferIssuer5 = UserDefaults.standard.value(forKey:"preferIssuer5")
            tfPreferIssueView5.text = preferIssuer5 as? String
            let doct5 = UserDefaults.standard.value(forKey:"doc5") as? String
            certLblView5.text = ("\(doct5 ?? "")" as NSString).lastPathComponent
            doc5 = URL(string: doct5 ?? "")! as NSURL
        }
        
        
        
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if lookingForFlag == 0 {
            
            UserDefaults.standard.set(nil, forKey: "expFlag")
            UserDefaults.standard.set(nil, forKey: "EduFlag")
            UserDefaults.standard.set(nil, forKey: "ProFlag")
            UserDefaults.standard.set(nil, forKey: "certFlag")
            UserDefaults.standard.set(nil, forKey: "doc1")
            UserDefaults.standard.set(nil, forKey: "preferTitle1")
            UserDefaults.standard.set(nil, forKey: "preferIssuer1")
            UserDefaults.standard.set(nil, forKey: "doc2")
            UserDefaults.standard.set(nil, forKey: "preferTitle2")
            UserDefaults.standard.set(nil, forKey: "preferIssuer2")
            UserDefaults.standard.set(nil, forKey: "doc3")
            UserDefaults.standard.set(nil, forKey: "preferTitle3")
            UserDefaults.standard.set(nil, forKey: "preferIssuer3")
            UserDefaults.standard.set(nil, forKey: "doc4")
            UserDefaults.standard.set(nil, forKey: "preferTitle4")
            UserDefaults.standard.set(nil, forKey: "preferIssuer4")
            UserDefaults.standard.set(nil, forKey: "doc5")
            UserDefaults.standard.set(nil, forKey: "preferTitle5")
            UserDefaults.standard.set(nil, forKey: "preferIssuer5")
            UserDefaults.standard.synchronize()
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignupVC5") as? userSignupVC5
            vc?.profile = profile
            vc?.Name = Name
            vc?.lastName = lastName
            vc?.email = email
            vc?.Password = Password
            vc?.Phone = Phone
            vc?.Address = Address
            vc?.expArray = expArray
            vc?.lookingForFlag = lookingForFlag
            vc?.JobTypeItems = JobTypeItems
            vc?.IndustryValue = IndustryValue
            vc?.RoleValue = RoleValue
            vc?.salaryValue = salaryValue
            vc?.lengthValue = lengthValue
            vc?.expFlag = Int(expFlag)
            vc?.EduFlag = EduFlag
            vc?.ProFlag = Int(ProFlag)
            vc?.doc1 = doc1
            vc?.preferTitle1 = tfPreferTitleView1.text
            vc?.preferIssuer1 = tfPreferIssueView1.text
            vc?.doc2 = doc2
            vc?.preferTitle2 = tfPreferTitleView2.text
            vc?.preferIssuer2 = tfPreferIssueView2.text
            vc?.doc3 = doc3
            vc?.preferTitle3 = tfPreferTitleView3.text
            vc?.preferIssuer3 = tfPreferIssueView3.text
            vc?.doc4 = doc4
            vc?.preferTitle4 = tfPreferTitleView4.text
            vc?.preferIssuer4 = tfPreferIssueView4.text
            vc?.doc5 = doc5
            vc?.preferTitle5 = tfPreferTitleView5.text
            vc?.preferIssuer5 = tfPreferIssueView5.text
            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            if expFlag == ""{
                self.showSimpleAlert(message: "Please select relevant Experince options ")
                return
            }
            else if EduFlag == 0{
                self.showSimpleAlert(message: "Please select Your Educational Level ")
                return
            }
            else if ProFlag == ""{
                self.showSimpleAlert(message: "Please select professional accreditation options ")
                return
            }
            else if ProFlag == "1" && doc1 == nil || ProFlag == "1" && tfPreferTitleView1.text == "" || ProFlag == "1" && tfPreferIssueView1.text == ""{
                self.showSimpleAlert(message: "Please add atleast one accreditation detail")
                return
            }else{
                
                UserDefaults.standard.set(expFlag, forKey: "expFlag")
                UserDefaults.standard.set(EduFlag, forKey: "EduFlag")
                UserDefaults.standard.set(ProFlag, forKey: "ProFlag")
                UserDefaults.standard.set(certFlag, forKey: "certFlag")
                UserDefaults.standard.set("\(doc1)", forKey: "doc1")
                UserDefaults.standard.set(tfPreferTitleView1.text, forKey: "preferTitle1")
                UserDefaults.standard.set(tfPreferIssueView1.text, forKey: "preferIssuer1")
                UserDefaults.standard.set("\(doc2)", forKey: "doc2")
                UserDefaults.standard.set(tfPreferTitleView2.text, forKey: "preferTitle2")
                UserDefaults.standard.set(tfPreferIssueView2.text, forKey: "preferIssuer2")
                UserDefaults.standard.set("\(doc3)", forKey: "doc3")
                UserDefaults.standard.set(tfPreferTitleView3.text, forKey: "preferTitle3")
                UserDefaults.standard.set(tfPreferIssueView3.text, forKey: "preferIssuer3")
                UserDefaults.standard.set("\(doc4)", forKey: "doc4")
                UserDefaults.standard.set(tfPreferTitleView4.text, forKey: "preferTitle4")
                UserDefaults.standard.set(tfPreferIssueView4.text, forKey: "preferIssuer4")
                UserDefaults.standard.set("\(doc5)", forKey: "doc5")
                UserDefaults.standard.set(tfPreferTitleView5.text, forKey: "preferTitle5")
                UserDefaults.standard.set(tfPreferIssueView5.text, forKey: "preferIssuer5")
                
                UserDefaults.standard.synchronize()
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignupVC5") as? userSignupVC5
                vc?.profile = profile
                vc?.Name = Name
                vc?.lastName = lastName
                vc?.email = email
                vc?.Password = Password
                vc?.Phone = Phone
                vc?.Address = Address
                vc?.expArray = expArray
                vc?.lookingForFlag = lookingForFlag
                vc?.JobTypeItems = JobTypeItems
                vc?.IndustryValue = IndustryValue
                vc?.RoleValue = RoleValue
                vc?.salaryValue = salaryValue
                vc?.lengthValue = lengthValue
                vc?.expFlag = Int(expFlag)
                vc?.EduFlag = EduFlag
                vc?.ProFlag = Int(ProFlag)
                vc?.doc1 = doc1
                vc?.preferTitle1 = tfPreferTitleView1.text
                vc?.preferIssuer1 = tfPreferIssueView1.text
                vc?.doc2 = doc2
                vc?.preferTitle2 = tfPreferTitleView2.text
                vc?.preferIssuer2 = tfPreferIssueView2.text
                vc?.doc3 = doc3
                vc?.preferTitle3 = tfPreferTitleView3.text
                vc?.preferIssuer3 = tfPreferIssueView3.text
                vc?.doc4 = doc4
                vc?.preferTitle4 = tfPreferTitleView4.text
                vc?.preferIssuer4 = tfPreferIssueView4.text
                vc?.doc5 = doc5
                vc?.preferTitle5 = tfPreferTitleView5.text
                vc?.preferIssuer5 = tfPreferIssueView5.text
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        }
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
        if certFlag == 0 {
            certFlag = 1
            View1.isHidden = false
            View2.isHidden = true
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 280.0
        }
        else if certFlag == 1 {
            //280
            certFlag = 2
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 535.0
        }else if certFlag == 2{
            //535
            certFlag = 3
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = true
            View5.isHidden = true
            addBtnConstraint.constant = 790.0
            //255
        }else if certFlag == 3{
            //535
            certFlag = 4
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = true
            addBtnConstraint.constant = 1045.0
            //255
        }else if certFlag == 4{
            //535
            certFlag = 5
            View1.isHidden = false
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            addBtnConstraint.constant = 1300.0
            //255
        }
//        else if certFlag == 5{
//            //535
//            certFlag = 6
//            View1.isHidden = false
//            View2.isHidden = false
//            View3.isHidden = false
//            View4.isHidden = false
//            View5.isHidden = false
//            addBtnConstraint.constant = 1300.0
//            //255
//        }
        else{
            let alert = UIAlertController(title: "Procruited", message: "You can't add more accreditation", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
        ProFlag = "1"
        certFlag = 0
        btnProYes.setImage(UIImage(named: "select"), for: .normal)
        btnProNo.setImage(UIImage(named: "unselect"), for: .normal)
        
    }
    
    @IBAction func ProfessionNoClicked(_ sender: UIButton) {
        ProFlag = "0"
        certFlag = 0
        btnProYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnProNo.setImage(UIImage(named: "select"), for: .normal)
    }
    
    @IBAction func Upload2Clicked(_ sender: UIButton) {
        uploadFlag = 1
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
    }
    
    @IBAction func Upload3Clicked(_ sender: UIButton) {
        uploadFlag = 2
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
    }
    
    @IBAction func Upload4Clicked(_ sender: UIButton) {
        uploadFlag = 3
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
    }
    
    @IBAction func Upload5Clicked(_ sender: UIButton) {
        uploadFlag = 4
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
    }
    
    @IBAction func Upload6Clicked(_ sender: UIButton) {
        uploadFlag = 5
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF),"com.microsoft.word.doc","org.openxmlformats.wordprocessingml.document",String(kUTTypePNG),String(kUTTypeJPEG)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
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
            certLblView1.text = theFileName
            doc1 = myURL as NSURL
        }else if uploadFlag == 2{
            certLblView2.text = theFileName
            doc2 = myURL as NSURL
        }else if uploadFlag == 3{
            certLblView3.text = theFileName
            doc3 = myURL as NSURL
        }else if uploadFlag == 4{
            certLblView4.text = theFileName
            doc4 = myURL as NSURL
        }else{
            certLblView5.text = theFileName
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
    
    
    
}
