//
//  NotificationCandidateVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 19/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class NotificationCandidateVC: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var listTbl: UITableView!
    @IBOutlet weak var btnSelect: UIButton!
    
    var selectedItemsID = [String]()
    var ShortListArr = [ShortlistScreenModal]()
    var NotificationType =  String()
    var NotificationStatus = String()
    var Note = String()
    var jobId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnSelect.layer.cornerRadius = 10.0
        listTbl.delegate = self
        listTbl.dataSource = self
        getShortListedCandidateAPI()
        
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func selectClicked(_ sender: UIButton) {
        
        if selectedItemsID.count == 0 {
            let alert = UIAlertController(title: "Procruited", message: "Please Select A Candidate", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            CompanyToCandidateNotificationAPi()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShortListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "CandidateCell", for: indexPath) as! CandidateCell
        
        let obj = ShortListArr[indexPath.row]
        cell.name!.text = obj.first_name
        let imageurl =  String.getString(obj.profile_image)
        let url = URL(string: "\(imageurl.removeWhitespace())")

        cell.userImg.kf.setImage(with: url)
        //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
        cell.match.text = "Profile match \(obj.percentage!)%"
        cell.position.text = obj.position
        cell.contact.text = "\(obj.email!) | \(obj.phone!)"
        
        //if Id == "\(obj.id!)"
                                    
        if selectedItemsID.contains("\(obj.id!)"){
            cell.mainView.backgroundColor = UIColor(hexString: "0E7280")
            cell.name.textColor = .white
            cell.match.textColor = .white
            cell.position.textColor = .white
            cell.contact.textColor = .white
        }else{
            cell.mainView.backgroundColor = .white
            cell.name.textColor = UIColor(hexString: "484848")
            cell.match.textColor = UIColor(hexString: "484848")
            cell.position.textColor = UIColor(hexString: "6C6C6C")
            cell.contact.textColor = UIColor(hexString: "6C6C6C")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = ShortListArr[indexPath.row]
        if selectedItemsID.contains("\(obj.id!)"){
            if let index = selectedItemsID.firstIndex(of: String.getString(obj.id)) {
                selectedItemsID.remove(at: index)
            }
        }else{
            selectedItemsID.append(String.getString(obj.id))
        }
        listTbl.reloadData()

     
    }
    
    func CompanyToCandidateNotificationAPi(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        //type_of_notification,to,notes
        let params:[String:Any] = ["type_of_notification":NotificationType, "follow_candidates_status":NotificationStatus,"notes":Note, "to_candidate":(selectedItemsID.map{String($0)}).joined(separator: ",")]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.followUpNotification, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                let status = String.getString(dictResult["status"])
                
                if status == "SUCCESS"{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationSentVC") as? NotificationSentVC
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
    
    func getShortListedCandidateAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["job_listing_id":"\(jobId)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getShortlistCandidate, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        
                        self.ShortListArr.removeAll()
                        self.ShortListArr = datashow.map{ShortlistScreenModal(data: $0)}
                        
                        self.listTbl.reloadData()
                        if self.ShortListArr.count == 0 {
                            Toast(text:String.getString("No shortlisted candidates"), duration: Delay.long).show()
                        }
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
