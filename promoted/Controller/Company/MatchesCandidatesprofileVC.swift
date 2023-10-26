//
//  MatchesCandidatesprofileVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 14/12/22.
//

import UIKit
import Foundation
import AVKit
import AVFoundation
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MatchesCandidatesprofileVC: BaseViewController{
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    
    @IBOutlet weak var btnSchedule: UIButton!
    
    
    @IBOutlet weak var backbtntop: NSLayoutConstraint!
    
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var View1: UIView!
    
    @IBOutlet weak var lblJob1: UILabel!
    @IBOutlet weak var lblJob2: UILabel!
    @IBOutlet weak var lblJob3: UILabel!
    
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var View4: UIView!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    var Id = String()
    var ExpListArr = [experinceModal]()
    var videolink = String()
    var portfoliolink = String()
    var profile = String()
    var jobid = Int()
    var percent = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.btnSchedule.isHidden = true
        self.btnSchedule.isUserInteractionEnabled = false
        self.backbtntop.constant = 5.0
        
        cardView.layer.cornerRadius = 10.0
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
        View1.layer.cornerRadius = 10.0
        View2.layer.cornerRadius = 10.0
        View3.layer.cornerRadius = 10.0
        View4.layer.cornerRadius = 10.0
        imgProfile.layer.cornerRadius = 10.0

        btnBack.layer.cornerRadius = 10.0
        btnSchedule.layer.cornerRadius = 10.0
        
        getShortListedCandidateDetailAPI()
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func reviewClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
        }
        
    }
    
    @IBAction func portfolioClicked(_ sender: UIButton) {
        
        if portfoliolink != "" {
//            let webview = WKWebView(frame: UIScreen.main.bounds)
//            view.addSubview(webview)
//
//            webview.navigationDelegate = self
//            guard let pdfURL = URL(string: portfoliolink ) else { return  }
//            webview.load(URLRequest(url: pdfURL))
            
            guard let pdfURL = URL(string: portfoliolink ) else { return  }
            UIApplication.shared.open(pdfURL)
            
        }
    }
    
    
    @IBAction func scheduleButtonClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchCandidateScheduleVC") as? MatchCandidateScheduleVC
        vc?.Id = Id
        vc?.profile = profile
        vc?.name = lblName.text!
        vc?.jobTitle = lblJob.text!
        vc?.contact = lblContact.text!
        vc?.jobid = jobid
        vc?.percent = percent
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    func getShortListedCandidateDetailAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["user_id":"\(Id)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getCandidateDetail, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let data = kSharedInstance.getDictionary(dictResult["data"])
                    let datashow = kSharedInstance.getArray(withDictionary: data["experience_details"])
//                    let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                    print(data)
                    print(datashow)
                    let otherdetails = kSharedInstance.getDictionary(data["other_details"])
                    let imageurl = String.getString(otherdetails["profile_image"])
                    self.profile = String.getString(otherdetails["profile_image"])
                    print(imageurl)
                    let url = URL(string: "\(imageurl.removeWhitespace())")

                    self.imgProfile.kf.setImage(with: url)
                    //self.imgProfile.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                    self.lblName.text = String.getString(otherdetails["first_name"])
                    let interview_scheduled = Int.getInt(otherdetails["interview_scheduled"])
                    if interview_scheduled == 1 {
                        self.btnSchedule.isHidden = true
                        self.btnSchedule.isUserInteractionEnabled = false
                        self.backbtntop.constant = 5.0
                    }else{
                        
                        self.btnSchedule.isHidden = false
                        self.btnSchedule.isUserInteractionEnabled = true
                        self.backbtntop.constant = 93.0
                    }
                    
                    let position = String.getString(otherdetails["position"])
                    
                    self.lblJob.text = position
                    self.lblContact.text = "\(String.getString(otherdetails["email"])) |  \(String.getString(otherdetails["phone"]))"
                    self.lblEmail.text = String.getString(otherdetails["email"])
                    self.lblPhone.text = String.getString(otherdetails["phone"])
                    self.lblLocation.text = String.getString(otherdetails["city"])
                    self.videolink = String.getString(otherdetails["video"])
                    self.portfoliolink = String.getString(otherdetails["portfolio"])
                    
                    let jobtype = String.getString(otherdetails["job_type"])
                    let jobtypeArr = jobtype.components(separatedBy: ",")

                    var jobString = String()
                        let firstjobtype: String = jobtypeArr[0]
                        if firstjobtype == "1"{
                            jobString = "Part-Time"
                        }else if firstjobtype == "2"{
                            jobString = "Full-Time"
                        }else if firstjobtype == "3"{
                            jobString = "Contract"
                        }else if firstjobtype == "4"{
                            jobString = "Casual"
                        }else if firstjobtype == "5"{
                            jobString = "Full-Time"
                        }
                    
                    
                    self.ExpListArr.removeAll()
                    self.ExpListArr = datashow.map{experinceModal(data: $0)}
                    if self.ExpListArr.count != 0 {
                        for i in 0...self.ExpListArr.count-1 {
                            let obj = self.ExpListArr[i]
                            let jobrole = obj.job_role
                            if jobrole == "" && i == 0 {
                                self.lblJob1.text = ""
                                self.lblJob2.text = ""
                                self.lblJob3.text = ""
                                return
                            }else if jobrole == "" && i != 0{
                                let object = self.ExpListArr[i-1]
                                self.lblJob1.text = object.job_role
                                self.lblJob2.text = jobString
                                self.lblJob3.text = object.company_name
                                return
                            }else{
                                self.lblJob1.text = obj.job_role
                                self.lblJob2.text = jobString
                                self.lblJob3.text = obj.company_name
                                return
                            }
                        }
                    }else{
                        self.lblJob1.text = ""
                        self.lblJob2.text = ""
                        self.lblJob3.text = ""
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
