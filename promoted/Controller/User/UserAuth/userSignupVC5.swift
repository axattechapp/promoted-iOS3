//
//  userSignupVC5.swift
//  promoted
//
//  Created by Vikram Sindhu on 23/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toaster
import Foundation
import MobileCoreServices

class userSignupVC5: UIViewController,UITextViewDelegate{
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var btnRelocateYes: UIButton!
    @IBOutlet weak var btnRelocateNo: UIButton!
    @IBOutlet weak var btnRelocateDicuss: UIButton!
    
    @IBOutlet weak var btnInHouse: UIButton!
    @IBOutlet weak var btnRemote: UIButton!
    @IBOutlet weak var btnHybrid: UIButton!
    @IBOutlet weak var btnDiscuss: UIButton!
    
    @IBOutlet weak var noteView: UIView!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    var profile:UIImage?
    var Name: String?
    var lastName: String?
    var email: String?
    var Password: String?
    var Phone: String?
    var Address: String?
    var expArray = [[String: String]]()
    var JobTypeItems = [String]()
    var IndustryValue = [String]()
    var RoleValue = [String]()
    var salaryValue = [String]()
    var lengthValue = [String]()
    var lookingForFlag: Int?
    var expFlag: Int?
    var EduFlag: Int?
    var ProFlag: Int?
    var doc1: NSURL?
    var preferTitle1: String?
    var preferIssuer1: String?
    var doc2: NSURL?
    var preferTitle2: String?
    var preferIssuer2: String?
    var doc3: NSURL?
    var preferTitle3: String?
    var preferIssuer3: String?
    var doc4: NSURL?
    var preferTitle4: String?
    var preferIssuer4: String?
    var doc5: NSURL?
    var preferTitle5: String?
    var preferIssuer5: String?
    
    
    
    var relocateFlag = String()
    var workFlag = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nextBtn.layer.cornerRadius = 10.0
        
        btnRelocateYes.layer.cornerRadius = 10.0
        btnRelocateNo.layer.cornerRadius = 10.0
        btnRelocateDicuss.layer.cornerRadius = 10.0
        
        btnInHouse.layer.cornerRadius = 10.0
        btnRemote.layer.cornerRadius = 10.0
        btnHybrid.layer.cornerRadius = 10.0
        btnDiscuss.layer.cornerRadius = 10.0
        
        noteView.layer.cornerRadius = 10.0
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
        noteTextView.inputAccessoryView = toolBar()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if lookingForFlag == 0 {

                var first_job_role = ""
                var first_company_name = ""
                var first_experience_from_year = ""
                var first_experience_from_month = ""
                var first_experience_to_year = ""
                var first_experience_to_month = ""
                
                if expArray.count >= 1 {
                    let dict = expArray[0] as Dictionary
                    first_job_role = dict["job_role"]! as String
                    first_company_name = dict["company_name"]! as String
                    first_experience_from_year = dict["experience_from_year"]! as String
                    first_experience_from_month = dict["experience_from_month"]! as String
                    first_experience_to_year = dict["experience_to_year"]! as String
                    first_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var second_job_role = ""
                var second_company_name = ""
                var second_experience_from_year = ""
                var second_experience_from_month = ""
                var second_experience_to_year = ""
                var second_experience_to_month = ""
                
                if expArray.count >= 2 {
                    let dict = expArray[1] as Dictionary
                    second_job_role = dict["job_role"]! as String
                    second_company_name = dict["company_name"]! as String
                    second_experience_from_year = dict["experience_from_year"]! as String
                    second_experience_from_month = dict["experience_from_month"]! as String
                    second_experience_to_year = dict["experience_to_year"]! as String
                    second_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var third_job_role = ""
                var third_company_name = ""
                var third_experience_from_year = ""
                var third_experience_from_month = ""
                var third_experience_to_year = ""
                var third_experience_to_month = ""
                
                if expArray.count >= 3 {
                    let dict = expArray[2] as Dictionary
                    third_job_role = dict["job_role"]! as String
                    third_company_name = dict["company_name"]! as String
                    third_experience_from_year = dict["experience_from_year"]! as String
                    third_experience_from_month = dict["experience_from_month"]! as String
                    third_experience_to_year = dict["experience_to_year"]! as String
                    third_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var fourth_job_role = ""
                var fourth_company_name = ""
                var fourth_experience_from_year = ""
                var fourth_experience_from_month = ""
                var fourth_experience_to_year = ""
                var fourth_experience_to_month = ""
                
                if expArray.count >= 4 {
                    let dict = expArray[3] as Dictionary
                    fourth_job_role = dict["job_role"]! as String
                    fourth_company_name = dict["company_name"]! as String
                    fourth_experience_from_year = dict["experience_from_year"]! as String
                    fourth_experience_from_month = dict["experience_from_month"]! as String
                    fourth_experience_to_year = dict["experience_to_year"]! as String
                    fourth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var fifth_job_role = ""
                var fifth_company_name = ""
                var fifth_experience_from_year = ""
                var fifth_experience_from_month = ""
                var fifth_experience_to_year = ""
                var fifth_experience_to_month = ""
                
                if expArray.count >= 5 {
                    let dict = expArray[4] as Dictionary
                    fifth_job_role = dict["job_role"]! as String
                    fifth_company_name = dict["company_name"]! as String
                    fifth_experience_from_year = dict["experience_from_year"]! as String
                    fifth_experience_from_month = dict["experience_from_month"]! as String
                    fifth_experience_to_year = dict["experience_to_year"]! as String
                    fifth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var sixth_job_role = ""
                var sixth_company_name = ""
                var sixth_experience_from_year = ""
                var sixth_experience_from_month = ""
                var sixth_experience_to_year = ""
                var sixth_experience_to_month = ""
                
                if expArray.count >= 6 {
                    let dict = expArray[5] as Dictionary
                    sixth_job_role = dict["job_role"]! as String
                    sixth_company_name = dict["company_name"]! as String
                    sixth_experience_from_year = dict["experience_from_year"]! as String
                    sixth_experience_from_month = dict["experience_from_month"]! as String
                    sixth_experience_to_year = dict["experience_to_year"]! as String
                    sixth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var seventh_job_role = ""
                var seventh_company_name = ""
                var seventh_experience_from_year = ""
                var seventh_experience_from_month = ""
                var seventh_experience_to_year = ""
                var seventh_experience_to_month = ""
                
                if expArray.count >= 7 {
                    let dict = expArray[6] as Dictionary
                    seventh_job_role = dict["job_role"]! as String
                    seventh_company_name = dict["company_name"]! as String
                    seventh_experience_from_year = dict["experience_from_year"]! as String
                    seventh_experience_from_month = dict["experience_from_month"]! as String
                    seventh_experience_to_year = dict["experience_to_year"]! as String
                    seventh_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var eighth_job_role = ""
                var eighth_company_name = ""
                var eighth_experience_from_year = ""
                var eighth_experience_from_month = ""
                var eighth_experience_to_year = ""
                var eighth_experience_to_month = ""
                
                if expArray.count >= 8 {
                    let dict = expArray[7] as Dictionary
                    eighth_job_role = dict["job_role"]! as String
                    eighth_company_name = dict["company_name"]! as String
                    eighth_experience_from_year = dict["experience_from_year"]! as String
                    eighth_experience_from_month = dict["experience_from_month"]! as String
                    eighth_experience_to_year = dict["experience_to_year"]! as String
                    eighth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var ninth_job_role = ""
                var ninth_company_name = ""
                var ninth_experience_from_year = ""
                var ninth_experience_from_month = ""
                var ninth_experience_to_year = ""
                var ninth_experience_to_month = ""
                
                if expArray.count >= 9 {
                    let dict = expArray[8] as Dictionary
                    ninth_job_role = dict["job_role"]! as String
                    ninth_company_name = dict["company_name"]! as String
                    ninth_experience_from_year = dict["experience_from_year"]! as String
                    ninth_experience_from_month = dict["experience_from_month"]! as String
                    ninth_experience_to_year = dict["experience_to_year"]! as String
                    ninth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var tenth_job_role = ""
                var tenth_company_name = ""
                var tenth_experience_from_year = ""
                var tenth_experience_from_month = ""
                var tenth_experience_to_year = ""
                var tenth_experience_to_month = ""
                
                if expArray.count >= 10 {
                    let dict = expArray[9] as Dictionary
                    tenth_job_role = dict["job_role"]! as String
                    tenth_company_name = dict["company_name"]! as String
                    tenth_experience_from_year = dict["experience_from_year"]! as String
                    tenth_experience_from_month = dict["experience_from_month"]! as String
                    tenth_experience_to_year = dict["experience_to_year"]! as String
                    tenth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                
                
                
                
                RegisterCandidateAPI(first_job_role: first_job_role, first_company_name: first_company_name, first_experience_from_year: first_experience_from_year, first_experience_from_month: first_experience_from_month, first_experience_to_year: first_experience_to_year, first_experience_to_month: first_experience_to_month, second_job_role: second_job_role, second_company_name: second_company_name, second_experience_from_year: second_experience_from_year, second_experience_from_month: second_experience_from_month, second_experience_to_year: second_experience_to_year, second_experience_to_month: second_experience_to_month, third_job_role: third_job_role, third_company_name: third_company_name, third_experience_from_year: third_experience_from_year, third_experience_from_month: third_experience_from_month, third_experience_to_year: third_experience_to_year, third_experience_to_month: third_experience_to_month, fourth_job_role: fourth_job_role, fourth_company_name: fourth_company_name, fourth_experience_from_year: fourth_experience_from_year, fourth_experience_from_month: fourth_experience_from_month, fourth_experience_to_year: fourth_experience_to_year, fourth_experience_to_month: fourth_experience_to_month, fifth_job_role: fifth_job_role, fifth_company_name: fifth_company_name, fifth_experience_from_year: fifth_experience_from_year, fifth_experience_from_month: fifth_experience_from_month, fifth_experience_to_year: fifth_experience_to_year, fifth_experience_to_month: fifth_experience_to_month, sixth_job_role: sixth_job_role, sixth_company_name: sixth_company_name, sixth_experience_from_year: sixth_experience_from_year, sixth_experience_from_month: sixth_experience_from_month, sixth_experience_to_year: sixth_experience_to_year, sixth_experience_to_month: sixth_experience_to_month, seventh_job_role: seventh_job_role, seventh_company_name: seventh_company_name, seventh_experience_from_year: seventh_experience_from_year, seventh_experience_from_month: seventh_experience_from_month, seventh_experience_to_year: seventh_experience_to_year, seventh_experience_to_month: seventh_experience_to_month, eighth_job_role: eighth_job_role, eighth_company_name: eighth_company_name, eighth_experience_from_year: eighth_experience_from_year, eighth_experience_from_month: eighth_experience_from_month, eighth_experience_to_year: eighth_experience_to_year, eighth_experience_to_month: eighth_experience_to_month, ninth_job_role: ninth_job_role, ninth_company_name: ninth_company_name, ninth_experience_from_year: ninth_experience_from_year, ninth_experience_from_month: ninth_experience_from_month, ninth_experience_to_year: ninth_experience_to_year, ninth_experience_to_month: ninth_experience_to_month, tenth_job_role: tenth_job_role, tenth_company_name: tenth_company_name, tenth_experience_from_year: tenth_experience_from_year, tenth_experience_from_month: tenth_experience_from_month, tenth_experience_to_year: tenth_experience_to_year, tenth_experience_to_month: tenth_experience_to_month)
            
        }else{
            if relocateFlag == ""{
                self.showSimpleAlert(message: "Please select Relocate options ")
                return
            }
            else if workFlag == 0{
                self.showSimpleAlert(message: "Please select work model ")
                return
            }else{

                var first_job_role = ""
                var first_company_name = ""
                var first_experience_from_year = ""
                var first_experience_from_month = ""
                var first_experience_to_year = ""
                var first_experience_to_month = ""
                
                if expArray.count >= 1 {
                    let dict = expArray[0] as Dictionary
                    first_job_role = dict["job_role"]! as String
                    first_company_name = dict["company_name"]! as String
                    first_experience_from_year = dict["experience_from_year"]! as String
                    first_experience_from_month = dict["experience_from_month"]! as String
                    first_experience_to_year = dict["experience_to_year"]! as String
                    first_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var second_job_role = ""
                var second_company_name = ""
                var second_experience_from_year = ""
                var second_experience_from_month = ""
                var second_experience_to_year = ""
                var second_experience_to_month = ""
                
                if expArray.count >= 2 {
                    let dict = expArray[1] as Dictionary
                    second_job_role = dict["job_role"]! as String
                    second_company_name = dict["company_name"]! as String
                    second_experience_from_year = dict["experience_from_year"]! as String
                    second_experience_from_month = dict["experience_from_month"]! as String
                    second_experience_to_year = dict["experience_to_year"]! as String
                    second_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var third_job_role = ""
                var third_company_name = ""
                var third_experience_from_year = ""
                var third_experience_from_month = ""
                var third_experience_to_year = ""
                var third_experience_to_month = ""
                
                if expArray.count >= 3 {
                    let dict = expArray[2] as Dictionary
                    third_job_role = dict["job_role"]! as String
                    third_company_name = dict["company_name"]! as String
                    third_experience_from_year = dict["experience_from_year"]! as String
                    third_experience_from_month = dict["experience_from_month"]! as String
                    third_experience_to_year = dict["experience_to_year"]! as String
                    third_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var fourth_job_role = ""
                var fourth_company_name = ""
                var fourth_experience_from_year = ""
                var fourth_experience_from_month = ""
                var fourth_experience_to_year = ""
                var fourth_experience_to_month = ""
                
                if expArray.count >= 4 {
                    let dict = expArray[3] as Dictionary
                    fourth_job_role = dict["job_role"]! as String
                    fourth_company_name = dict["company_name"]! as String
                    fourth_experience_from_year = dict["experience_from_year"]! as String
                    fourth_experience_from_month = dict["experience_from_month"]! as String
                    fourth_experience_to_year = dict["experience_to_year"]! as String
                    fourth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var fifth_job_role = ""
                var fifth_company_name = ""
                var fifth_experience_from_year = ""
                var fifth_experience_from_month = ""
                var fifth_experience_to_year = ""
                var fifth_experience_to_month = ""
                
                if expArray.count >= 5 {
                    let dict = expArray[4] as Dictionary
                    fifth_job_role = dict["job_role"]! as String
                    fifth_company_name = dict["company_name"]! as String
                    fifth_experience_from_year = dict["experience_from_year"]! as String
                    fifth_experience_from_month = dict["experience_from_month"]! as String
                    fifth_experience_to_year = dict["experience_to_year"]! as String
                    fifth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var sixth_job_role = ""
                var sixth_company_name = ""
                var sixth_experience_from_year = ""
                var sixth_experience_from_month = ""
                var sixth_experience_to_year = ""
                var sixth_experience_to_month = ""
                
                if expArray.count >= 6 {
                    let dict = expArray[5] as Dictionary
                    sixth_job_role = dict["job_role"]! as String
                    sixth_company_name = dict["company_name"]! as String
                    sixth_experience_from_year = dict["experience_from_year"]! as String
                    sixth_experience_from_month = dict["experience_from_month"]! as String
                    sixth_experience_to_year = dict["experience_to_year"]! as String
                    sixth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var seventh_job_role = ""
                var seventh_company_name = ""
                var seventh_experience_from_year = ""
                var seventh_experience_from_month = ""
                var seventh_experience_to_year = ""
                var seventh_experience_to_month = ""
                
                if expArray.count >= 7 {
                    let dict = expArray[6] as Dictionary
                    seventh_job_role = dict["job_role"]! as String
                    seventh_company_name = dict["company_name"]! as String
                    seventh_experience_from_year = dict["experience_from_year"]! as String
                    seventh_experience_from_month = dict["experience_from_month"]! as String
                    seventh_experience_to_year = dict["experience_to_year"]! as String
                    seventh_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var eighth_job_role = ""
                var eighth_company_name = ""
                var eighth_experience_from_year = ""
                var eighth_experience_from_month = ""
                var eighth_experience_to_year = ""
                var eighth_experience_to_month = ""
                
                if expArray.count >= 8 {
                    let dict = expArray[7] as Dictionary
                    eighth_job_role = dict["job_role"]! as String
                    eighth_company_name = dict["company_name"]! as String
                    eighth_experience_from_year = dict["experience_from_year"]! as String
                    eighth_experience_from_month = dict["experience_from_month"]! as String
                    eighth_experience_to_year = dict["experience_to_year"]! as String
                    eighth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var ninth_job_role = ""
                var ninth_company_name = ""
                var ninth_experience_from_year = ""
                var ninth_experience_from_month = ""
                var ninth_experience_to_year = ""
                var ninth_experience_to_month = ""
                
                if expArray.count >= 9 {
                    let dict = expArray[8] as Dictionary
                    ninth_job_role = dict["job_role"]! as String
                    ninth_company_name = dict["company_name"]! as String
                    ninth_experience_from_year = dict["experience_from_year"]! as String
                    ninth_experience_from_month = dict["experience_from_month"]! as String
                    ninth_experience_to_year = dict["experience_to_year"]! as String
                    ninth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                var tenth_job_role = ""
                var tenth_company_name = ""
                var tenth_experience_from_year = ""
                var tenth_experience_from_month = ""
                var tenth_experience_to_year = ""
                var tenth_experience_to_month = ""
                
                if expArray.count >= 10 {
                    let dict = expArray[9] as Dictionary
                    tenth_job_role = dict["job_role"]! as String
                    tenth_company_name = dict["company_name"]! as String
                    tenth_experience_from_year = dict["experience_from_year"]! as String
                    tenth_experience_from_month = dict["experience_from_month"]! as String
                    tenth_experience_to_year = dict["experience_to_year"]! as String
                    tenth_experience_to_month = dict["experience_to_month"]! as String
                }
                
                
                
                
                
                RegisterCandidateAPI(first_job_role: first_job_role, first_company_name: first_company_name, first_experience_from_year: first_experience_from_year, first_experience_from_month: first_experience_from_month, first_experience_to_year: first_experience_to_year, first_experience_to_month: first_experience_to_month, second_job_role: second_job_role, second_company_name: second_company_name, second_experience_from_year: second_experience_from_year, second_experience_from_month: second_experience_from_month, second_experience_to_year: second_experience_to_year, second_experience_to_month: second_experience_to_month, third_job_role: third_job_role, third_company_name: third_company_name, third_experience_from_year: third_experience_from_year, third_experience_from_month: third_experience_from_month, third_experience_to_year: third_experience_to_year, third_experience_to_month: third_experience_to_month, fourth_job_role: fourth_job_role, fourth_company_name: fourth_company_name, fourth_experience_from_year: fourth_experience_from_year, fourth_experience_from_month: fourth_experience_from_month, fourth_experience_to_year: fourth_experience_to_year, fourth_experience_to_month: fourth_experience_to_month, fifth_job_role: fifth_job_role, fifth_company_name: fifth_company_name, fifth_experience_from_year: fifth_experience_from_year, fifth_experience_from_month: fifth_experience_from_month, fifth_experience_to_year: fifth_experience_to_year, fifth_experience_to_month: fifth_experience_to_month, sixth_job_role: sixth_job_role, sixth_company_name: sixth_company_name, sixth_experience_from_year: sixth_experience_from_year, sixth_experience_from_month: sixth_experience_from_month, sixth_experience_to_year: sixth_experience_to_year, sixth_experience_to_month: sixth_experience_to_month, seventh_job_role: seventh_job_role, seventh_company_name: seventh_company_name, seventh_experience_from_year: seventh_experience_from_year, seventh_experience_from_month: seventh_experience_from_month, seventh_experience_to_year: seventh_experience_to_year, seventh_experience_to_month: seventh_experience_to_month, eighth_job_role: eighth_job_role, eighth_company_name: eighth_company_name, eighth_experience_from_year: eighth_experience_from_year, eighth_experience_from_month: eighth_experience_from_month, eighth_experience_to_year: eighth_experience_to_year, eighth_experience_to_month: eighth_experience_to_month, ninth_job_role: ninth_job_role, ninth_company_name: ninth_company_name, ninth_experience_from_year: ninth_experience_from_year, ninth_experience_from_month: ninth_experience_from_month, ninth_experience_to_year: ninth_experience_to_year, ninth_experience_to_month: ninth_experience_to_month, tenth_job_role: tenth_job_role, tenth_company_name: tenth_company_name, tenth_experience_from_year: tenth_experience_from_year, tenth_experience_from_month: tenth_experience_from_month, tenth_experience_to_year: tenth_experience_to_year, tenth_experience_to_month: tenth_experience_to_month)
            }
        }
        
        
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func relocateYesClicked(_ sender: UIButton) {
        relocateFlag = "1"
        btnRelocateYes.setImage(UIImage(named: "select"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    
    @IBAction func relocateNoClicked(_ sender: UIButton) {
        relocateFlag = "0"
        btnRelocateYes.setImage(UIImage(named: "unselect"), for: .normal)
        btnRelocateNo.setImage(UIImage(named: "select"), for: .normal)
        btnRelocateDicuss.setImage(UIImage(named: "unselect"), for: .normal)
    }
    
    @IBAction func relocateDiscussClicked(_ sender: UIButton) {
        relocateFlag = "2"
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
            }
            return true
        }
    
    
    // MARK:- Register Candidate API
    func RegisterCandidateAPI(first_job_role:String,first_company_name:String,first_experience_from_year:String ,first_experience_from_month:String,first_experience_to_year:String,first_experience_to_month:String,second_job_role:String,second_company_name:String,second_experience_from_year:String,second_experience_from_month:String,second_experience_to_year:String,second_experience_to_month:String,third_job_role:String,third_company_name:String,third_experience_from_year:String,third_experience_from_month:String,third_experience_to_year:String,third_experience_to_month:String,fourth_job_role:String,fourth_company_name:String,fourth_experience_from_year:String,fourth_experience_from_month:String,fourth_experience_to_year:String,fourth_experience_to_month:String,fifth_job_role:String,fifth_company_name:String,fifth_experience_from_year:String,fifth_experience_from_month:String,fifth_experience_to_year:String,fifth_experience_to_month:String,sixth_job_role:String,sixth_company_name:String,sixth_experience_from_year:String,sixth_experience_from_month:String,sixth_experience_to_year:String,sixth_experience_to_month:String,seventh_job_role:String,seventh_company_name:String,seventh_experience_from_year:String,seventh_experience_from_month:String,seventh_experience_to_year:String,seventh_experience_to_month:String,eighth_job_role:String,eighth_company_name:String,eighth_experience_from_year:String,eighth_experience_from_month:String,eighth_experience_to_year:String,eighth_experience_to_month:String,ninth_job_role:String,ninth_company_name:String,ninth_experience_from_year:String,ninth_experience_from_month:String,ninth_experience_to_year:String,ninth_experience_to_month:String,tenth_job_role:String,tenth_company_name:String,tenth_experience_from_year:String,tenth_experience_from_month:String,tenth_experience_to_year:String,tenth_experience_to_month:String) {
        CommonUtils.showHudWithNoInteraction(show: true)
         let deviceid = UserDefaults.standard.value(forKey:"DeviceId")
        let devicetoken = UserDefaults.standard.value(forKey:"DeviceToken")
        let url: String = kBASEURL + ServiceName.CandidateRegister
             print(url)
         var header = [String: String]()
         if let token = UserDefaults.standard.value(forKey:"token"){
         header = ["Content-Type" : "application/json","Authorization": "Bearer \(token)"]
         } else {
                     header = [:]
                 }
         print(header)
        var params = [String:Any]()
        if lookingForFlag == 0 {
            params = ["device_id":"\(deviceid!)","first_name": "\(Name!)","last_name":"\(lastName!)", "email": "\(email!)", "password":"\(Password!)", "phone":"\(Phone!)", "city":"\(Address!)", "not_looking_for_job": "\(lookingForFlag!)", "job_type":"\((JobTypeItems.map{String($0)}).joined(separator: ","))", "industry": "\((IndustryValue.map{String($0)}).joined(separator: ","))", "position": "\((RoleValue.map{String($0)}).joined(separator: ","))", "salary": "\((salaryValue.map{String($0)}).joined(separator: ","))", "contract_length": "\((lengthValue.map{String($0)}).joined(separator: ","))", "have_relevant_experience": "", "educational_level": "", "have_professional_accrediation": "", "willing_to_relocate": "", "work_model": "", "video": "", "portfolio": "", "device_token": "\(devicetoken!)", "device_type": "2", "first_job_role": first_job_role, "first_company_name": first_company_name, "first_experience_from_year": first_experience_from_year, "first_experience_from_month": first_experience_from_month, "first_experience_to_year": first_experience_to_year, "first_experience_to_month": first_experience_to_month, "second_job_role": second_job_role, "second_company_name": second_company_name, "second_experience_from_year": second_experience_from_year, "second_experience_from_month": second_experience_from_month, "second_experience_to_year": second_experience_to_year, "second_experience_to_month": second_experience_to_month, "third_job_role": third_job_role, "third_company_name": third_company_name, "third_experience_from_year": third_experience_from_year, "third_experience_from_month": third_experience_from_month, "third_experience_to_year": third_experience_to_year, "third_experience_to_month": third_experience_to_month, "fourth_job_role": fourth_job_role, "fourth_company_name": fourth_company_name, "fourth_experience_from_year": fourth_experience_from_year, "fourth_experience_from_month": fourth_experience_from_month, "fourth_experience_to_year": fourth_experience_to_year, "fourth_experience_to_month": fourth_experience_to_month, "fifth_job_role": fifth_job_role, "fifth_company_name": fifth_company_name, "fifth_experience_from_year": fifth_experience_from_year, "fifth_experience_from_month": fifth_experience_from_month, "fifth_experience_to_year": fifth_experience_to_year, "fifth_experience_to_month": fifth_experience_to_month, "sixth_job_role": sixth_job_role, "sixth_company_name": sixth_company_name, "sixth_experience_from_year": sixth_experience_from_year, "sixth_experience_from_month": sixth_experience_from_month, "sixth_experience_to_year": sixth_experience_to_year, "sixth_experience_to_month": sixth_experience_to_month, "seventh_job_role": seventh_job_role, "seventh_company_name": seventh_company_name, "seventh_experience_from_year": seventh_experience_from_year, "seventh_experience_from_month": seventh_experience_from_month, "seventh_experience_to_year": seventh_experience_to_year, "seventh_experience_to_month": seventh_experience_to_month, "eighth_job_role": eighth_job_role, "eighth_company_name": eighth_company_name, "eighth_experience_from_year": eighth_experience_from_year, "eighth_experience_from_month": eighth_experience_from_month, "eighth_experience_to_year": eighth_experience_to_year, "eighth_experience_to_month": eighth_experience_to_month, "ninth_job_role": ninth_job_role, "ninth_company_name": ninth_company_name, "ninth_experience_from_year": ninth_experience_from_year, "ninth_experience_from_month": ninth_experience_from_month, "ninth_experience_to_year": ninth_experience_to_year, "ninth_experience_to_month": ninth_experience_to_month, "tenth_job_role": tenth_job_role, "tenth_company_name": tenth_company_name, "tenth_experience_from_year": tenth_experience_from_year, "tenth_experience_from_month": tenth_experience_from_month, "tenth_experience_to_year": tenth_experience_to_year, "tenth_experience_to_month": tenth_experience_to_month, "first_accreditation_title": "", "first_accreditation_issuer": "", "second_accreditation_title": "", "second_accreditation_issuer": "", "third_accreditation_title": "", "third_accreditation_issuer": "", "fourth_accreditation_title": "", "fourth_accreditation_issuer": "", "fifth_accreditation_title": "", "fifth_accreditation_issuer": "","anything_else_for_job":"", "job_title":"","company_name":"", "experience_from_year":"","experience_from_month":"","experience_to_year":"", "experience_to_month":"", "title":"","issuer":"","documents":""] as [String : String]
        }else{
            params = ["device_id":"\(deviceid!)","first_name": "\(Name!)","last_name":"\(lastName!)", "email": "\(email!)", "password":"\(Password!)", "phone":"\(Phone!)", "city":"\(Address!)", "not_looking_for_job": "\(lookingForFlag!)", "job_type":"\((JobTypeItems.map{String($0)}).joined(separator: ","))", "industry": "\((IndustryValue.map{String($0)}).joined(separator: ","))", "position": "\((RoleValue.map{String($0)}).joined(separator: ","))", "salary": "\((salaryValue.map{String($0)}).joined(separator: ","))", "contract_length": "\((lengthValue.map{String($0)}).joined(separator: ","))", "have_relevant_experience": "\(expFlag!)", "educational_level": "\(EduFlag!)", "have_professional_accrediation": "\(ProFlag!)", "willing_to_relocate": "\(relocateFlag)", "work_model": "\(workFlag)", "video": "", "portfolio": "", "device_token": "\(devicetoken!)", "device_type": "2", "first_job_role": first_job_role, "first_company_name": first_company_name, "first_experience_from_year": first_experience_from_year, "first_experience_from_month": first_experience_from_month, "first_experience_to_year": first_experience_to_year, "first_experience_to_month": first_experience_to_month, "second_job_role": second_job_role, "second_company_name": second_company_name, "second_experience_from_year": second_experience_from_year, "second_experience_from_month": second_experience_from_month, "second_experience_to_year": second_experience_to_year, "second_experience_to_month": second_experience_to_month, "third_job_role": third_job_role, "third_company_name": third_company_name, "third_experience_from_year": third_experience_from_year, "third_experience_from_month": third_experience_from_month, "third_experience_to_year": third_experience_to_year, "third_experience_to_month": third_experience_to_month, "fourth_job_role": fourth_job_role, "fourth_company_name": fourth_company_name, "fourth_experience_from_year": fourth_experience_from_year, "fourth_experience_from_month": fourth_experience_from_month, "fourth_experience_to_year": fourth_experience_to_year, "fourth_experience_to_month": fourth_experience_to_month, "fifth_job_role": fifth_job_role, "fifth_company_name": fifth_company_name, "fifth_experience_from_year": fifth_experience_from_year, "fifth_experience_from_month": fifth_experience_from_month, "fifth_experience_to_year": fifth_experience_to_year, "fifth_experience_to_month": fifth_experience_to_month, "sixth_job_role": sixth_job_role, "sixth_company_name": sixth_company_name, "sixth_experience_from_year": sixth_experience_from_year, "sixth_experience_from_month": sixth_experience_from_month, "sixth_experience_to_year": sixth_experience_to_year, "sixth_experience_to_month": sixth_experience_to_month, "seventh_job_role": seventh_job_role, "seventh_company_name": seventh_company_name, "seventh_experience_from_year": seventh_experience_from_year, "seventh_experience_from_month": seventh_experience_from_month, "seventh_experience_to_year": seventh_experience_to_year, "seventh_experience_to_month": seventh_experience_to_month, "eighth_job_role": eighth_job_role, "eighth_company_name": eighth_company_name, "eighth_experience_from_year": eighth_experience_from_year, "eighth_experience_from_month": eighth_experience_from_month, "eighth_experience_to_year": eighth_experience_to_year, "eighth_experience_to_month": eighth_experience_to_month, "ninth_job_role": ninth_job_role, "ninth_company_name": ninth_company_name, "ninth_experience_from_year": ninth_experience_from_year, "ninth_experience_from_month": ninth_experience_from_month, "ninth_experience_to_year": ninth_experience_to_year, "ninth_experience_to_month": ninth_experience_to_month, "tenth_job_role": tenth_job_role, "tenth_company_name": tenth_company_name, "tenth_experience_from_year": tenth_experience_from_year, "tenth_experience_from_month": tenth_experience_from_month, "tenth_experience_to_year": tenth_experience_to_year, "tenth_experience_to_month": tenth_experience_to_month, "first_accreditation_title": "\(preferTitle1!)", "first_accreditation_issuer": "\(preferIssuer1!)", "second_accreditation_title": "\(preferTitle2!)", "second_accreditation_issuer": "\(preferIssuer2!)", "third_accreditation_title": "\(preferTitle3!)", "third_accreditation_issuer": "\(preferIssuer3!)", "fourth_accreditation_title": "\(preferTitle4!)", "fourth_accreditation_issuer": "\(preferIssuer4!)", "fifth_accreditation_title": "\(preferTitle5!)", "fifth_accreditation_issuer": "\(preferIssuer5!)","anything_else_for_job":"\(noteTextView.text!)", "job_title":"","company_name":"", "experience_from_year":"","experience_from_month":"","experience_to_year":"", "experience_to_month":"", "title":"","issuer":"","documents":""]
        }
        
        
         
             print("paramstes \(params)")
        
             Alamofire.upload(
                multipartFormData: { multipartFormData in
                    for (key, value) in params {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                    }
                    
                    guard let imgData = self.profile!.jpegData(compressionQuality: 1) else { return }
                    let currentDateTime = Date()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "ddMMMMyyyyhhmma"
                    let someDateTime = formatter.string(from: currentDateTime)
                    multipartFormData.append(imgData, withName: "profile_image", fileName: "Profile\(someDateTime).jpg", mimeType:"image/jpeg")
                    if self.lookingForFlag == 0 {
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "first_accreditation_document")
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "second_accreditation_document")
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "third_accreditation_document")
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "fourth_accreditation_document")
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "fifth_accreditation_document")
                    }else{
                        if ("\(self.doc1!)" as NSString) != ""{
                            let data1 = try? Data(contentsOf: self.doc1! as URL)
                            let theFileName = ("\(self.doc1!)" as NSString).lastPathComponent
                            let Mime = self.mimeTypeForPath(path: "\(self.doc1!)")
                            multipartFormData.append(data1!, withName: "first_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                        }else{
                            multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "first_accreditation_document")
                        }
                        
                        if ("\(self.doc2!)" as NSString) != ""{
                            let data2 = try! Data(contentsOf: self.doc2! as URL)
                            let theFileName = ("\(self.doc2!)" as NSString).lastPathComponent
                            let Mime = self.mimeTypeForPath(path: "\(self.doc2!)")
                            multipartFormData.append(data2, withName: "second_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                            
                        }else{
                            multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "second_accreditation_document")
                        }
                        
                        if ("\(self.doc3!)" as NSString) != ""{
                            let data3 = try! Data(contentsOf: self.doc3! as URL)
                            let theFileName = ("\(self.doc3!)" as NSString).lastPathComponent
                            let Mime = self.mimeTypeForPath(path: "\(self.doc3!)")
                            multipartFormData.append(data3, withName: "third_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                            
                        }else{
                            multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "third_accreditation_document")
                        }
                        
                        if ("\(self.doc4!)" as NSString) != ""{
                            let data4 = try! Data(contentsOf: self.doc4! as URL)
                            let theFileName = ("\(self.doc4!)" as NSString).lastPathComponent
                            let Mime = self.mimeTypeForPath(path: "\(self.doc4!)")
                            multipartFormData.append(data4, withName: "fourth_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                            
                        }else{
                            multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "fourth_accreditation_document")
                        }
                        
                        if ("\(self.doc5!)" as NSString) != ""{
                            let data5 = try! Data(contentsOf: self.doc5! as URL)
                            let theFileName = ("\(self.doc5!)" as NSString).lastPathComponent
                            let Mime = self.mimeTypeForPath(path: "\(self.doc5!)")
                            multipartFormData.append(data5, withName: "fifth_accreditation_document", fileName: "\(theFileName.replacingOccurrences(of: "%20", with: ""))", mimeType:"\(Mime)")
                            
                        }else{
                            multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "fifth_accreditation_document")
                        }
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
                                    let tokenValue = data["data"]["access_token"].rawValue
                                    
                                    kSharedUserDefaults.setLoggedInAccessToken(loggedInAccessToken: "\(String(describing: tokenValue))")
                                    // self.dismissHUD(isAnimated: true)
                                    
                                    let role = "job_seeker"

                                    UserDefaults.standard.set(role, forKey: "role")
                                    UserDefaults.standard.set("", forKey: "compnayName")
                                    UserDefaults.standard.set(self.email, forKey: "email")
                                    UserDefaults.standard.set(self.Password, forKey: "password")
                                    UserDefaults.standard.setValue(true, forKey: kIsLogin)
                                    UserDefaults.standard.synchronize()
                                                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
                                                self.navigationController?.pushViewController(vc!, animated: false)
                                    
                                  } else {
                                      //print(response.result.value!)
                                      print(response.result.isFailure)
                                      let data = JSON(response.result.value)
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
   
    
}
