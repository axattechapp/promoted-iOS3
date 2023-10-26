//
//  CandidateDetailVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 14/12/22.
//

import UIKit
import AVKit
import AVFoundation
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster
import MobileCoreServices
import UniformTypeIdentifiers

class CandidateDetailVC: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMatch: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var expTable: UITableView!
    
    @IBOutlet weak var tblConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var lblJobtype: UILabel!
    @IBOutlet weak var lblJob2: UILabel!
    @IBOutlet weak var lblSaleryTxt: UILabel!
    @IBOutlet weak var lblJob2Title: UILabel!
    @IBOutlet weak var lblContractLength: UILabel!
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var lblEducation: UILabel!
    
    
    @IBOutlet weak var accridationView1: UIView!
    @IBOutlet weak var accTitle1: UILabel!
    @IBOutlet weak var accIssuer1: UILabel!
    
    @IBOutlet weak var accridationView2: UIView!
    @IBOutlet weak var accTitle2: UILabel!
    @IBOutlet weak var accIssuer2: UILabel!
    
    @IBOutlet weak var accridationView3: UIView!
    @IBOutlet weak var accTitle3: UILabel!
    @IBOutlet weak var accIssuer3: UILabel!
    
    @IBOutlet weak var accridationView4: UIView!
    @IBOutlet weak var accTitle4: UILabel!
    @IBOutlet weak var accIssuer4: UILabel!
    
    @IBOutlet weak var accridationView5: UIView!
    @IBOutlet weak var accTitle5: UILabel!
    @IBOutlet weak var accIssuer5: UILabel!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var lblRelocate: UILabel!
    
    
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var lblWorkModel: UILabel!
    
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var lblNote: UILabel!
    
    
    var jobid = Int()
    var userId = Int()
    var percent = Int()
    var expListArr = [JobExpModal]()
    var videolink = String()
    var portfoliolink = String()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        expTable.delegate = self
        expTable.dataSource = self
        
        btnBack.layer.cornerRadius = 10.0
        scrollView.layer.cornerRadius = 10.0
        cardView.layer.cornerRadius = 30.0
        profileImg.layer.cornerRadius = 30.0
        view1.layer.cornerRadius = 10.0
        view2.layer.cornerRadius = 10.0
        
        view3.layer.cornerRadius = 10.0
        // shadow
        view3.layer.shadowColor = UIColor.black.cgColor
        view3.layer.shadowOffset = CGSize(width: 1, height: 3)
        view3.layer.shadowOpacity = 0.7
        view3.layer.shadowRadius = 4.0
        
        view4.layer.cornerRadius = 10.0
        // shadow
        view4.layer.shadowColor = UIColor.black.cgColor
        view4.layer.shadowOffset = CGSize(width: 1, height: 3)
        view4.layer.shadowOpacity = 0.7
        view4.layer.shadowRadius = 4.0
        
        view5.layer.cornerRadius = 10.0
        // shadow
        view5.layer.shadowColor = UIColor.black.cgColor
        view5.layer.shadowOffset = CGSize(width: 1, height: 3)
        view5.layer.shadowOpacity = 0.7
        view5.layer.shadowRadius = 4.0
        
        view6.layer.cornerRadius = 10.0
        // shadow
        view6.layer.shadowColor = UIColor.black.cgColor
        view6.layer.shadowOffset = CGSize(width: 1, height: 3)
        view6.layer.shadowOpacity = 0.7
        view6.layer.shadowRadius = 4.0
        
        view7.layer.cornerRadius = 10.0
        // shadow
        view7.layer.shadowColor = UIColor.black.cgColor
        view7.layer.shadowOffset = CGSize(width: 1, height: 3)
        view7.layer.shadowOpacity = 0.7
        view7.layer.shadowRadius = 4.0
        
        accridationView1.layer.cornerRadius = 10.0
        // shadow
        accridationView1.layer.shadowColor = UIColor.black.cgColor
        accridationView1.layer.shadowOffset = CGSize(width: 1, height: 3)
        accridationView1.layer.shadowOpacity = 0.7
        accridationView1.layer.shadowRadius = 4.0
        
        accridationView2.layer.cornerRadius = 10.0
        // shadow
        accridationView2.layer.shadowColor = UIColor.black.cgColor
        accridationView2.layer.shadowOffset = CGSize(width: 1, height: 3)
        accridationView2.layer.shadowOpacity = 0.7
        accridationView2.layer.shadowRadius = 4.0
        
        accridationView3.layer.cornerRadius = 10.0
        // shadow
        accridationView3.layer.shadowColor = UIColor.black.cgColor
        accridationView3.layer.shadowOffset = CGSize(width: 3, height: 3)
        accridationView3.layer.shadowOpacity = 0.7
        accridationView3.layer.shadowRadius = 4.0
        
        accridationView4.layer.cornerRadius = 10.0
        // shadow
        accridationView4.layer.shadowColor = UIColor.black.cgColor
        accridationView4.layer.shadowOffset = CGSize(width: 1, height: 3)
        accridationView4.layer.shadowOpacity = 0.7
        accridationView4.layer.shadowRadius = 4.0
        
        accridationView5.layer.cornerRadius = 10.0
        // shadow
        accridationView5.layer.shadowColor = UIColor.black.cgColor
        accridationView5.layer.shadowOffset = CGSize(width: 1, height: 3)
        accridationView5.layer.shadowOpacity = 0.7
        accridationView5.layer.shadowRadius = 4.0
        
        self.tblConstraint.constant = 0
        
        getMatchedCandidatedetailAPI()
    }
    
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)

    }
    
    
    @IBAction func videoClicked(_ sender: UIButton) {
        if videolink != ""{
            guard let videoURL = URL(string: videolink ) else { return  }
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }else{
            Toast(text:"No Video Available", duration: Delay.long).show()
        }
    }
    
    
    
    @IBAction func PortFolioClicked(_ sender: UIButton) {
        if portfoliolink != "" {
            guard let pdfURL = URL(string: portfoliolink ) else { return  }
            UIApplication.shared.open(pdfURL)
        }else{
            Toast(text:"No Portfolio Available", duration: Delay.long).show()
        }
    }
    
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        
        onSlideMenuButtonPressed(sender)
        
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = expTable.dequeueReusableCell(withIdentifier: "expCell", for: indexPath) as! expCell
        
        let obj = expListArr[indexPath.row]
        
        cell.lblJob.text = obj.job_role
        cell.lblCompany.text = obj.company_name
        if obj.experience_to_month == "Present"{
            cell.lblExp.text = "From - \(obj.experience_from_month!)\(obj.experience_from_year!) To - Present"
        }else{
            cell.lblExp.text = "From - \(obj.experience_from_month!) \(obj.experience_from_year!) To - \(obj.experience_to_month!) \(obj.experience_to_year!)"
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
     
    }
    
    
    func getMatchedCandidatedetailAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        let params:[String:Any] = [
            "user_id":"\(userId)",
            "job_listing_id":"\(jobid)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.matchedCandidateDetail,                                                   requestMethod: .POST,
                                                  requestParameters:params, withProgressHUD: false)
        {[weak self](result: Any?, error: Error?, errorType: ErrorType?, statusCode: Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        //experience_details
                        let datashow = kSharedInstance.getArray(withDictionary: data["experience_details"])
                        print(datashow)
                        //accreditation_details
                        let dataShow2 = kSharedInstance.getArray(withDictionary: data["accreditation_details"])
                        
                        //other_details
                        let other_details = kSharedInstance.getDictionary(data["other_details"])
                        print(other_details)
                        self!.videolink = String.getString(other_details["video"])
                        self!.portfoliolink = String.getString(other_details["portfolio"])
                        let imageurl = String.getString(other_details["profile_image"])
                        print(imageurl)
                        let url = URL(string: "\(imageurl.removeWhitespace())")
                        
                        self!.profileImg.kf.setImage(with: url)
                        //self!.profileImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                        self!.lblName.text = String.getString(other_details["first_name"])
                        //position
                        let position = String.getString(other_details["position"])
                        let positionArr = position.components(separatedBy: ",")
                        if positionArr.count > 1 {
                            self!.lblJob.text = String.getString(other_details["position"])
                        }else{
                            let firstposition: String = positionArr[0]
                            self!.lblJob.text = firstposition
                        }
                        
                        let salary = String.getString(other_details["salary"])
                        let salaryArr = salary.components(separatedBy: ",")
                        let firstsalary: String = salaryArr[0]
                        self!.lblSaleryTxt.text = firstsalary
                        
                        let contract_length = String.getString(other_details["contract_length"])
                        let contract_lengthArr = contract_length.components(separatedBy: ",")
                        let firstcontract_length: String = contract_lengthArr[0]
                        self!.lblContractLength.text = firstcontract_length
                        
                        //educational_level
                        let educat = String.getString(other_details["educational_level"])
                        
                        if educat == "1"{
                            self?.lblEducation.text = "High School"
                            self?.view4.isHidden = false
                        }else if educat == "2"{
                            self?.lblEducation.text = "Associate"
                            self?.view4.isHidden = false
                        }else if educat == "3"{
                            self?.lblEducation.text = "TAFE"
                            self?.view4.isHidden = false
                        }else if educat == "4"{
                            self?.lblEducation.text = "Bachelor"
                            self?.view4.isHidden = false
                        }else if educat == "5"{
                            self?.lblEducation.text = "Master"
                            self?.view4.isHidden = false
                        }else if educat == "6"{
                            self?.lblEducation.text = "Doctorate"
                            self?.view4.isHidden = false
                        }else {
                            self?.lblEducation.text = ""
                            self?.view4.isHidden = true
                        }
                        //willing_to_relocate
                        let relocate = String.getString(other_details["willing_to_relocate"])
                        
                        if relocate == "0"{
                            self?.lblRelocate.text = "No"
                        }else if relocate == "1"{
                            self?.lblRelocate.text = "Yes"
                        }else{
                            self?.lblRelocate.text = "Open to Discussion"
                        }
                        self?.lblNote.text = ""
                        
                        //work_model
                        let work_model = String.getString(other_details["work_model"])
                        
                        if work_model == "1"{
                            self?.lblWorkModel.text = "In House"
                        }else if work_model == "2"{
                            self?.lblWorkModel.text = "Remote"
                        }else if work_model == "3"{
                            self?.lblWorkModel.text = "Hybrid"
                        }else{
                            self?.lblWorkModel.text = "Open to Discussion"
                        }
                        
                        
                        let jobType = String.getString(other_details["job_type"])
                        let jobTypeArr = jobType.components(separatedBy: ",")
                        let firstjob: String = jobTypeArr[0]
                        if jobTypeArr.count > 1 {
                            let secjob: String = jobTypeArr[1]
                            if firstjob == "1"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Part-Time"
                                }else{
                                    self?.lblCompany.text = "Part-Time"
                                }
                                
                                self?.lblJobtype.text = "Part-Time"
                            }else if firstjob == "2"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Full-Time"
                                }else{
                                    self?.lblCompany.text = "Full-Time"
                                }
                                
                                self?.lblJobtype.text = "Full-Time"
                            }else if firstjob == "3"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Contract"
                                }else{
                                    self?.lblCompany.text = "Contract"
                                   
                                }
                                self?.lblJobtype.text = "Contract"
                            }else if firstjob == "4"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Casual"
                                }else{
                                    self?.lblCompany.text = "Casual"
                                }
                                
                                self?.lblJobtype.text = "Casual"
                            }else if firstjob == "5"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Temporary"
                                }else{
                                    self?.lblCompany.text = "Temporary"
                                }
                                
                                self?.lblJobtype.text = "Temporary"
                            }else{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"]))"
                                }else{
                                    self?.lblCompany.text = ""
                                }
                                
                                self?.lblJobtype.text = " "
                            }
                            
                            if secjob == "1"{
                                self?.lblJob2.text = "Part-Time"
                            }else if secjob == "2"{
                                self?.lblJob2.text = "Full-Time"
                            }else if secjob == "3"{
                                self?.lblJob2.text = "Contract"
                            }else if secjob == "4"{
                                self?.lblJob2.text = "Casual"
                            }else if secjob == "5"{
                                self?.lblJob2.text = "Temporary"
                            }else{
                                self?.lblJob2.text = " "
                            }
                        }else{
                            self?.lblJob2.text = " "
                            if firstjob == "1"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Part-Time"
                                }else{
                                    self?.lblCompany.text = "Part-Time"
                                }
                                
                                self?.lblJobtype.text = "Part-Time"
                            }else if firstjob == "2"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Full-Time"
                                }else{
                                    self?.lblCompany.text = "Full-Time"
                                }
                                
                                self?.lblJobtype.text = "Full-Time"
                            }else if firstjob == "3"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Contract"
                                }else{
                                    self?.lblCompany.text = "Contract"
                                }
                                
                                self?.lblJobtype.text = "Contract"
                            }else if firstjob == "4"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Casual"
                                }else{
                                    self?.lblCompany.text = "Casual"
                                }
                                
                                self?.lblJobtype.text = "Casual"
                            }else if firstjob == "5"{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"])) | Temporary"
                                }else{
                                    self?.lblCompany.text = "Temporary"
                                }
                                
                                self?.lblJobtype.text = "Temporary"
                            }else{
                                if String.getString(other_details["company_name"]) != ""{
                                    self?.lblCompany.text = "\(String.getString(other_details["company_name"]))"
                                }else{
                                    self?.lblCompany.text = ""
                                }
                                
                                self?.lblJobtype.text = " "
                            }
                        }
                        
                        
                        self?.lblContact.text = "\(String.getString(other_details["email"])) | \(String.getString(other_details["phone"]))"
                        self?.lblAddress.text = String.getString(other_details["city"])
                        
                        self?.lblMatch.text = "Profile match \(self?.percent ?? 0)%"
                        
                        
                        if dataShow2.count > 0 {
                            self!.topConstraint.constant = 9.0
                            let obj1 = dataShow2[0]
                            self!.accTitle1.text = (obj1["first_accreditation_title"] as! String)
                            self!.accIssuer1.text = (obj1["first_accreditation_issuer"] as! String)
                            if dataShow2.count > 1 {
                                self!.topConstraint.constant = 144.0
                                self!.accridationView2.isHidden = false
                                let obj2 = dataShow2[1]
                                self!.accTitle2.text = (obj2["second_accreditation_title"] as! String)
                                self!.accIssuer2.text = (obj2["second_accreditation_issuer"] as! String)
                                
                                if dataShow2.count > 2 {
                                    self!.topConstraint.constant = 279.0
                                    self!.accridationView3.isHidden = false
                                    let obj3 = dataShow2[2]
                                    self!.accTitle3.text = (obj3["third_accreditation_title"] as! String)
                                    self!.accIssuer3.text = (obj3["third_accreditation_issuer"] as! String)
                                    if dataShow2.count > 3 {
                                        self!.topConstraint.constant = 414.0
                                        self!.accridationView4.isHidden = false
                                        let obj4 = dataShow2[3]
                                        self!.accTitle4.text = (obj4["fourth_accreditation_title"] as! String)
                                        self!.accIssuer4.text = (obj4["fourth_accreditation_issuer"] as! String)
                                        
                                        if dataShow2.count > 4 {
                                            self!.topConstraint.constant = 549.0
                                            self!.accridationView5.isHidden = false
                                            let obj5 = dataShow2[4]
                                            self!.accTitle5.text = (obj5["fifth_accreditation_title"] as! String)
                                            self!.accIssuer5.text = (obj5["fifth_accreditation_issuer"] as! String)
                                        }else{
                                            self!.topConstraint.constant = 414.0
                                            self!.accridationView5.isHidden = true
                                        }
                                    }else{
                                        self!.topConstraint.constant = 279.0
                                        self!.accridationView4.isHidden = true
                                        self!.accridationView5.isHidden = true
                                    }
                                }else{
                                    self!.topConstraint.constant = 144.0
                                    self!.accridationView3.isHidden = true
                                    self!.accridationView4.isHidden = true
                                    self!.accridationView5.isHidden = true
                                }
                            }else{
                                self!.topConstraint.constant = 9.0
                                self!.accridationView2.isHidden = true
                                self!.accridationView3.isHidden = true
                                self!.accridationView4.isHidden = true
                                self!.accridationView5.isHidden = true
                            }
                        }else{
                            self!.accTitle1.text = ""
                            self!.accIssuer1.text = ""
                            self!.topConstraint.constant = 9.0
//                            self!.accridationView1.isHidden = true
                            self!.accridationView2.isHidden = true
                            self!.accridationView3.isHidden = true
                            self!.accridationView4.isHidden = true
                            self!.accridationView5.isHidden = true
                            
                        }
                        
                        self!.expListArr.removeAll()
                        self!.expListArr = datashow.map{JobExpModal(data: $0)}
                        self!.tblConstraint.constant = CGFloat(165*(self!.expListArr.count))
                        self!.expTable.reloadData()
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
