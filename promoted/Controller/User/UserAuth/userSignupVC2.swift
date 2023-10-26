//
//  userSignupVC2.swift
//  promoted
//
//  Created by Vikram Sindhu on 21/12/22.
//

import UIKit
import DropDown

class userSignupVC2: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var AddMoreBtn: UIButton!
    
    @IBOutlet weak var addMoreHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var View1: UIView!
    
    @IBOutlet weak var tfJob: UITextField!
    @IBOutlet weak var tfCompany: UITextField!
    
    @IBOutlet weak var fromMonthView: UIView!
    @IBOutlet weak var lblFromMonth: UILabel!
    @IBOutlet weak var imgFromMonth: UIImageView!
    
    @IBOutlet weak var fromYearView: UIView!
    @IBOutlet weak var lblFromYear: UILabel!
    @IBOutlet weak var imgFromYear: UIImageView!
    
    @IBOutlet weak var toMonthView: UIView!
    @IBOutlet weak var lblToMonth: UILabel!
    @IBOutlet weak var imgToMonth: UIImageView!
    
    @IBOutlet weak var toYearView: UIView!
    @IBOutlet weak var lblToYear: UILabel!
    @IBOutlet weak var imgToYear: UIImageView!
    
    
    @IBOutlet weak var View2: UIView!
    
    @IBOutlet weak var tfJob2: UITextField!
    @IBOutlet weak var tfCompany2: UITextField!
    
    @IBOutlet weak var fromMonth2View: UIView!
    @IBOutlet weak var lblFromMonth2: UILabel!
    @IBOutlet weak var imgFromMonth2: UIImageView!
    
    @IBOutlet weak var fromYear2View: UIView!
    @IBOutlet weak var lblFromYear2: UILabel!
    @IBOutlet weak var imgFromYear2: UIImageView!
    
    @IBOutlet weak var toMonth2View: UIView!
    @IBOutlet weak var lblToMonth2: UILabel!
    @IBOutlet weak var imgToMonth2: UIImageView!
    
    @IBOutlet weak var toYear2View: UIView!
    @IBOutlet weak var lblToYear2: UILabel!
    @IBOutlet weak var imgToYear2: UIImageView!
    
    
    @IBOutlet weak var View3: UIView!
    
    @IBOutlet weak var tfJob3: UITextField!
    @IBOutlet weak var tfCompany3: UITextField!
    
    @IBOutlet weak var fromMonth3View: UIView!
    @IBOutlet weak var lblFromMonth3: UILabel!
    @IBOutlet weak var imgFromMonth3: UIImageView!
    
    @IBOutlet weak var fromYear3View: UIView!
    @IBOutlet weak var lblFromYear3: UILabel!
    @IBOutlet weak var imgFromYear3: UIImageView!
    
    @IBOutlet weak var toMonth3View: UIView!
    @IBOutlet weak var lblToMonth3: UILabel!
    @IBOutlet weak var imgToMonth3: UIImageView!
    
    @IBOutlet weak var toYear3View: UIView!
    @IBOutlet weak var lblToYear3: UILabel!
    @IBOutlet weak var imgToYear3: UIImageView!
    
    
    @IBOutlet weak var View4: UIView!
    
    @IBOutlet weak var tfJob4: UITextField!
    @IBOutlet weak var tfCompany4: UITextField!
    
    @IBOutlet weak var fromMonth4View: UIView!
    @IBOutlet weak var lblFromMonth4: UILabel!
    @IBOutlet weak var imgFromMonth4: UIImageView!
    
    @IBOutlet weak var fromYear4View: UIView!
    @IBOutlet weak var lblFromYear4: UILabel!
    @IBOutlet weak var imgFromYear4: UIImageView!
    
    @IBOutlet weak var toMonth4View: UIView!
    @IBOutlet weak var lblToMonth4: UILabel!
    @IBOutlet weak var imgToMonth4: UIImageView!
    
    @IBOutlet weak var toYear4View: UIView!
    @IBOutlet weak var lblToYear4: UILabel!
    @IBOutlet weak var imgToYear4: UIImageView!
    
    
    @IBOutlet weak var View5: UIView!
    
    @IBOutlet weak var tfJob5: UITextField!
    @IBOutlet weak var tfCompany5: UITextField!
    
    @IBOutlet weak var fromMonth5View: UIView!
    @IBOutlet weak var lblFromMonth5: UILabel!
    @IBOutlet weak var imgFromMonth5: UIImageView!
    
    @IBOutlet weak var fromYear5View: UIView!
    @IBOutlet weak var lblFromYear5: UILabel!
    @IBOutlet weak var imgFromYear5: UIImageView!
    
    @IBOutlet weak var toMonth5View: UIView!
    @IBOutlet weak var lblToMonth5: UILabel!
    @IBOutlet weak var imgToMonth5: UIImageView!
    
    @IBOutlet weak var toYear5View: UIView!
    @IBOutlet weak var lblToYear5: UILabel!
    @IBOutlet weak var imgToYear5: UIImageView!
    
    
    @IBOutlet weak var View6: UIView!
    
    @IBOutlet weak var tfJob6: UITextField!
    @IBOutlet weak var tfCompany6: UITextField!
    
    @IBOutlet weak var fromMonth6View: UIView!
    @IBOutlet weak var lblFromMonth6: UILabel!
    @IBOutlet weak var imgFromMonth6: UIImageView!
    
    @IBOutlet weak var fromYear6View: UIView!
    @IBOutlet weak var lblFromYear6: UILabel!
    @IBOutlet weak var imgFromYear6: UIImageView!
    
    @IBOutlet weak var toMonth6View: UIView!
    @IBOutlet weak var lblToMonth6: UILabel!
    @IBOutlet weak var imgToMonth6: UIImageView!
    
    @IBOutlet weak var toYear6View: UIView!
    @IBOutlet weak var lblToYear6: UILabel!
    @IBOutlet weak var imgToYear6: UIImageView!
    
    
    @IBOutlet weak var View7: UIView!
    
    @IBOutlet weak var tfJob7: UITextField!
    @IBOutlet weak var tfCompany7: UITextField!
    
    @IBOutlet weak var fromMonth7View: UIView!
    @IBOutlet weak var lblFromMonth7: UILabel!
    @IBOutlet weak var imgFromMonth7: UIImageView!
    
    @IBOutlet weak var fromYear7View: UIView!
    @IBOutlet weak var lblFromYear7: UILabel!
    @IBOutlet weak var imgFromYear7: UIImageView!
    
    @IBOutlet weak var toMonth7View: UIView!
    @IBOutlet weak var lblToMonth7: UILabel!
    @IBOutlet weak var imgToMonth7: UIImageView!
    
    @IBOutlet weak var toYear7View: UIView!
    @IBOutlet weak var lblToYear7: UILabel!
    @IBOutlet weak var imgToYear7: UIImageView!
    
    
    @IBOutlet weak var View8: UIView!
    
    @IBOutlet weak var tfJob8: UITextField!
    @IBOutlet weak var tfCompany8: UITextField!
    
    @IBOutlet weak var fromMonth8View: UIView!
    @IBOutlet weak var lblFromMonth8: UILabel!
    @IBOutlet weak var imgFromMonth8: UIImageView!
    
    @IBOutlet weak var fromYear8View: UIView!
    @IBOutlet weak var lblFromYear8: UILabel!
    @IBOutlet weak var imgFromYear8: UIImageView!
    
    @IBOutlet weak var toMonth8View: UIView!
    @IBOutlet weak var lblToMonth8: UILabel!
    @IBOutlet weak var imgToMonth8: UIImageView!
    
    @IBOutlet weak var toYear8View: UIView!
    @IBOutlet weak var lblToYear8: UILabel!
    @IBOutlet weak var imgToYear8: UIImageView!
    
    
    @IBOutlet weak var View9: UIView!
    
    @IBOutlet weak var tfJob9: UITextField!
    @IBOutlet weak var tfCompany9: UITextField!
    
    @IBOutlet weak var fromMonth9View: UIView!
    @IBOutlet weak var lblFromMonth9: UILabel!
    @IBOutlet weak var imgFromMonth9: UIImageView!
    
    @IBOutlet weak var fromYear9View: UIView!
    @IBOutlet weak var lblFromYear9: UILabel!
    @IBOutlet weak var imgFromYear9: UIImageView!
    
    @IBOutlet weak var toMonth9View: UIView!
    @IBOutlet weak var lblToMonth9: UILabel!
    @IBOutlet weak var imgToMonth9: UIImageView!
    
    @IBOutlet weak var toYear9View: UIView!
    @IBOutlet weak var lblToYear9: UILabel!
    @IBOutlet weak var imgToYear9: UIImageView!
    
    
    @IBOutlet weak var View10: UIView!
    
    @IBOutlet weak var tfJob10: UITextField!
    @IBOutlet weak var tfCompany10: UITextField!
    
    @IBOutlet weak var fromMonth10View: UIView!
    @IBOutlet weak var lblFromMonth10: UILabel!
    @IBOutlet weak var imgFromMonth10: UIImageView!
    
    @IBOutlet weak var fromYear10View: UIView!
    @IBOutlet weak var lblFromYear10: UILabel!
    @IBOutlet weak var imgFromYear10: UIImageView!
    
    @IBOutlet weak var toMonth10View: UIView!
    @IBOutlet weak var lblToMonth10: UILabel!
    @IBOutlet weak var imgToMonth10: UIImageView!
    
    @IBOutlet weak var toYear10View: UIView!
    @IBOutlet weak var lblToYear10: UILabel!
    @IBOutlet weak var imgToYear10: UIImageView!
    
    
    var profile:UIImage?
    var Name: String?
    var lastName: String?
    var email: String?
    var Password: String?
    var Phone: String?
    var Address: String?
    
    var expArray = [[String: String]]()
    
    let FromMonth = DropDown()
    var FromMonthType = [String]()
    var FromMonthValue = String()
    
    let FromYear = DropDown()
    var FromYearType = [String]()
    var FromYearValue = String()
    
    let ToMonth = DropDown()
    var ToMonthType = [String]()
    var ToMonthValue = String()
    
    let ToYear = DropDown()
    var ToYearType = [String]()
    var ToYearValue = String()
    
    let FromMonth2 = DropDown()
    var FromMonth2Type = [String]()
    var FromMonth2Value = String()
    
    let FromYear2 = DropDown()
    var FromYear2Type = [String]()
    var FromYear2Value = String()
    
    let ToMonth2 = DropDown()
    var ToMonth2Type = [String]()
    var ToMonth2Value = String()
    
    let ToYear2 = DropDown()
    var ToYear2Type = [String]()
    var ToYear2Value = String()
    
    
    let FromMonth3 = DropDown()
    var FromMonth3Type = [String]()
    var FromMonth3Value = String()
    
    let FromYear3 = DropDown()
    var FromYear3Type = [String]()
    var FromYear3Value = String()
    
    let ToMonth3 = DropDown()
    var ToMonth3Type = [String]()
    var ToMonth3Value = String()
    
    let ToYear3 = DropDown()
    var ToYear3Type = [String]()
    var ToYear3Value = String()
    
    
    let FromMonth4 = DropDown()
    var FromMonth4Type = [String]()
    var FromMonth4Value = String()
    
    let FromYear4 = DropDown()
    var FromYear4Type = [String]()
    var FromYear4Value = String()
    
    let ToMonth4 = DropDown()
    var ToMonth4Type = [String]()
    var ToMonth4Value = String()
    
    let ToYear4 = DropDown()
    var ToYear4Type = [String]()
    var ToYear4Value = String()
    
    
    let FromMonth5 = DropDown()
    var FromMonth5Type = [String]()
    var FromMonth5Value = String()
    
    let FromYear5 = DropDown()
    var FromYear5Type = [String]()
    var FromYear5Value = String()
    
    let ToMonth5 = DropDown()
    var ToMonth5Type = [String]()
    var ToMonth5Value = String()
    
    let ToYear5 = DropDown()
    var ToYear5Type = [String]()
    var ToYear5Value = String()
    
    let FromMonth6 = DropDown()
    var FromMonth6Type = [String]()
    var FromMonth6Value = String()
    
    let FromYear6 = DropDown()
    var FromYear6Type = [String]()
    var FromYear6Value = String()
    
    let ToMonth6 = DropDown()
    var ToMonth6Type = [String]()
    var ToMonth6Value = String()
    
    let ToYear6 = DropDown()
    var ToYear6Type = [String]()
    var ToYear6Value = String()
    
    
    let FromMonth7 = DropDown()
    var FromMonth7Type = [String]()
    var FromMonth7Value = String()
    
    let FromYear7 = DropDown()
    var FromYear7Type = [String]()
    var FromYear7Value = String()
    
    let ToMonth7 = DropDown()
    var ToMonth7Type = [String]()
    var ToMonth7Value = String()
    
    let ToYear7 = DropDown()
    var ToYear7Type = [String]()
    var ToYear7Value = String()
    
    
    let FromMonth8 = DropDown()
    var FromMonth8Type = [String]()
    var FromMonth8Value = String()
    
    let FromYear8 = DropDown()
    var FromYear8Type = [String]()
    var FromYear8Value = String()
    
    let ToMonth8 = DropDown()
    var ToMonth8Type = [String]()
    var ToMonth8Value = String()
    
    let ToYear8 = DropDown()
    var ToYear8Type = [String]()
    var ToYear8Value = String()
    
    
    let FromMonth9 = DropDown()
    var FromMonth9Type = [String]()
    var FromMonth9Value = String()
    
    let FromYear9 = DropDown()
    var FromYear9Type = [String]()
    var FromYear9Value = String()
    
    let ToMonth9 = DropDown()
    var ToMonth9Type = [String]()
    var ToMonth9Value = String()
    
    let ToYear9 = DropDown()
    var ToYear9Type = [String]()
    var ToYear9Value = String()
    
    
    let FromMonth10 = DropDown()
    var FromMonth10Type = [String]()
    var FromMonth10Value = String()
    
    let FromYear10 = DropDown()
    var FromYear10Type = [String]()
    var FromYear10Value = String()
    
    let ToMonth10 = DropDown()
    var ToMonth10Type = [String]()
    var ToMonth10Value = String()
    
    let ToYear10 = DropDown()
    var ToYear10Type = [String]()
    var ToYear10Value = String()
    
    var expFlag = Int()
    
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
        //candidateExpArray
        expArray = UserDefaults.standard.array(forKey: "candidateExpArray")  as? [[String: String]] ?? [[String: String]]()
        
        if expArray.count == 0 {
            expFlag = 0
            addMoreHeight.constant = 20.0
            View2.isHidden = true
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }
        else if expArray.count == 1 {
            expFlag = 1
            addMoreHeight.constant = 346.0
            View2.isHidden = false
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
            
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
        }else if expArray.count == 2 {
            expFlag = 2
            addMoreHeight.constant = 672.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = true
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
            
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            
        }else if expArray.count == 3 {
            expFlag = 3
            addMoreHeight.constant = 998.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
            
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
        }else if expArray.count == 4 {
            expFlag = 4
            addMoreHeight.constant = 1324.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
            
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
        }else if expArray.count == 5 {
            expFlag = 5
            addMoreHeight.constant = 1650.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
            
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
            
            let dict5 = expArray[4] as Dictionary
            tfJob5.text = dict5["job_role"]! as String
            tfCompany5.text = dict5["company_name"]! as String
            FromYear5Value = dict5["experience_from_year"]! as String
            self.lblFromYear5.text = "\(FromYear5Value)"
            FromMonth5Value = dict5["experience_from_month"]! as String
            self.lblFromMonth5.text = "From - \(FromMonth5Value)"
            ToYear5Value = dict5["experience_to_year"]! as String
            self.lblToYear5.text = "\(ToYear5Value)"
            ToMonth5Value = dict5["experience_to_month"]! as String
            self.lblToMonth5.text = "To - \(ToMonth5Value)"
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
        }else if expArray.count == 6 {
            expFlag = 6
            addMoreHeight.constant = 1976.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
            
            let dict5 = expArray[4] as Dictionary
            tfJob5.text = dict5["job_role"]! as String
            tfCompany5.text = dict5["company_name"]! as String
            FromYear5Value = dict5["experience_from_year"]! as String
            self.lblFromYear5.text = "\(FromYear5Value)"
            FromMonth5Value = dict5["experience_from_month"]! as String
            self.lblFromMonth5.text = "From - \(FromMonth5Value)"
            ToYear5Value = dict5["experience_to_year"]! as String
            self.lblToYear5.text = "\(ToYear5Value)"
            ToMonth5Value = dict5["experience_to_month"]! as String
            self.lblToMonth5.text = "To - \(ToMonth5Value)"
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
            
            let dict6 = expArray[5] as Dictionary
            tfJob6.text = dict6["job_role"]! as String
            tfCompany6.text = dict6["company_name"]! as String
            FromYear6Value = dict6["experience_from_year"]! as String
            self.lblFromYear6.text = "\(FromYear6Value)"
            FromMonth6Value = dict6["experience_from_month"]! as String
            self.lblFromMonth6.text = "From - \(FromMonth6Value)"
            ToYear6Value = dict6["experience_to_year"]! as String
            self.lblToYear6.text = "\(ToYear6Value)"
            ToMonth6Value = dict6["experience_to_month"]! as String
            self.lblToMonth6.text = "To - \(ToMonth6Value)"
            if self.ToMonth6Value == "Present" {
                self.toYear6View.isHidden = true
            }else{
                self.toYear6View.isHidden = false
            }
        }else if expArray.count == 7 {
            expFlag = 7
            addMoreHeight.constant = 2302.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = true
            View10.isHidden = true
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
            
            let dict5 = expArray[4] as Dictionary
            tfJob5.text = dict5["job_role"]! as String
            tfCompany5.text = dict5["company_name"]! as String
            FromYear5Value = dict5["experience_from_year"]! as String
            self.lblFromYear5.text = "\(FromYear5Value)"
            FromMonth5Value = dict5["experience_from_month"]! as String
            self.lblFromMonth5.text = "From - \(FromMonth5Value)"
            ToYear5Value = dict5["experience_to_year"]! as String
            self.lblToYear5.text = "\(ToYear5Value)"
            ToMonth5Value = dict5["experience_to_month"]! as String
            self.lblToMonth5.text = "To - \(ToMonth5Value)"
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
            
            let dict6 = expArray[5] as Dictionary
            tfJob6.text = dict6["job_role"]! as String
            tfCompany6.text = dict6["company_name"]! as String
            FromYear6Value = dict6["experience_from_year"]! as String
            self.lblFromYear6.text = "\(FromYear6Value)"
            FromMonth6Value = dict6["experience_from_month"]! as String
            self.lblFromMonth6.text = "From - \(FromMonth6Value)"
            ToYear6Value = dict6["experience_to_year"]! as String
            self.lblToYear6.text = "\(ToYear6Value)"
            ToMonth6Value = dict6["experience_to_month"]! as String
            self.lblToMonth6.text = "To - \(ToMonth6Value)"
            if self.ToMonth6Value == "Present" {
                self.toYear6View.isHidden = true
            }else{
                self.toYear6View.isHidden = false
            }
            
            let dict7 = expArray[6] as Dictionary
            tfJob7.text = dict7["job_role"]! as String
            tfCompany7.text = dict7["company_name"]! as String
            FromYear7Value = dict7["experience_from_year"]! as String
            self.lblFromYear7.text = "\(FromYear7Value)"
            FromMonth7Value = dict7["experience_from_month"]! as String
            self.lblFromMonth7.text = "From - \(FromMonth7Value)"
            ToYear7Value = dict7["experience_to_year"]! as String
            self.lblToYear7.text = "\(ToYear7Value)"
            ToMonth7Value = dict7["experience_to_month"]! as String
            self.lblToMonth7.text = "To - \(ToMonth7Value)"
            if self.ToMonth7Value == "Present" {
                self.toYear7View.isHidden = true
            }else{
                self.toYear7View.isHidden = false
            }
        }else if expArray.count == 8 {
            expFlag = 8
            addMoreHeight.constant = 2628.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = false
            View10.isHidden = true
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
            
            let dict5 = expArray[4] as Dictionary
            tfJob5.text = dict5["job_role"]! as String
            tfCompany5.text = dict5["company_name"]! as String
            FromYear5Value = dict5["experience_from_year"]! as String
            self.lblFromYear5.text = "\(FromYear5Value)"
            FromMonth5Value = dict5["experience_from_month"]! as String
            self.lblFromMonth5.text = "From - \(FromMonth5Value)"
            ToYear5Value = dict5["experience_to_year"]! as String
            self.lblToYear5.text = "\(ToYear5Value)"
            ToMonth5Value = dict5["experience_to_month"]! as String
            self.lblToMonth5.text = "To - \(ToMonth5Value)"
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
            
            let dict6 = expArray[5] as Dictionary
            tfJob6.text = dict6["job_role"]! as String
            tfCompany6.text = dict6["company_name"]! as String
            FromYear6Value = dict6["experience_from_year"]! as String
            self.lblFromYear6.text = "\(FromYear6Value)"
            FromMonth6Value = dict6["experience_from_month"]! as String
            self.lblFromMonth6.text = "From - \(FromMonth6Value)"
            ToYear6Value = dict6["experience_to_year"]! as String
            self.lblToYear6.text = "\(ToYear6Value)"
            ToMonth6Value = dict6["experience_to_month"]! as String
            self.lblToMonth6.text = "To - \(ToMonth6Value)"
            if self.ToMonth6Value == "Present" {
                self.toYear6View.isHidden = true
            }else{
                self.toYear6View.isHidden = false
            }
            
            let dict7 = expArray[6] as Dictionary
            tfJob7.text = dict7["job_role"]! as String
            tfCompany7.text = dict7["company_name"]! as String
            FromYear7Value = dict7["experience_from_year"]! as String
            self.lblFromYear7.text = "\(FromYear7Value)"
            FromMonth7Value = dict7["experience_from_month"]! as String
            self.lblFromMonth7.text = "From - \(FromMonth7Value)"
            ToYear7Value = dict7["experience_to_year"]! as String
            self.lblToYear7.text = "\(ToYear7Value)"
            ToMonth7Value = dict7["experience_to_month"]! as String
            self.lblToMonth7.text = "To - \(ToMonth7Value)"
            if self.ToMonth7Value == "Present" {
                self.toYear7View.isHidden = true
            }else{
                self.toYear7View.isHidden = false
            }
            
            let dict8 = expArray[7] as Dictionary
            tfJob8.text = dict8["job_role"]! as String
            tfCompany8.text = dict8["company_name"]! as String
            FromYear8Value = dict8["experience_from_year"]! as String
            self.lblFromYear8.text = "\(FromYear8Value)"
            FromMonth8Value = dict8["experience_from_month"]! as String
            self.lblFromMonth8.text = "From - \(FromMonth8Value)"
            ToYear8Value = dict8["experience_to_year"]! as String
            self.lblToYear8.text = "\(ToYear8Value)"
            ToMonth8Value = dict7["experience_to_month"]! as String
            self.lblToMonth8.text = "To - \(ToMonth8Value)"
            if self.ToMonth8Value == "Present" {
                self.toYear8View.isHidden = true
            }else{
                self.toYear8View.isHidden = false
            }
        }else if expArray.count == 9 {
            expFlag = 9
            addMoreHeight.constant = 2954.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = false
            View10.isHidden = false
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
            
            let dict5 = expArray[4] as Dictionary
            tfJob5.text = dict5["job_role"]! as String
            tfCompany5.text = dict5["company_name"]! as String
            FromYear5Value = dict5["experience_from_year"]! as String
            self.lblFromYear5.text = "\(FromYear5Value)"
            FromMonth5Value = dict5["experience_from_month"]! as String
            self.lblFromMonth5.text = "From - \(FromMonth5Value)"
            ToYear5Value = dict5["experience_to_year"]! as String
            self.lblToYear5.text = "\(ToYear5Value)"
            ToMonth5Value = dict5["experience_to_month"]! as String
            self.lblToMonth5.text = "To - \(ToMonth5Value)"
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
            
            let dict6 = expArray[5] as Dictionary
            tfJob6.text = dict6["job_role"]! as String
            tfCompany6.text = dict6["company_name"]! as String
            FromYear6Value = dict6["experience_from_year"]! as String
            self.lblFromYear6.text = "\(FromYear6Value)"
            FromMonth6Value = dict6["experience_from_month"]! as String
            self.lblFromMonth6.text = "From - \(FromMonth6Value)"
            ToYear6Value = dict6["experience_to_year"]! as String
            self.lblToYear6.text = "\(ToYear6Value)"
            ToMonth6Value = dict6["experience_to_month"]! as String
            self.lblToMonth6.text = "To - \(ToMonth6Value)"
            if self.ToMonth6Value == "Present" {
                self.toYear6View.isHidden = true
            }else{
                self.toYear6View.isHidden = false
            }
            
            let dict7 = expArray[6] as Dictionary
            tfJob7.text = dict7["job_role"]! as String
            tfCompany7.text = dict7["company_name"]! as String
            FromYear7Value = dict7["experience_from_year"]! as String
            self.lblFromYear7.text = "\(FromYear7Value)"
            FromMonth7Value = dict7["experience_from_month"]! as String
            self.lblFromMonth7.text = "From - \(FromMonth7Value)"
            ToYear7Value = dict7["experience_to_year"]! as String
            self.lblToYear7.text = "\(ToYear7Value)"
            ToMonth7Value = dict7["experience_to_month"]! as String
            self.lblToMonth7.text = "To - \(ToMonth7Value)"
            if self.ToMonth7Value == "Present" {
                self.toYear7View.isHidden = true
            }else{
                self.toYear7View.isHidden = false
            }
            
            let dict8 = expArray[7] as Dictionary
            tfJob8.text = dict8["job_role"]! as String
            tfCompany8.text = dict8["company_name"]! as String
            FromYear8Value = dict8["experience_from_year"]! as String
            self.lblFromYear8.text = "\(FromYear8Value)"
            FromMonth8Value = dict8["experience_from_month"]! as String
            self.lblFromMonth8.text = "From - \(FromMonth8Value)"
            ToYear8Value = dict8["experience_to_year"]! as String
            self.lblToYear8.text = "\(ToYear8Value)"
            ToMonth8Value = dict8["experience_to_month"]! as String
            self.lblToMonth8.text = "To - \(ToMonth8Value)"
            if self.ToMonth8Value == "Present" {
                self.toYear8View.isHidden = true
            }else{
                self.toYear8View.isHidden = false
            }
            
            
            let dict9 = expArray[8] as Dictionary
            tfJob9.text = dict9["job_role"]! as String
            tfCompany9.text = dict9["company_name"]! as String
            FromYear9Value = dict9["experience_from_year"]! as String
            self.lblFromYear9.text = "\(FromYear9Value)"
            FromMonth9Value = dict9["experience_from_month"]! as String
            self.lblFromMonth9.text = "From - \(FromMonth9Value)"
            ToYear9Value = dict9["experience_to_year"]! as String
            self.lblToYear9.text = "\(ToYear9Value)"
            ToMonth9Value = dict9["experience_to_month"]! as String
            self.lblToMonth9.text = "To - \(ToMonth9Value)"
            if self.ToMonth9Value == "Present" {
                self.toYear9View.isHidden = true
            }else{
                self.toYear9View.isHidden = false
            }
        }else{
            expFlag = 9
            addMoreHeight.constant = 2954.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = false
            View10.isHidden = false
            let dict = expArray[0] as Dictionary
            tfJob.text = dict["job_role"]! as String
            tfCompany.text = dict["company_name"]! as String
            FromYearValue = dict["experience_from_year"]! as String
            self.lblFromYear.text = "\(FromYearValue)"
            FromMonthValue = dict["experience_from_month"]! as String
            self.lblFromMonth.text = "From - \(FromMonthValue)"
            ToYearValue = dict["experience_to_year"]! as String
            self.lblToYear.text = "\(ToYearValue)"
            ToMonthValue = dict["experience_to_month"]! as String
            self.lblToMonth.text = "To - \(ToMonthValue)"
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
            
            let dict2 = expArray[1] as Dictionary
            tfJob2.text = dict2["job_role"]! as String
            tfCompany2.text = dict2["company_name"]! as String
            FromYear2Value = dict2["experience_from_year"]! as String
            self.lblFromYear2.text = "\(FromYear2Value)"
            FromMonth2Value = dict2["experience_from_month"]! as String
            self.lblFromMonth2.text = "From - \(FromMonth2Value)"
            ToYear2Value = dict2["experience_to_year"]! as String
            self.lblToYear2.text = "\(ToYear2Value)"
            ToMonth2Value = dict2["experience_to_month"]! as String
            self.lblToMonth2.text = "To - \(ToMonth2Value)"
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
            
            let dict3 = expArray[2] as Dictionary
            tfJob3.text = dict3["job_role"]! as String
            tfCompany3.text = dict3["company_name"]! as String
            FromYear3Value = dict3["experience_from_year"]! as String
            self.lblFromYear3.text = "\(FromYear3Value)"
            FromMonth3Value = dict3["experience_from_month"]! as String
            self.lblFromMonth3.text = "From - \(FromMonth3Value)"
            ToYear3Value = dict3["experience_to_year"]! as String
            self.lblToYear3.text = "\(ToYear3Value)"
            ToMonth3Value = dict3["experience_to_month"]! as String
            self.lblToMonth3.text = "To - \(ToMonth3Value)"
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
            
            let dict4 = expArray[3] as Dictionary
            tfJob4.text = dict4["job_role"]! as String
            tfCompany4.text = dict4["company_name"]! as String
            FromYear4Value = dict4["experience_from_year"]! as String
            self.lblFromYear4.text = "\(FromYear4Value)"
            FromMonth4Value = dict4["experience_from_month"]! as String
            self.lblFromMonth4.text = "From - \(FromMonth4Value)"
            ToYear4Value = dict4["experience_to_year"]! as String
            self.lblToYear4.text = "\(ToYear4Value)"
            ToMonth4Value = dict4["experience_to_month"]! as String
            self.lblToMonth4.text = "To - \(ToMonth4Value)"
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
            
            let dict5 = expArray[4] as Dictionary
            tfJob5.text = dict5["job_role"]! as String
            tfCompany5.text = dict5["company_name"]! as String
            FromYear5Value = dict5["experience_from_year"]! as String
            self.lblFromYear5.text = "\(FromYear5Value)"
            FromMonth5Value = dict5["experience_from_month"]! as String
            self.lblFromMonth5.text = "From - \(FromMonth5Value)"
            ToYear5Value = dict5["experience_to_year"]! as String
            self.lblToYear5.text = "\(ToYear5Value)"
            ToMonth5Value = dict5["experience_to_month"]! as String
            self.lblToMonth5.text = "To - \(ToMonth5Value)"
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
            
            let dict6 = expArray[5] as Dictionary
            tfJob6.text = dict6["job_role"]! as String
            tfCompany6.text = dict6["company_name"]! as String
            FromYear6Value = dict6["experience_from_year"]! as String
            self.lblFromYear6.text = "\(FromYear6Value)"
            FromMonth6Value = dict6["experience_from_month"]! as String
            self.lblFromMonth6.text = "From - \(FromMonth6Value)"
            ToYear6Value = dict6["experience_to_year"]! as String
            self.lblToYear6.text = "\(ToYear6Value)"
            ToMonth6Value = dict6["experience_to_month"]! as String
            self.lblToMonth6.text = "To - \(ToMonth6Value)"
            if self.ToMonth6Value == "Present" {
                self.toYear6View.isHidden = true
            }else{
                self.toYear6View.isHidden = false
            }
            
            let dict7 = expArray[6] as Dictionary
            tfJob7.text = dict7["job_role"]! as String
            tfCompany7.text = dict7["company_name"]! as String
            FromYear7Value = dict7["experience_from_year"]! as String
            self.lblFromYear7.text = "\(FromYear7Value)"
            FromMonth7Value = dict7["experience_from_month"]! as String
            self.lblFromMonth7.text = "From - \(FromMonth7Value)"
            ToYear7Value = dict7["experience_to_year"]! as String
            self.lblToYear7.text = "\(ToYear7Value)"
            ToMonth7Value = dict7["experience_to_month"]! as String
            self.lblToMonth7.text = "To - \(ToMonth7Value)"
            if self.ToMonth7Value == "Present" {
                self.toYear7View.isHidden = true
            }else{
                self.toYear7View.isHidden = false
            }
            
            let dict8 = expArray[7] as Dictionary
            tfJob8.text = dict8["job_role"]! as String
            tfCompany8.text = dict8["company_name"]! as String
            FromYear8Value = dict8["experience_from_year"]! as String
            self.lblFromYear8.text = "\(FromYear8Value)"
            FromMonth8Value = dict8["experience_from_month"]! as String
            self.lblFromMonth8.text = "From - \(FromMonth8Value)"
            ToYear8Value = dict8["experience_to_year"]! as String
            self.lblToYear8.text = "\(ToYear8Value)"
            ToMonth8Value = dict7["experience_to_month"]! as String
            self.lblToMonth8.text = "To - \(ToMonth8Value)"
            if self.ToMonth8Value == "Present" {
                self.toYear8View.isHidden = true
            }else{
                self.toYear8View.isHidden = false
            }
            
            let dict9 = expArray[8] as Dictionary
            tfJob9.text = dict9["job_role"]! as String
            tfCompany9.text = dict9["company_name"]! as String
            FromYear9Value = dict9["experience_from_year"]! as String
            self.lblFromYear9.text = "\(FromYear9Value)"
            FromMonth9Value = dict9["experience_from_month"]! as String
            self.lblFromMonth9.text = "From - \(FromMonth9Value)"
            ToYear9Value = dict9["experience_to_year"]! as String
            self.lblToYear9.text = "\(ToYear9Value)"
            ToMonth9Value = dict9["experience_to_month"]! as String
            self.lblToMonth9.text = "To - \(ToMonth9Value)"
            if self.ToMonth9Value == "Present" {
                self.toYear9View.isHidden = true
            }else{
                self.toYear9View.isHidden = false
            }
            
            let dict10 = expArray[9] as Dictionary
            tfJob10.text = dict10["job_role"]! as String
            tfCompany10.text = dict10["company_name"]! as String
            FromYear10Value = dict10["experience_from_year"]! as String
            self.lblFromYear10.text = "\(FromYear10Value)"
            FromMonth10Value = dict10["experience_from_month"]! as String
            self.lblFromMonth10.text = "From - \(FromMonth10Value)"
            ToYear10Value = dict10["experience_to_year"]! as String
            self.lblToYear10.text = "\(ToYear10Value)"
            ToMonth10Value = dict10["experience_to_month"]! as String
            self.lblToMonth10.text = "To - \(ToMonth10Value)"
            if self.ToMonth10Value == "Present" {
                self.toYear10View.isHidden = true
            }else{
                self.toYear10View.isHidden = false
            }
        }

        
        
        nextBtn.layer.cornerRadius = 10.0
        AddMoreBtn.layer.cornerRadius = 10.0
        fromMonthView.layer.cornerRadius = 10.0
        fromYearView.layer.cornerRadius = 10.0
        toMonthView.layer.cornerRadius = 10.0
        toYearView.layer.cornerRadius = 10.0
        
        fromMonth2View.layer.cornerRadius = 10.0
        fromYear2View.layer.cornerRadius = 10.0
        toMonth2View.layer.cornerRadius = 10.0
        toYear2View.layer.cornerRadius = 10.0
        
        fromMonth3View.layer.cornerRadius = 10.0
        fromYear3View.layer.cornerRadius = 10.0
        toMonth3View.layer.cornerRadius = 10.0
        toYear3View.layer.cornerRadius = 10.0
        
        fromMonth4View.layer.cornerRadius = 10.0
        fromYear4View.layer.cornerRadius = 10.0
        toMonth4View.layer.cornerRadius = 10.0
        toYear4View.layer.cornerRadius = 10.0
        
        fromMonth5View.layer.cornerRadius = 10.0
        fromYear5View.layer.cornerRadius = 10.0
        toMonth5View.layer.cornerRadius = 10.0
        toYear5View.layer.cornerRadius = 10.0
        
        fromMonth6View.layer.cornerRadius = 10.0
        fromYear6View.layer.cornerRadius = 10.0
        toMonth6View.layer.cornerRadius = 10.0
        toYear6View.layer.cornerRadius = 10.0
        
        fromMonth7View.layer.cornerRadius = 10.0
        fromYear7View.layer.cornerRadius = 10.0
        toMonth7View.layer.cornerRadius = 10.0
        toYear7View.layer.cornerRadius = 10.0
        
        fromMonth8View.layer.cornerRadius = 10.0
        fromYear8View.layer.cornerRadius = 10.0
        toMonth8View.layer.cornerRadius = 10.0
        toYear8View.layer.cornerRadius = 10.0
        
        fromMonth9View.layer.cornerRadius = 10.0
        fromYear9View.layer.cornerRadius = 10.0
        toMonth9View.layer.cornerRadius = 10.0
        toYear9View.layer.cornerRadius = 10.0
        
        fromMonth10View.layer.cornerRadius = 10.0
        fromYear10View.layer.cornerRadius = 10.0
        toMonth10View.layer.cornerRadius = 10.0
        toYear10View.layer.cornerRadius = 10.0
        
        fromMonthView.layer.borderWidth = 1.0
        fromMonthView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYearView.layer.borderWidth = 1.0
        fromYearView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonthView.layer.borderWidth = 1.0
        toMonthView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYearView.layer.borderWidth = 1.0
        toYearView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth2View.layer.borderWidth = 1.0
        fromMonth2View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear2View.layer.borderWidth = 1.0
        fromYear2View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth2View.layer.borderWidth = 1.0
        toMonth2View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear2View.layer.borderWidth = 1.0
        toYear2View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth3View.layer.borderWidth = 1.0
        fromMonth3View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear3View.layer.borderWidth = 1.0
        fromYear3View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth3View.layer.borderWidth = 1.0
        toMonth3View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear3View.layer.borderWidth = 1.0
        toYear3View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth4View.layer.borderWidth = 1.0
        fromMonth4View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear4View.layer.borderWidth = 1.0
        fromYear4View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth4View.layer.borderWidth = 1.0
        toMonth4View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear4View.layer.borderWidth = 1.0
        toYear4View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth5View.layer.borderWidth = 1.0
        fromMonth5View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear5View.layer.borderWidth = 1.0
        fromYear5View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth5View.layer.borderWidth = 1.0
        toMonth5View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear5View.layer.borderWidth = 1.0
        toYear5View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth6View.layer.borderWidth = 1.0
        fromMonth6View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear6View.layer.borderWidth = 1.0
        fromYear6View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth6View.layer.borderWidth = 1.0
        toMonth6View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear6View.layer.borderWidth = 1.0
        toYear6View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth7View.layer.borderWidth = 1.0
        fromMonth7View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear7View.layer.borderWidth = 1.0
        fromYear7View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth7View.layer.borderWidth = 1.0
        toMonth7View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear7View.layer.borderWidth = 1.0
        toYear7View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth8View.layer.borderWidth = 1.0
        fromMonth8View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear8View.layer.borderWidth = 1.0
        fromYear8View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth8View.layer.borderWidth = 1.0
        toMonth8View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear8View.layer.borderWidth = 1.0
        toYear8View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth9View.layer.borderWidth = 1.0
        fromMonth9View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear9View.layer.borderWidth = 1.0
        fromYear9View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth9View.layer.borderWidth = 1.0
        toMonth9View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear9View.layer.borderWidth = 1.0
        toYear9View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        fromMonth10View.layer.borderWidth = 1.0
        fromMonth10View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        fromYear10View.layer.borderWidth = 1.0
        fromYear10View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toMonth10View.layer.borderWidth = 1.0
        toMonth10View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        toYear10View.layer.borderWidth = 1.0
        toYear10View.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        
        FromMonthType = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYearType = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonthType = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYearType = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth2Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear2Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth2Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear2Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth3Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear3Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth3Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear3Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth4Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear4Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth4Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear4Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth5Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear5Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth5Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear5Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth6Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear6Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth6Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear6Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth7Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear7Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth7Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear7Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        FromMonth8Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear8Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth8Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear8Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth9Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear9Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth9Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear9Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        
        FromMonth10Type = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        FromYear10Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        ToMonth10Type = ["Present","January","February","March","April","May","June","July","August","September","October","November","December"]
        ToYear10Type = ["1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
        
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfJob.placeholder ?? ""
        tfJob.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfCompany.placeholder ?? ""
        tfCompany.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfJob2.placeholder ?? ""
        tfJob.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tfCompany2.placeholder ?? ""
        tfCompany2.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder5 = tfJob3.placeholder ?? ""
        tfJob3.attributedPlaceholder = NSAttributedString(string: placeholder5, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder6 = tfCompany3.placeholder ?? ""
        tfCompany3.attributedPlaceholder = NSAttributedString(string: placeholder6, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder7 = tfJob4.placeholder ?? ""
        tfJob4.attributedPlaceholder = NSAttributedString(string: placeholder7, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder8 = tfCompany4.placeholder ?? ""
        tfCompany4.attributedPlaceholder = NSAttributedString(string: placeholder8, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder9 = tfJob5.placeholder ?? ""
        tfJob5.attributedPlaceholder = NSAttributedString(string: placeholder9, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder10 = tfCompany5.placeholder ?? ""
        tfCompany5.attributedPlaceholder = NSAttributedString(string: placeholder10, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder11 = tfJob6.placeholder ?? ""
        tfJob6.attributedPlaceholder = NSAttributedString(string: placeholder11, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder12 = tfCompany6.placeholder ?? ""
        tfCompany6.attributedPlaceholder = NSAttributedString(string: placeholder12, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder13 = tfJob7.placeholder ?? ""
        tfJob7.attributedPlaceholder = NSAttributedString(string: placeholder13, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder14 = tfCompany7.placeholder ?? ""
        tfCompany7.attributedPlaceholder = NSAttributedString(string: placeholder14, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder15 = tfJob8.placeholder ?? ""
        tfJob8.attributedPlaceholder = NSAttributedString(string: placeholder15, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder16 = tfCompany8.placeholder ?? ""
        tfCompany8.attributedPlaceholder = NSAttributedString(string: placeholder16, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder17 = tfJob9.placeholder ?? ""
        tfJob9.attributedPlaceholder = NSAttributedString(string: placeholder17, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder18 = tfCompany9.placeholder ?? ""
        tfCompany9.attributedPlaceholder = NSAttributedString(string: placeholder18, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder19 = tfJob10.placeholder ?? ""
        tfJob10.attributedPlaceholder = NSAttributedString(string: placeholder19, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder20 = tfCompany10.placeholder ?? ""
        tfCompany10.attributedPlaceholder = NSAttributedString(string: placeholder20, attributes: [NSAttributedString.Key.foregroundColor : color])

        tfJob.delegate = self
        tfCompany.delegate = self
        tfJob2.delegate = self
        tfCompany2.delegate = self
        tfJob3.delegate = self
        tfCompany3.delegate = self
        tfJob4.delegate = self
        tfCompany4.delegate = self
        tfJob5.delegate = self
        tfCompany5.delegate = self
        tfJob6.delegate = self
        tfCompany6.delegate = self
        tfJob7.delegate = self
        tfCompany7.delegate = self
        tfJob8.delegate = self
        tfCompany8.delegate = self
        tfJob9.delegate = self
        tfCompany9.delegate = self
        tfJob10.delegate = self
        tfCompany10.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
        expArray.removeAll()
        if expFlag == 0 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                    expArray.append(dict)
                }
            }
        }else if expFlag == 1 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != "" {
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != "" {
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
            }
        }else if expFlag == 2 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != "" {
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" &&  ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
            }
        }else if expFlag == 3 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
            }
        }else if expFlag == 4 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
            }else if tfJob5.text != "" && tfCompany5.text != "" && FromYear5Value != "" && FromMonth5Value != "" && ToMonth5Value != ""{
                if (ToMonth5Value == "Present" && ToYear5Value == "") || (ToMonth5Value != "Present" && ToYear5Value != ""){
                    let dict = ["job_role": "\(tfJob5.text!)", "company_name": "\(tfCompany5.text!)", "experience_from_year":"\(FromYear5Value)","experience_from_month":"\(FromMonth5Value)", "experience_to_year":"\(ToYear5Value)","experience_to_month":"\(ToMonth5Value)"]
                        expArray.append(dict)
                }
            }
        }else if expFlag == 5 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != ""  && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
                
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob5.text != "" && tfCompany5.text != "" && FromYear5Value != "" && FromMonth5Value != "" && ToMonth5Value != ""{
                if (ToMonth5Value == "Present" && ToYear5Value == "") || (ToMonth5Value != "Present" && ToYear5Value != ""){
                    let dict = ["job_role": "\(tfJob5.text!)", "company_name": "\(tfCompany5.text!)", "experience_from_year":"\(FromYear5Value)","experience_from_month":"\(FromMonth5Value)", "experience_to_year":"\(ToYear5Value)","experience_to_month":"\(ToMonth5Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob6.text != "" && tfCompany5.text != "" && FromYear6Value != "" && FromMonth6Value != "" && ToMonth6Value != ""{
                if (ToMonth6Value == "Present" && ToYear6Value == "") || (ToMonth6Value != "Present" && ToYear6Value != ""){
                    let dict = ["job_role": "\(tfJob6.text!)", "company_name": "\(tfCompany6.text!)", "experience_from_year":"\(FromYear6Value)","experience_from_month":"\(FromMonth6Value)", "experience_to_year":"\(ToYear6Value)","experience_to_month":"\(ToMonth6Value)"]
                        expArray.append(dict)
                }
                
            }else{
                
            }
        }else if expFlag == 6 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
                
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob5.text != "" && tfCompany5.text != "" && FromYear5Value != "" && FromMonth5Value != "" && ToMonth5Value != ""{
                if (ToMonth5Value == "Present" && ToYear5Value == "") || (ToMonth5Value != "Present" && ToYear5Value != ""){
                    let dict = ["job_role": "\(tfJob5.text!)", "company_name": "\(tfCompany5.text!)", "experience_from_year":"\(FromYear5Value)","experience_from_month":"\(FromMonth5Value)", "experience_to_year":"\(ToYear5Value)","experience_to_month":"\(ToMonth5Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob6.text != "" && tfCompany5.text != "" && FromYear6Value != "" && FromMonth6Value != "" && ToMonth6Value != ""{
                if (ToMonth6Value == "Present" && ToYear6Value == "") || (ToMonth6Value != "Present" && ToYear6Value != ""){
                    let dict = ["job_role": "\(tfJob6.text!)", "company_name": "\(tfCompany6.text!)", "experience_from_year":"\(FromYear6Value)","experience_from_month":"\(FromMonth6Value)", "experience_to_year":"\(ToYear6Value)","experience_to_month":"\(ToMonth6Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob7.text != "" && tfCompany7.text != "" && FromYear7Value != "" && FromMonth7Value != "" && ToMonth7Value != ""{
                if (ToMonth7Value == "Present" && ToYear7Value == "") || (ToMonth7Value != "Present" && ToYear7Value != ""){
                    let dict = ["job_role": "\(tfJob7.text!)", "company_name": "\(tfCompany7.text!)", "experience_from_year":"\(FromYear7Value)","experience_from_month":"\(FromMonth7Value)", "experience_to_year":"\(ToYear7Value)","experience_to_month":"\(ToMonth7Value)"]
                        expArray.append(dict)
                }
                
            }
        }else if expFlag == 7 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
                
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob5.text != "" && tfCompany5.text != "" && FromYear5Value != "" && FromMonth5Value != "" && ToMonth5Value != ""{
                if (ToMonth5Value == "Present" && ToYear5Value == "") || (ToMonth5Value != "Present" && ToYear5Value != ""){
                    let dict = ["job_role": "\(tfJob5.text!)", "company_name": "\(tfCompany5.text!)", "experience_from_year":"\(FromYear5Value)","experience_from_month":"\(FromMonth5Value)", "experience_to_year":"\(ToYear5Value)","experience_to_month":"\(ToMonth5Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob6.text != "" && tfCompany5.text != "" && FromYear6Value != "" && FromMonth6Value != "" && ToMonth6Value != ""{
                if (ToMonth6Value == "Present" && ToYear6Value == "") || (ToMonth6Value != "Present" && ToYear6Value != ""){
                    let dict = ["job_role": "\(tfJob6.text!)", "company_name": "\(tfCompany6.text!)", "experience_from_year":"\(FromYear6Value)","experience_from_month":"\(FromMonth6Value)", "experience_to_year":"\(ToYear6Value)","experience_to_month":"\(ToMonth6Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob7.text != "" && tfCompany7.text != "" && FromYear7Value != "" && FromMonth7Value != "" && ToMonth7Value != ""{
                if (ToMonth7Value == "Present" && ToYear7Value == "") || (ToMonth7Value != "Present" && ToYear7Value != ""){
                    let dict = ["job_role": "\(tfJob7.text!)", "company_name": "\(tfCompany7.text!)", "experience_from_year":"\(FromYear7Value)","experience_from_month":"\(FromMonth7Value)", "experience_to_year":"\(ToYear7Value)","experience_to_month":"\(ToMonth7Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob8.text != "" && tfCompany8.text != "" && FromYear8Value != "" && FromMonth8Value != "" && ToMonth8Value != ""{
                if (ToMonth8Value == "Present" && ToYear8Value == "") || (ToMonth8Value != "Present" && ToYear8Value != ""){
                    let dict = ["job_role": "\(tfJob8.text!)", "company_name": "\(tfCompany8.text!)", "experience_from_year":"\(FromYear8Value)","experience_from_month":"\(FromMonth8Value)", "experience_to_year":"\(ToYear8Value)","experience_to_month":"\(ToMonth8Value)"]
                        expArray.append(dict)
                }
                
            }
        }else if expFlag == 8 {
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
                
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob5.text != "" && tfCompany5.text != "" && FromYear5Value != "" && FromMonth5Value != "" && ToMonth5Value != ""{
                if (ToMonth5Value == "Present" && ToYear5Value == "") || (ToMonth5Value != "Present" && ToYear5Value != ""){
                    let dict = ["job_role": "\(tfJob5.text!)", "company_name": "\(tfCompany5.text!)", "experience_from_year":"\(FromYear5Value)","experience_from_month":"\(FromMonth5Value)", "experience_to_year":"\(ToYear5Value)","experience_to_month":"\(ToMonth5Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob6.text != "" && tfCompany5.text != "" && FromYear6Value != "" && FromMonth6Value != "" && ToMonth6Value != ""{
                if (ToMonth6Value == "Present" && ToYear6Value == "") || (ToMonth6Value != "Present" && ToYear6Value != ""){
                    let dict = ["job_role": "\(tfJob6.text!)", "company_name": "\(tfCompany6.text!)", "experience_from_year":"\(FromYear6Value)","experience_from_month":"\(FromMonth6Value)", "experience_to_year":"\(ToYear6Value)","experience_to_month":"\(ToMonth6Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob7.text != "" && tfCompany7.text != "" && FromYear7Value != "" && FromMonth7Value != "" && ToMonth7Value != ""{
                if (ToMonth7Value == "Present" && ToYear7Value == "") || (ToMonth7Value != "Present" && ToYear7Value != ""){
                    let dict = ["job_role": "\(tfJob7.text!)", "company_name": "\(tfCompany7.text!)", "experience_from_year":"\(FromYear7Value)","experience_from_month":"\(FromMonth7Value)", "experience_to_year":"\(ToYear7Value)","experience_to_month":"\(ToMonth7Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob8.text != "" && tfCompany8.text != "" && FromYear8Value != "" && FromMonth8Value != "" && ToMonth8Value != ""{
                if (ToMonth8Value == "Present" && ToYear8Value == "") || (ToMonth8Value != "Present" && ToYear8Value != ""){
                    let dict = ["job_role": "\(tfJob8.text!)", "company_name": "\(tfCompany8.text!)", "experience_from_year":"\(FromYear8Value)","experience_from_month":"\(FromMonth8Value)", "experience_to_year":"\(ToYear8Value)","experience_to_month":"\(ToMonth8Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob9.text != "" && tfCompany9.text != "" && FromYear9Value != "" && FromMonth9Value != "" && ToMonth9Value != ""{
                if (ToMonth9Value == "Present" && ToYear9Value == "") || (ToMonth9Value != "Present" && ToYear9Value != ""){}
                let dict = ["job_role": "\(tfJob9.text!)", "company_name": "\(tfCompany9.text!)", "experience_from_year":"\(FromYear9Value)","experience_from_month":"\(FromMonth9Value)", "experience_to_year":"\(ToYear9Value)","experience_to_month":"\(ToMonth9Value)"]
                    expArray.append(dict)
            }
        }else{
            if tfJob.text != "" && tfCompany.text != "" && FromYearValue != "" && FromMonthValue != "" && ToMonthValue != ""{
                if (ToMonthValue == "Present" && ToYearValue == "") || (ToMonthValue != "Present" && ToYearValue != ""){
                    let dict = ["job_role": "\(tfJob.text!)", "company_name": "\(tfCompany.text!)", "experience_from_year":"\(FromYearValue)","experience_from_month":"\(FromMonthValue)", "experience_to_year":"\(ToYearValue)","experience_to_month":"\(ToMonthValue)"]
                        expArray.append(dict)
                }
                
            }else if tfJob2.text != "" && tfCompany2.text != "" && FromYear2Value != "" && FromMonth2Value != "" && ToMonth2Value != ""{
                if (ToMonth2Value == "Present" && ToYear2Value == "") || (ToMonth2Value != "Present" && ToYear2Value != ""){
                    let dict = ["job_role": "\(tfJob2.text!)", "company_name": "\(tfCompany2.text!)", "experience_from_year":"\(FromYear2Value)","experience_from_month":"\(FromMonth2Value)", "experience_to_year":"\(ToYear2Value)","experience_to_month":"\(ToMonth2Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob3.text != "" && tfCompany3.text != "" && FromYear3Value != "" && FromMonth3Value != "" && ToMonth3Value != ""{
                if (ToMonth3Value == "Present" && ToYear3Value == "") || (ToMonth3Value != "Present" && ToYear3Value != ""){
                    let dict = ["job_role": "\(tfJob3.text!)", "company_name": "\(tfCompany3.text!)", "experience_from_year":"\(FromYear3Value)","experience_from_month":"\(FromMonth3Value)", "experience_to_year":"\(ToYear3Value)","experience_to_month":"\(ToMonth3Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob4.text != "" && tfCompany4.text != "" && FromYear4Value != "" && FromMonth4Value != "" && ToMonth4Value != ""{
                if (ToMonth4Value == "Present" && ToYear4Value == "") || (ToMonth4Value != "Present" && ToYear4Value != ""){
                    let dict = ["job_role": "\(tfJob4.text!)", "company_name": "\(tfCompany4.text!)", "experience_from_year":"\(FromYear4Value)","experience_from_month":"\(FromMonth4Value)", "experience_to_year":"\(ToYear4Value)","experience_to_month":"\(ToMonth4Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob5.text != "" && tfCompany5.text != "" && FromYear5Value != "" && FromMonth5Value != "" && ToMonth5Value != ""{
                if (ToMonth5Value == "Present" && ToYear5Value == "") || (ToMonth5Value != "Present" && ToYear5Value != ""){
                    let dict = ["job_role": "\(tfJob5.text!)", "company_name": "\(tfCompany5.text!)", "experience_from_year":"\(FromYear5Value)","experience_from_month":"\(FromMonth5Value)", "experience_to_year":"\(ToYear5Value)","experience_to_month":"\(ToMonth5Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob6.text != "" && tfCompany5.text != "" && FromYear6Value != "" && FromMonth6Value != "" && ToMonth6Value != ""{
                if (ToMonth6Value == "Present" && ToYear6Value == "") || (ToMonth6Value != "Present" && ToYear6Value != ""){
                    let dict = ["job_role": "\(tfJob6.text!)", "company_name": "\(tfCompany6.text!)", "experience_from_year":"\(FromYear6Value)","experience_from_month":"\(FromMonth6Value)", "experience_to_year":"\(ToYear6Value)","experience_to_month":"\(ToMonth6Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob7.text != "" && tfCompany7.text != "" && FromYear7Value != "" && FromMonth7Value != "" && ToMonth7Value != ""{
                if (ToMonth7Value == "Present" && ToYear7Value == "") || (ToMonth7Value != "Present" && ToYear7Value != ""){
                    let dict = ["job_role": "\(tfJob7.text!)", "company_name": "\(tfCompany7.text!)", "experience_from_year":"\(FromYear7Value)","experience_from_month":"\(FromMonth7Value)", "experience_to_year":"\(ToYear7Value)","experience_to_month":"\(ToMonth7Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob8.text != "" && tfCompany8.text != "" && FromYear8Value != "" && FromMonth8Value != "" && ToMonth8Value != ""{
                if (ToMonth8Value == "Present" && ToYear8Value == "") || (ToMonth8Value != "Present" && ToYear8Value != ""){
                    let dict = ["job_role": "\(tfJob8.text!)", "company_name": "\(tfCompany8.text!)", "experience_from_year":"\(FromYear8Value)","experience_from_month":"\(FromMonth8Value)", "experience_to_year":"\(ToYear8Value)","experience_to_month":"\(ToMonth8Value)"]
                        expArray.append(dict)
                }
                
            }else if tfJob9.text != "" && tfCompany9.text != "" && FromYear9Value != "" && FromMonth9Value != "" &&  ToMonth9Value != ""{
                if (ToMonth9Value == "Present" && ToYear9Value == "") || (ToMonth9Value != "Present" && ToYear9Value != ""){}
                let dict = ["job_role": "\(tfJob9.text!)", "company_name": "\(tfCompany9.text!)", "experience_from_year":"\(FromYear9Value)","experience_from_month":"\(FromMonth9Value)", "experience_to_year":"\(ToYear9Value)","experience_to_month":"\(ToMonth9Value)"]
                    expArray.append(dict)
            }else if tfJob10.text != "" && tfCompany10.text != "" && FromYear10Value != "" && FromMonth10Value != "" && ToMonth10Value != ""{
                if (ToMonth10Value == "Present" && ToYear10Value == "") || (ToMonth10Value != "Present" && ToYear10Value != ""){
                    let dict = ["job_role": "\(tfJob10.text!)", "company_name": "\(tfCompany10.text!)", "experience_from_year":"\(FromYear10Value)","experience_from_month":"\(FromMonth10Value)", "experience_to_year":"\(ToYear10Value)","experience_to_month":"\(ToMonth10Value)"]
                        expArray.append(dict)
                }
                
            }else{
            }
        }
        
        UserDefaults.standard.set(self.expArray, forKey: "candidateExpArray")
        UserDefaults.standard.synchronize()
        
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignupVC3") as? userSignupVC3
            vc?.profile = profile
            vc?.Name = Name
        vc?.lastName = lastName
            vc?.email = email
            vc?.Password = Password
            vc?.Phone = Phone
            vc?.Address = Address
            vc?.expArray = expArray
            self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func AddClicked(_ sender: UIButton) {
        
        if expFlag == 0 {
            expFlag = 1
            addMoreHeight.constant = 346.0
            View2.isHidden = false
            View3.isHidden = true
            View4.isHidden = true
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 1 {
            expFlag = 2
            addMoreHeight.constant = 672.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = true
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 2 {
            expFlag = 3
            addMoreHeight.constant = 998.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = true
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 3 {
            expFlag = 4
            addMoreHeight.constant = 1324.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = true
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 4 {
            expFlag = 5
            addMoreHeight.constant = 1650.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = true
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 5 {
            expFlag = 6
            addMoreHeight.constant = 1976.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = true
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 6 {
            expFlag = 7
            addMoreHeight.constant = 2302.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = true
            View10.isHidden = true
        }else if expFlag == 7 {
            expFlag = 8
            addMoreHeight.constant = 2628.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = false
            View10.isHidden = true
        }else if expFlag == 8 {
            expFlag = 9
            addMoreHeight.constant = 2954.0
            View2.isHidden = false
            View3.isHidden = false
            View4.isHidden = false
            View5.isHidden = false
            View6.isHidden = false
            View7.isHidden = false
            View8.isHidden = false
            View9.isHidden = false
            View10.isHidden = false
        }else{
            let alert = UIAlertController(title: "Procruited", message: "You can't add more experince", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func DropFromMonthClicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth.text = "From - \(item)"
            self.FromMonthValue = item
            self.imgFromMonth.image = UIImage(named: "drop")
        }
        self.FromMonth.anchorView = self.fromMonthView
        imgFromMonth.image = UIImage(named: "plus")
        self.FromMonth.dataSource = FromMonthType
        self.FromMonth.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth.bottomOffset = CGPoint(x: 0, y:(FromMonth.anchorView?.plainView.bounds.height)!)
        FromMonth.setupCornerRadius(10.0)
        FromMonth.backgroundColor = UIColor.white
        FromMonth.textColor = UIColor(hexString: "#717171")
        FromMonth.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth.layer.borderWidth = 1.0
        FromMonth.direction = .bottom
        
        FromMonth.show()
    }
    
    
    @IBAction func DropFromYearClicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear.text = item
            self.FromYearValue = item
            self.imgFromYear.image = UIImage(named: "drop")
            self.lblToYear.text = "Year"
            self.ToYearValue = ""
            
        }
        self.FromYear.anchorView = self.fromYearView
        self.imgFromYear.image = UIImage(named: "plus")
        self.FromYear.dataSource = FromYearType
        self.FromYear.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear.bottomOffset = CGPoint(x: 0, y:(FromYear.anchorView?.plainView.bounds.height)!)
        FromYear.setupCornerRadius(10.0)
        FromYear.backgroundColor = UIColor.white
        FromYear.textColor = UIColor(hexString: "#717171")
        FromYear.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear.layer.borderWidth = 1.0
        FromYear.direction = .bottom
        
        FromYear.show()
    }
    
    @IBAction func dropToMonthClicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth.text = "To - \(item)"
            self.ToMonthValue = item
            self.imgToMonth.image = UIImage(named: "drop")
            if self.ToMonthValue == "Present" {
                self.toYearView.isHidden = true
            }else{
                self.toYearView.isHidden = false
            }
        }
        self.ToMonth.anchorView = self.toMonthView
        self.imgToMonth.image = UIImage(named: "plus")
        self.ToMonth.dataSource = ToMonthType
        self.ToMonth.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth.bottomOffset = CGPoint(x: 0, y:(ToMonth.anchorView?.plainView.bounds.height)!)
        ToMonth.setupCornerRadius(10.0)
        ToMonth.backgroundColor = UIColor.white
        ToMonth.textColor = UIColor(hexString: "#717171")
        ToMonth.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth.layer.borderWidth = 1.0
        ToMonth.direction = .bottom
        
        ToMonth.show()
    }
    
    @IBAction func dropToYearClicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            //Int.getInt(item)
            if self.FromYearValue != ""{
                let year2 = Int.getInt(self.FromYearValue)
                if year2 > Int.getInt(item) {
                    self.lblToYear.text = "Year"
                        self.ToYearValue = ""
                }else{
                    self.lblToYear.text = item
                        self.ToYearValue = item
                }
                }else{
                    self.lblToYear.text = item
                        self.ToYearValue = item
                }
                
        //self.lblToYear.text = item
            //self.ToYearValue = item
            self.imgToYear.image = UIImage(named: "drop")
            //self.AccountselctedValue = self.accountdata[0].data[index].id
           // print(self.AccountselctedValue)
        }
        self.ToYear.anchorView = self.toYearView
        self.imgToYear.image = UIImage(named: "plus")
        self.ToYear.dataSource = ToYearType
        self.ToYear.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear.bottomOffset = CGPoint(x: 0, y:(ToYear.anchorView?.plainView.bounds.height)!)
        ToYear.setupCornerRadius(10.0)
        ToYear.backgroundColor = UIColor.white
        ToYear.textColor = UIColor(hexString: "#717171")
        ToYear.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear.layer.borderWidth = 1.0
        ToYear.direction = .bottom
        
        ToYear.show()
    }
    
    @IBAction func DropFromMonth2Clicked(_ sender: UIButton) {
        view.endEditing(true)
        self.FromMonth2.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth2.text = "From - \(item)"
            self.FromMonth2Value = item
            self.imgFromMonth2.image = UIImage(named: "drop")
        }
        self.FromMonth2.anchorView = self.fromMonth2View
        self.imgFromMonth2.image = UIImage(named: "plus")
        self.FromMonth2.dataSource = FromMonth2Type
        self.FromMonth2.cellConfiguration = { (index, item) in return "\(item)" }
        
        self.FromMonth2.bottomOffset = CGPoint(x: 0, y:(self.FromMonth2.anchorView?.plainView.bounds.height)!)
        self.FromMonth2.setupCornerRadius(10.0)
        self.FromMonth2.backgroundColor = UIColor.white
        self.FromMonth2.textColor = UIColor(hexString: "#717171")
        self.FromMonth2.layer.borderColor = UIColor(hexString: "#717171").cgColor
        self.FromMonth2.layer.borderWidth = 1.0
        self.FromMonth2.direction = .bottom
        
        self.FromMonth2.show()
    }
    
    
    @IBAction func DropFromYear2Clicked(_ sender: UIButton) {
        view.endEditing(true)
        self.FromYear2.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear2.text = item
            self.FromYear2Value = item
            self.imgFromYear2.image = UIImage(named: "drop")
            self.lblToYear2.text = "Year"
            self.ToYear2Value = ""
            
        }
        self.FromYear2.anchorView = self.fromYear2View
        self.imgFromYear2.image = UIImage(named: "plus")
        self.FromYear2.dataSource = FromYear2Type
        self.FromYear2.cellConfiguration = { (index, item) in return "\(item)" }
        
        self.FromYear2.bottomOffset = CGPoint(x: 0, y:(self.FromYear2.anchorView?.plainView.bounds.height)!)
        self.FromYear2.setupCornerRadius(10.0)
        self.FromYear2.backgroundColor = UIColor.white
        self.FromYear2.textColor = UIColor(hexString: "#717171")
        self.FromYear2.layer.borderColor = UIColor(hexString: "#717171").cgColor
        self.FromYear2.layer.borderWidth = 1.0
        self.FromYear2.direction = .bottom
        
        self.FromYear2.show()
    }
    
    @IBAction func dropToMonth2Clicked(_ sender: UIButton) {
        view.endEditing(true)
        self.ToMonth2.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth2.text = "To - \(item)"
            self.ToMonth2Value = item
            self.imgToMonth2.image = UIImage(named: "drop")
            if self.ToMonth2Value == "Present" {
                self.toYear2View.isHidden = true
            }else{
                self.toYear2View.isHidden = false
            }
        }
        self.ToMonth2.anchorView = self.toMonth2View
        self.imgToMonth2.image = UIImage(named: "plus")
        self.ToMonth2.dataSource = ToMonth2Type
        self.ToMonth2.cellConfiguration = { (index, item) in return "\(item)" }
        
        self.ToMonth2.bottomOffset = CGPoint(x: 0, y:(self.ToMonth2.anchorView?.plainView.bounds.height)!)
        self.ToMonth2.setupCornerRadius(10.0)
        self.ToMonth2.backgroundColor = UIColor.white
        self.ToMonth2.textColor = UIColor(hexString: "#717171")
        self.ToMonth2.layer.borderColor = UIColor(hexString: "#717171").cgColor
        self.ToMonth2.layer.borderWidth = 1.0
        self.ToMonth2.direction = .bottom
        
        self.ToMonth2.show()
    }
    
    @IBAction func dropToYear2Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear2.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear2Value != ""{
                let year2 = Int.getInt(self.FromYear2Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear2.text = "Year"
                        self.ToYear2Value = ""
                }else{
                    self.lblToYear2.text = item
                        self.ToYear2Value = item
                }
                }else{
                    self.lblToYear2.text = item
                        self.ToYear2Value = item
                }
            self.imgToYear2.image = UIImage(named: "drop")
            
        }
        self.ToYear2.anchorView = self.toYear2View
        self.imgToYear2.image = UIImage(named: "plus")
        self.ToYear2.dataSource = ToYear2Type
        self.ToYear2.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear2.bottomOffset = CGPoint(x: 0, y:(ToYear2.anchorView?.plainView.bounds.height)!)
        ToYear2.setupCornerRadius(10.0)
        ToYear2.backgroundColor = UIColor.white
        ToYear2.textColor = UIColor(hexString: "#717171")
        ToYear2.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear2.layer.borderWidth = 1.0
        ToYear2.direction = .bottom
        
        ToYear2.show()
    }
    
    @IBAction func DropFromMonth3Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth3.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth3.text = "From - \(item)"
            self.FromMonth3Value = item
            self.imgFromMonth3.image = UIImage(named: "drop")
        }
        self.FromMonth3.anchorView = self.fromMonth3View
        imgFromMonth3.image = UIImage(named: "plus")
        self.FromMonth3.dataSource = FromMonth3Type
        self.FromMonth3.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth3.bottomOffset = CGPoint(x: 0, y:(FromMonth3.anchorView?.plainView.bounds.height)!)
        FromMonth3.setupCornerRadius(10.0)
        FromMonth3.backgroundColor = UIColor.white
        FromMonth3.textColor = UIColor(hexString: "#717171")
        FromMonth3.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth3.layer.borderWidth = 1.0
        FromMonth3.direction = .bottom
        
        FromMonth3.show()
    }
    
    
    @IBAction func DropFromYear3Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear3.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear3.text = item
            self.FromYear3Value = item
            self.imgFromYear3.image = UIImage(named: "drop")
            self.lblToYear3.text = "Year"
            self.ToYear3Value = ""
            
        }
        self.FromYear3.anchorView = self.fromYear3View
        self.imgFromYear3.image = UIImage(named: "plus")
        self.FromYear3.dataSource = FromYear3Type
        self.FromYear3.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear3.bottomOffset = CGPoint(x: 0, y:(FromYear3.anchorView?.plainView.bounds.height)!)
        FromYear3.setupCornerRadius(10.0)
        FromYear3.backgroundColor = UIColor.white
        FromYear3.textColor = UIColor(hexString: "#717171")
        FromYear3.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear3.layer.borderWidth = 1.0
        FromYear3.direction = .bottom
        
        FromYear3.show()
    }
    
    @IBAction func dropToMonth3Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth3.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth3.text = "To - \(item)"
            self.ToMonth3Value = item
            self.imgToMonth3.image = UIImage(named: "drop")
            if self.ToMonth3Value == "Present" {
                self.toYear3View.isHidden = true
            }else{
                self.toYear3View.isHidden = false
            }
        }
        self.ToMonth3.anchorView = self.toMonth3View
        self.imgToMonth3.image = UIImage(named: "plus")
        self.ToMonth3.dataSource = ToMonth3Type
        self.ToMonth3.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth3.bottomOffset = CGPoint(x: 0, y:(ToMonth3.anchorView?.plainView.bounds.height)!)
        ToMonth3.setupCornerRadius(10.0)
        ToMonth3.backgroundColor = UIColor.white
        ToMonth3.textColor = UIColor(hexString: "#717171")
        ToMonth3.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth3.layer.borderWidth = 1.0
        ToMonth3.direction = .bottom
        
        ToMonth3.show()
    }
    
    @IBAction func dropToYear3Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear3.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear3Value != ""{
                let year2 = Int.getInt(self.FromYear3Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear3.text = "Year"
                        self.ToYear3Value = ""
                }else{
                    self.lblToYear3.text = item
                        self.ToYear3Value = item
                }
                }else{
                    self.lblToYear3.text = item
                        self.ToYear3Value = item
                }
            self.imgToYear3.image = UIImage(named: "drop")
            
        }
        self.ToYear3.anchorView = self.toYear3View
        self.imgToYear3.image = UIImage(named: "plus")
        self.ToYear3.dataSource = ToYear3Type
        self.ToYear3.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear3.bottomOffset = CGPoint(x: 0, y:(ToYear3.anchorView?.plainView.bounds.height)!)
        ToYear3.setupCornerRadius(10.0)
        ToYear3.backgroundColor = UIColor.white
        ToYear3.textColor = UIColor(hexString: "#717171")
        ToYear3.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear3.layer.borderWidth = 1.0
        ToYear3.direction = .bottom
        
        ToYear3.show()
    }
    
    @IBAction func DropFromMonth4Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth4.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth4.text = "From - \(item)"
            self.FromMonth4Value = item
            self.imgFromMonth4.image = UIImage(named: "drop")
        }
        self.FromMonth4.anchorView = self.fromMonth4View
        imgFromMonth4.image = UIImage(named: "plus")
        self.FromMonth4.dataSource = FromMonth4Type
        self.FromMonth4.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth4.bottomOffset = CGPoint(x: 0, y:(FromMonth4.anchorView?.plainView.bounds.height)!)
        FromMonth4.setupCornerRadius(10.0)
        FromMonth4.backgroundColor = UIColor.white
        FromMonth4.textColor = UIColor(hexString: "#717171")
        FromMonth4.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth4.layer.borderWidth = 1.0
        FromMonth4.direction = .bottom
        
        FromMonth4.show()
    }
    
    
    @IBAction func DropFromYear4Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear4.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear4.text = item
            self.FromYear4Value = item
            self.imgFromYear4.image = UIImage(named: "drop")
            self.lblToYear4.text = "Year"
            self.ToYear4Value = ""
            
        }
        self.FromYear4.anchorView = self.fromYear4View
        self.imgFromYear4.image = UIImage(named: "plus")
        self.FromYear4.dataSource = FromYear4Type
        self.FromYear4.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear4.bottomOffset = CGPoint(x: 0, y:(FromYear4.anchorView?.plainView.bounds.height)!)
        FromYear4.setupCornerRadius(10.0)
        FromYear4.backgroundColor = UIColor.white
        FromYear4.textColor = UIColor(hexString: "#717171")
        FromYear4.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear4.layer.borderWidth = 1.0
        FromYear4.direction = .bottom
        
        FromYear4.show()
    }
    
    @IBAction func dropToMonth4Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth4.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth4.text = "To - \(item)"
            self.ToMonth4Value = item
            self.imgToMonth4.image = UIImage(named: "drop")
            if self.ToMonth4Value == "Present" {
                self.toYear4View.isHidden = true
            }else{
                self.toYear4View.isHidden = false
            }
        }
        self.ToMonth4.anchorView = self.toMonth4View
        self.imgToMonth4.image = UIImage(named: "plus")
        self.ToMonth4.dataSource = ToMonth4Type
        self.ToMonth4.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth4.bottomOffset = CGPoint(x: 0, y:(ToMonth4.anchorView?.plainView.bounds.height)!)
        ToMonth4.setupCornerRadius(10.0)
        ToMonth4.backgroundColor = UIColor.white
        ToMonth4.textColor = UIColor(hexString: "#717171")
        ToMonth4.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth4.layer.borderWidth = 1.0
        ToMonth4.direction = .bottom
        
        ToMonth4.show()
    }
    
    @IBAction func dropToYear4Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear4.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear4Value != ""{
                let year2 = Int.getInt(self.FromYear4Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear4.text = "Year"
                        self.ToYear4Value = ""
                }else{
                    self.lblToYear4.text = item
                        self.ToYear4Value = item
                }
                }else{
                    self.lblToYear4.text = item
                        self.ToYear4Value = item
                }
            self.imgToYear4.image = UIImage(named: "drop")
            
        }
        self.ToYear4.anchorView = self.toYear4View
        self.imgToYear4.image = UIImage(named: "plus")
        self.ToYear4.dataSource = ToYear4Type
        self.ToYear4.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear4.bottomOffset = CGPoint(x: 0, y:(ToYear4.anchorView?.plainView.bounds.height)!)
        ToYear4.setupCornerRadius(10.0)
        ToYear4.backgroundColor = UIColor.white
        ToYear4.textColor = UIColor(hexString: "#717171")
        ToYear4.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear4.layer.borderWidth = 1.0
        ToYear4.direction = .bottom
        
        ToYear4.show()
    }
    
    @IBAction func DropFromMonth5Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth5.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth5.text = "From - \(item)"
            self.FromMonth5Value = item
            self.imgFromMonth5.image = UIImage(named: "drop")
        }
        self.FromMonth5.anchorView = self.fromMonth5View
        imgFromMonth5.image = UIImage(named: "plus")
        self.FromMonth5.dataSource = FromMonth5Type
        self.FromMonth5.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth5.bottomOffset = CGPoint(x: 0, y:(FromMonth5.anchorView?.plainView.bounds.height)!)
        FromMonth5.setupCornerRadius(10.0)
        FromMonth5.backgroundColor = UIColor.white
        FromMonth5.textColor = UIColor(hexString: "#717171")
        FromMonth5.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth5.layer.borderWidth = 1.0
        FromMonth5.direction = .bottom
        
        FromMonth5.show()
    }
    
    
    @IBAction func DropFromYear5Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear5.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear5.text = item
            self.FromYear5Value = item
            self.imgFromYear5.image = UIImage(named: "drop")
            self.lblToYear5.text = "Year"
            self.ToYear5Value = ""
            
        }
        self.FromYear5.anchorView = self.fromYear5View
        self.imgFromYear5.image = UIImage(named: "plus")
        self.FromYear5.dataSource = FromYear5Type
        self.FromYear5.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear5.bottomOffset = CGPoint(x: 0, y:(FromYear5.anchorView?.plainView.bounds.height)!)
        FromYear5.setupCornerRadius(10.0)
        FromYear5.backgroundColor = UIColor.white
        FromYear5.textColor = UIColor(hexString: "#717171")
        FromYear5.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear5.layer.borderWidth = 1.0
        FromYear5.direction = .bottom
        
        FromYear5.show()
    }
    
    @IBAction func dropToMonth5Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth5.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth5.text = "To - \(item)"
            self.ToMonth5Value = item
            self.imgToMonth5.image = UIImage(named: "drop")
            if self.ToMonth5Value == "Present" {
                self.toYear5View.isHidden = true
            }else{
                self.toYear5View.isHidden = false
            }
        }
        self.ToMonth5.anchorView = self.toMonth5View
        self.imgToMonth5.image = UIImage(named: "plus")
        self.ToMonth5.dataSource = ToMonth5Type
        self.ToMonth5.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth5.bottomOffset = CGPoint(x: 0, y:(ToMonth5.anchorView?.plainView.bounds.height)!)
        ToMonth5.setupCornerRadius(10.0)
        ToMonth5.backgroundColor = UIColor.white
        ToMonth5.textColor = UIColor(hexString: "#717171")
        ToMonth5.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth5.layer.borderWidth = 1.0
        ToMonth5.direction = .bottom
        
        ToMonth5.show()
    }
    
    @IBAction func dropToYear5Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear5.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear5Value != ""{
                let year2 = Int.getInt(self.FromYear5Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear5.text = "Year"
                        self.ToYear5Value = ""
                }else{
                    self.lblToYear5.text = item
                        self.ToYear5Value = item
                }
                }else{
                    self.lblToYear5.text = item
                        self.ToYear5Value = item
                }
            self.imgToYear5.image = UIImage(named: "drop")
            
        }
        self.ToYear5.anchorView = self.toYear5View
        self.imgToYear5.image = UIImage(named: "plus")
        self.ToYear5.dataSource = ToYear5Type
        self.ToYear5.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear5.bottomOffset = CGPoint(x: 0, y:(ToYear5.anchorView?.plainView.bounds.height)!)
        ToYear5.setupCornerRadius(10.0)
        ToYear5.backgroundColor = UIColor.white
        ToYear5.textColor = UIColor(hexString: "#717171")
        ToYear5.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear5.layer.borderWidth = 1.0
        ToYear5.direction = .bottom
        
        ToYear5.show()
    }
    
    @IBAction func DropFromMonth6Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth6.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth6.text = "From - \(item)"
            self.FromMonth6Value = item
            self.imgFromMonth6.image = UIImage(named: "drop")
        }
        self.FromMonth6.anchorView = self.fromMonth6View
        imgFromMonth6.image = UIImage(named: "plus")
        self.FromMonth6.dataSource = FromMonth6Type
        self.FromMonth6.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth6.bottomOffset = CGPoint(x: 0, y:(FromMonth6.anchorView?.plainView.bounds.height)!)
        FromMonth6.setupCornerRadius(10.0)
        FromMonth6.backgroundColor = UIColor.white
        FromMonth6.textColor = UIColor(hexString: "#717171")
        FromMonth6.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth6.layer.borderWidth = 1.0
        FromMonth6.direction = .bottom
        
        FromMonth6.show()
    }
    
    
    @IBAction func DropFromYear6Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear6.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear6.text = item
            self.FromYear6Value = item
            self.imgFromYear6.image = UIImage(named: "drop")
            self.lblToYear6.text = "Year"
            self.ToYear6Value = ""
            
        }
        self.FromYear6.anchorView = self.fromYear6View
        self.imgFromYear6.image = UIImage(named: "plus")
        self.FromYear6.dataSource = FromYear6Type
        self.FromYear6.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear6.bottomOffset = CGPoint(x: 0, y:(FromYear6.anchorView?.plainView.bounds.height)!)
        FromYear6.setupCornerRadius(10.0)
        FromYear6.backgroundColor = UIColor.white
        FromYear6.textColor = UIColor(hexString: "#717171")
        FromYear6.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear6.layer.borderWidth = 1.0
        FromYear6.direction = .bottom
        
        FromYear6.show()
    }
    
    @IBAction func dropToMonth6Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth6.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth6.text = "To - \(item)"
            self.ToMonth6Value = item
            self.imgToMonth6.image = UIImage(named: "drop")
            if self.ToMonth6Value == "Present" {
                self.toYear6View.isHidden = true
            }else{
                self.toYear6View.isHidden = false
            }
        }
        self.ToMonth6.anchorView = self.toMonth6View
        self.imgToMonth6.image = UIImage(named: "plus")
        self.ToMonth6.dataSource = ToMonth6Type
        self.ToMonth6.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth6.bottomOffset = CGPoint(x: 0, y:(ToMonth6.anchorView?.plainView.bounds.height)!)
        ToMonth6.setupCornerRadius(10.0)
        ToMonth6.backgroundColor = UIColor.white
        ToMonth6.textColor = UIColor(hexString: "#717171")
        ToMonth6.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth6.layer.borderWidth = 1.0
        ToMonth6.direction = .bottom
        
        ToMonth6.show()
    }
    
    @IBAction func dropToYear6Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear6.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear6Value != ""{
                let year2 = Int.getInt(self.FromYear6Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear6.text = "Year"
                        self.ToYear6Value = ""
                }else{
                    self.lblToYear6.text = item
                        self.ToYear6Value = item
                }
                }else{
                    self.lblToYear6.text = item
                        self.ToYear6Value = item
                }
            self.imgToYear6.image = UIImage(named: "drop")
            
        }
        self.ToYear6.anchorView = self.toYear6View
        self.imgToYear6.image = UIImage(named: "plus")
        self.ToYear6.dataSource = ToYear6Type
        self.ToYear6.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear6.bottomOffset = CGPoint(x: 0, y:(ToYear6.anchorView?.plainView.bounds.height)!)
        ToYear6.setupCornerRadius(10.0)
        ToYear6.backgroundColor = UIColor.white
        ToYear6.textColor = UIColor(hexString: "#717171")
        ToYear6.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear6.layer.borderWidth = 1.0
        ToYear6.direction = .bottom
        
        ToYear6.show()
    }
    
    @IBAction func DropFromMonth7Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth7.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth7.text = "From - \(item)"
            self.FromMonth7Value = item
            self.imgFromMonth7.image = UIImage(named: "drop")
        }
        self.FromMonth7.anchorView = self.fromMonth7View
        imgFromMonth7.image = UIImage(named: "plus")
        self.FromMonth7.dataSource = FromMonth7Type
        self.FromMonth7.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth7.bottomOffset = CGPoint(x: 0, y:(FromMonth7.anchorView?.plainView.bounds.height)!)
        FromMonth7.setupCornerRadius(10.0)
        FromMonth7.backgroundColor = UIColor.white
        FromMonth7.textColor = UIColor(hexString: "#717171")
        FromMonth7.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth7.layer.borderWidth = 1.0
        FromMonth7.direction = .bottom
        
        FromMonth7.show()
    }
    
    
    @IBAction func DropFromYear7Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear7.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear7.text = item
            self.FromYear7Value = item
            self.imgFromYear7.image = UIImage(named: "drop")
            self.lblToYear7.text = "Year"
            self.ToYear7Value = ""
            
        }
        self.FromYear7.anchorView = self.fromYear7View
        self.imgFromYear7.image = UIImage(named: "plus")
        self.FromYear7.dataSource = FromYear7Type
        self.FromYear7.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear7.bottomOffset = CGPoint(x: 0, y:(FromYear7.anchorView?.plainView.bounds.height)!)
        FromYear7.setupCornerRadius(10.0)
        FromYear7.backgroundColor = UIColor.white
        FromYear7.textColor = UIColor(hexString: "#717171")
        FromYear7.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear7.layer.borderWidth = 1.0
        FromYear7.direction = .bottom
        
        FromYear7.show()
    }
    
    @IBAction func dropToMonth7Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth7.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth7.text = "To - \(item)"
            self.ToMonth7Value = item
            self.imgToMonth7.image = UIImage(named: "drop")
            if self.ToMonth7Value == "Present" {
                self.toYear7View.isHidden = true
            }else{
                self.toYear7View.isHidden = false
            }
        }
        self.ToMonth7.anchorView = self.toMonth7View
        self.imgToMonth7.image = UIImage(named: "plus")
        self.ToMonth7.dataSource = ToMonth7Type
        self.ToMonth7.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth7.bottomOffset = CGPoint(x: 0, y:(ToMonth7.anchorView?.plainView.bounds.height)!)
        ToMonth7.setupCornerRadius(10.0)
        ToMonth7.backgroundColor = UIColor.white
        ToMonth7.textColor = UIColor(hexString: "#717171")
        ToMonth7.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth7.layer.borderWidth = 1.0
        ToMonth7.direction = .bottom
        
        ToMonth7.show()
    }
    
    @IBAction func dropToYear7Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear7.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear7Value != ""{
                let year2 = Int.getInt(self.FromYear7Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear7.text = "Year"
                        self.ToYear7Value = ""
                }else{
                    self.lblToYear7.text = item
                        self.ToYear7Value = item
                }
                }else{
                    self.lblToYear7.text = item
                        self.ToYear7Value = item
                }
            self.imgToYear7.image = UIImage(named: "drop")
            
        }
        self.ToYear7.anchorView = self.toYear7View
        self.imgToYear7.image = UIImage(named: "plus")
        self.ToYear7.dataSource = ToYear7Type
        self.ToYear7.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear7.bottomOffset = CGPoint(x: 0, y:(ToYear7.anchorView?.plainView.bounds.height)!)
        ToYear7.setupCornerRadius(10.0)
        ToYear7.backgroundColor = UIColor.white
        ToYear7.textColor = UIColor(hexString: "#717171")
        ToYear7.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear7.layer.borderWidth = 1.0
        ToYear7.direction = .bottom
        
        ToYear7.show()
    }
    
    @IBAction func DropFromMonth8Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth8.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth8.text = "From - \(item)"
            self.FromMonth8Value = item
            self.imgFromMonth8.image = UIImage(named: "drop")
        }
        self.FromMonth8.anchorView = self.fromMonth8View
        imgFromMonth8.image = UIImage(named: "plus")
        self.FromMonth8.dataSource = FromMonth8Type
        self.FromMonth8.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth8.bottomOffset = CGPoint(x: 0, y:(FromMonth8.anchorView?.plainView.bounds.height)!)
        FromMonth8.setupCornerRadius(10.0)
        FromMonth8.backgroundColor = UIColor.white
        FromMonth8.textColor = UIColor(hexString: "#717171")
        FromMonth8.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth8.layer.borderWidth = 1.0
        FromMonth8.direction = .bottom
        
        FromMonth8.show()
    }
    
    
    @IBAction func DropFromYear8Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear8.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear8.text = item
            self.FromYear8Value = item
            self.imgFromYear8.image = UIImage(named: "drop")
            self.lblToYear8.text = "Year"
            self.ToYear8Value = ""
            
        }
        self.FromYear8.anchorView = self.fromYear8View
        self.imgFromYear8.image = UIImage(named: "plus")
        self.FromYear8.dataSource = FromYear8Type
        self.FromYear8.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear8.bottomOffset = CGPoint(x: 0, y:(FromYear8.anchorView?.plainView.bounds.height)!)
        FromYear8.setupCornerRadius(10.0)
        FromYear8.backgroundColor = UIColor.white
        FromYear8.textColor = UIColor(hexString: "#717171")
        FromYear8.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear8.layer.borderWidth = 1.0
        FromYear8.direction = .bottom
        
        FromYear8.show()
    }
    
    @IBAction func dropToMonth8Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth8.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth8.text = "To - \(item)"
            self.ToMonth8Value = item
            self.imgToMonth8.image = UIImage(named: "drop")
            if self.ToMonth8Value == "Present" {
                self.toYear8View.isHidden = true
            }else{
                self.toYear8View.isHidden = false
            }
        }
        self.ToMonth8.anchorView = self.toMonth8View
        self.imgToMonth8.image = UIImage(named: "plus")
        self.ToMonth8.dataSource = ToMonth8Type
        self.ToMonth8.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth8.bottomOffset = CGPoint(x: 0, y:(ToMonth8.anchorView?.plainView.bounds.height)!)
        ToMonth8.setupCornerRadius(10.0)
        ToMonth8.backgroundColor = UIColor.white
        ToMonth8.textColor = UIColor(hexString: "#717171")
        ToMonth8.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth8.layer.borderWidth = 1.0
        ToMonth8.direction = .bottom
        
        ToMonth8.show()
    }
    
    @IBAction func dropToYear8Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear8.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear8Value != ""{
                let year2 = Int.getInt(self.FromYear8Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear8.text = "Year"
                        self.ToYear8Value = ""
                }else{
                    self.lblToYear8.text = item
                        self.ToYear8Value = item
                }
                }else{
                    self.lblToYear8.text = item
                        self.ToYear8Value = item
                }
            self.imgToYear8.image = UIImage(named: "drop")
            
        }
        self.ToYear8.anchorView = self.toYear8View
        self.imgToYear8.image = UIImage(named: "plus")
        self.ToYear8.dataSource = ToYear8Type
        self.ToYear8.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear8.bottomOffset = CGPoint(x: 0, y:(ToYear8.anchorView?.plainView.bounds.height)!)
        ToYear8.setupCornerRadius(10.0)
        ToYear8.backgroundColor = UIColor.white
        ToYear8.textColor = UIColor(hexString: "#717171")
        ToYear8.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear8.layer.borderWidth = 1.0
        ToYear8.direction = .bottom
        
        ToYear8.show()
    }
    
    @IBAction func DropFromMonth9Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth9.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth9.text = "From - \(item)"
            self.FromMonth9Value = item
            self.imgFromMonth9.image = UIImage(named: "drop")
        }
        self.FromMonth9.anchorView = self.fromMonth9View
        imgFromMonth9.image = UIImage(named: "plus")
        self.FromMonth9.dataSource = FromMonth9Type
        self.FromMonth9.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth9.bottomOffset = CGPoint(x: 0, y:(FromMonth9.anchorView?.plainView.bounds.height)!)
        FromMonth9.setupCornerRadius(10.0)
        FromMonth9.backgroundColor = UIColor.white
        FromMonth9.textColor = UIColor(hexString: "#717171")
        FromMonth9.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth9.layer.borderWidth = 1.0
        FromMonth9.direction = .bottom
        
        FromMonth9.show()
    }
    
    
    @IBAction func DropFromYear9Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear9.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear9.text = item
            self.FromYear9Value = item
            self.imgFromYear9.image = UIImage(named: "drop")
            self.lblToYear9.text = "Year"
            self.ToYear9Value = ""
            
        }
        self.FromYear9.anchorView = self.fromYear9View
        self.imgFromYear9.image = UIImage(named: "plus")
        self.FromYear9.dataSource = FromYear9Type
        self.FromYear9.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear9.bottomOffset = CGPoint(x: 0, y:(FromYear9.anchorView?.plainView.bounds.height)!)
        FromYear9.setupCornerRadius(10.0)
        FromYear9.backgroundColor = UIColor.white
        FromYear9.textColor = UIColor(hexString: "#717171")
        FromYear9.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear9.layer.borderWidth = 1.0
        FromYear9.direction = .bottom
        
        FromYear9.show()
    }
    
    @IBAction func dropToMonth9Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth9.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth9.text = "To - \(item)"
            self.ToMonth9Value = item
            self.imgToMonth9.image = UIImage(named: "drop")
            if self.ToMonth9Value == "Present" {
                self.toYear9View.isHidden = true
            }else{
                self.toYear9View.isHidden = false
            }
        }
        self.ToMonth9.anchorView = self.toMonth9View
        self.imgToMonth9.image = UIImage(named: "plus")
        self.ToMonth9.dataSource = ToMonth9Type
        self.ToMonth9.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth9.bottomOffset = CGPoint(x: 0, y:(ToMonth9.anchorView?.plainView.bounds.height)!)
        ToMonth9.setupCornerRadius(10.0)
        ToMonth9.backgroundColor = UIColor.white
        ToMonth9.textColor = UIColor(hexString: "#717171")
        ToMonth9.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth9.layer.borderWidth = 1.0
        ToMonth9.direction = .bottom
        
        ToMonth9.show()
    }
    
    @IBAction func dropToYear9Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear9.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear9Value != ""{
                let year2 = Int.getInt(self.FromYear9Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear9.text = "Year"
                        self.ToYear9Value = ""
                }else{
                    self.lblToYear9.text = item
                        self.ToYear9Value = item
                }
                }else{
                    self.lblToYear9.text = item
                        self.ToYear9Value = item
                }
            self.imgToYear9.image = UIImage(named: "drop")
            
        }
        self.ToYear9.anchorView = self.toYear9View
        self.imgToYear9.image = UIImage(named: "plus")
        self.ToYear9.dataSource = ToYear9Type
        self.ToYear9.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear9.bottomOffset = CGPoint(x: 0, y:(ToYear9.anchorView?.plainView.bounds.height)!)
        ToYear9.setupCornerRadius(10.0)
        ToYear9.backgroundColor = UIColor.white
        ToYear9.textColor = UIColor(hexString: "#717171")
        ToYear9.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear9.layer.borderWidth = 1.0
        ToYear9.direction = .bottom
        
        ToYear9.show()
    }
    
    @IBAction func DropFromMonth10Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromMonth10.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromMonth10.text = "From - \(item)"
            self.FromMonth10Value = item
            self.imgFromMonth10.image = UIImage(named: "drop")
        }
        self.FromMonth10.anchorView = self.fromMonth10View
        imgFromMonth10.image = UIImage(named: "plus")
        self.FromMonth10.dataSource = FromMonth10Type
        self.FromMonth10.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromMonth10.bottomOffset = CGPoint(x: 0, y:(FromMonth10.anchorView?.plainView.bounds.height)!)
        FromMonth10.setupCornerRadius(10.0)
        FromMonth10.backgroundColor = UIColor.white
        FromMonth10.textColor = UIColor(hexString: "#717171")
        FromMonth10.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromMonth10.layer.borderWidth = 1.0
        FromMonth10.direction = .bottom
        
        FromMonth10.show()
    }
    
    
    @IBAction func DropFromYear10Clicked(_ sender: UIButton) {
        view.endEditing(true)
        FromYear10.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblFromYear10.text = item
            self.FromYear10Value = item
            self.imgFromYear10.image = UIImage(named: "drop")
            self.lblToYear10.text = "Year"
            self.ToYear10Value = ""
            
        }
        self.FromYear10.anchorView = self.fromYear10View
        self.imgFromYear10.image = UIImage(named: "plus")
        self.FromYear10.dataSource = FromYear10Type
        self.FromYear10.cellConfiguration = { (index, item) in return "\(item)" }
        
        FromYear10.bottomOffset = CGPoint(x: 0, y:(FromYear10.anchorView?.plainView.bounds.height)!)
        FromYear10.setupCornerRadius(10.0)
        FromYear10.backgroundColor = UIColor.white
        FromYear10.textColor = UIColor(hexString: "#717171")
        FromYear10.layer.borderColor = UIColor(hexString: "#717171").cgColor
        FromYear10.layer.borderWidth = 1.0
        FromYear10.direction = .bottom
        
        FromYear10.show()
    }
    
    @IBAction func dropToMonth10Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToMonth10.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
        self.lblToMonth10.text = "To - \(item)"
            self.ToMonth10Value = item
            self.imgToMonth10.image = UIImage(named: "drop")
            if self.ToMonth10Value == "Present" {
                self.toYear10View.isHidden = true
            }else{
                self.toYear10View.isHidden = false
            }
        }
        self.ToMonth10.anchorView = self.toMonth10View
        self.imgToMonth10.image = UIImage(named: "plus")
        self.ToMonth10.dataSource = ToMonth10Type
        self.ToMonth10.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToMonth10.bottomOffset = CGPoint(x: 0, y:(ToMonth10.anchorView?.plainView.bounds.height)!)
        ToMonth10.setupCornerRadius(10.0)
        ToMonth10.backgroundColor = UIColor.white
        ToMonth10.textColor = UIColor(hexString: "#717171")
        ToMonth10.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToMonth10.layer.borderWidth = 1.0
        ToMonth10.direction = .bottom
        
        ToMonth10.show()
    }
    
    @IBAction func dropToYear10Clicked(_ sender: UIButton) {
        view.endEditing(true)
        ToYear10.selectionAction = { (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
            if self.FromYear10Value != ""{
                let year2 = Int.getInt(self.FromYear10Value)
                if year2 > Int.getInt(item) {
                    self.lblToYear10.text = "Year"
                        self.ToYear10Value = ""
                }else{
                    self.lblToYear10.text = item
                        self.ToYear10Value = item
                }
                }else{
                    self.lblToYear10.text = item
                        self.ToYear10Value = item
                }
            self.imgToYear10.image = UIImage(named: "drop")
            
        }
        self.ToYear10.anchorView = self.toYear10View
        self.imgToYear10.image = UIImage(named: "plus")
        self.ToYear10.dataSource = ToYear10Type
        self.ToYear10.cellConfiguration = { (index, item) in return "\(item)" }
        
        ToYear10.bottomOffset = CGPoint(x: 0, y:(ToYear10.anchorView?.plainView.bounds.height)!)
        ToYear10.setupCornerRadius(10.0)
        ToYear10.backgroundColor = UIColor.white
        ToYear10.textColor = UIColor(hexString: "#717171")
        ToYear10.layer.borderColor = UIColor(hexString: "#717171").cgColor
        ToYear10.layer.borderWidth = 1.0
        ToYear10.direction = .bottom
        
        ToYear10.show()
    }
}
