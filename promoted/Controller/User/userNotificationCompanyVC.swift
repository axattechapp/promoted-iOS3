//
//  userNotificationCompanyVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class userNotificationCompanyVC: BaseViewController2,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var listTbl: UITableView!
    @IBOutlet weak var btnSelect: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    var jobListArr = [userNotiModal]()
    var NotificationType =  String()
    var NotificationStatus = String()
    var Note = String()
    var userId =  String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnSelect.layer.cornerRadius = 10.0
        btnBack.layer.cornerRadius = 10.0
        listTbl.delegate = self
        listTbl.dataSource = self
        userId = ""
        companyListingAPI()
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func selectClicked(_ sender: UIButton) {
        
        if userId == "" {
            let alert = UIAlertController(title: "Procruited", message: "Please Select A Company", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            CandidateToCompanyNotificationAPi()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "IdealCandidateCell", for: indexPath) as! IdealCandidateCell
        
        let obj = jobListArr[indexPath.row]
        cell.name!.text = obj.company_name
        let imageurl =  String.getString(obj.profile_image)
        //let url = URL(string: "\(imageurl)")

        //cell.userImg.kf.setImage(with: url)
        cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
        cell.detail.text = "\(obj.type!), \(obj.city_state_postcode!)"
        cell.date.text = "\(obj.email!) | \(obj.phone!)"
        
        cell.mainView.backgroundColor = .white
        cell.name.textColor = UIColor(hexString: "484848")
        cell.detail.textColor = UIColor(hexString: "6C6C6C")
        cell.date.textColor = UIColor(hexString: "6C6C6C")
        
        if userId == "\(obj.user_id!)"{
            cell.mainView.backgroundColor = UIColor(hexString: "0E7280")
            cell.name.textColor = .white
            cell.detail.textColor = .white
            cell.date.textColor = .white
        }else{
            cell.mainView.backgroundColor = .white
            cell.name.textColor = UIColor(hexString: "484848")
            cell.detail.textColor = UIColor(hexString: "6C6C6C")
            cell.date.textColor = UIColor(hexString: "6C6C6C")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = jobListArr[indexPath.row]
        userId = "\(obj.user_id!)"
        listTbl.reloadData()
     
    }
    
    func companyListingAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        //http://18.218.201.50/promoted/public/api/auth/jobseeker-side-notification-list
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getnotificationCompanyList, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    //let data = kSharedInstance.getDictionary(dictResult["data"])
                    //let datashow = kSharedInstance.getArray(withDictionary: data["details"])
                    let status = String.getString(dictResult["status"])
                    if status == "SUCCESS"{
                        let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                        print(datashow)
                        
                        self.jobListArr.removeAll()
                        self.jobListArr = datashow.map{userNotiModal(data: $0)}
                        self.listTbl.reloadData()
                        
                    }else{
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
    
    
    func CandidateToCompanyNotificationAPi(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        //type_of_notification,to,notes
        let params:[String:Any] = ["type_of_notification":NotificationType, "follow_candidates_status":NotificationStatus,"notes":Note, "to":userId]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.candidateNotification, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                let status = String.getString(dictResult["status"])
                
                if status == "SUCCESS"{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userNotificationSentVC") as? userNotificationSentVC
                    self.navigationController?.pushViewController(vc!, animated: false)
                }else{
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
