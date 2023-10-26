//
//  userChatListVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class userChatListVC: BaseViewController2,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var listTbl: UITableView!
    
    var jobListArr = [userChatModal]()
    var userId =  String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        listTbl.delegate = self
        listTbl.dataSource = self
        userId = ""
        companyListingAPI()
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as! CompanyCell
        let obj = jobListArr[indexPath.row]
        cell.name!.text = obj.company_name
        let imageurl =  String.getString(obj.profile_image)
        //let url = URL(string: "\(imageurl)")

        //cell.userImg.kf.setImage(with: url)
        cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
        cell.companyDetail.text = "\(obj.name!), \(obj.city_state_postcode!)"
        cell.contact.text = "\(obj.email!) | \(obj.phone!)"
        
        cell.mainView.backgroundColor = .white
        cell.name.textColor = UIColor(hexString: "484848")
        cell.companyDetail.textColor = UIColor(hexString: "6C6C6C")
        cell.contact.textColor = UIColor(hexString: "6C6C6C")
        let msgcount = Int.getInt(obj.unread_messages)
        if msgcount == 0 {
            cell.countView.isHidden = true
            cell.count.text = ""
        }else{
            cell.countView.isHidden = false
            cell.count.text = "\(msgcount)"
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = jobListArr[indexPath.row]
        userId = "\(obj.user_id!)"
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userChatVC") as? userChatVC
        vc?.receiver_id = String.getString(userId)
        vc?.unread = "\(obj.unread_messages_ids!)"

        self.navigationController?.pushViewController(vc!, animated: false)
     
    }
    
    func companyListingAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getcompanylist, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        self.jobListArr = datashow.map{userChatModal(data: $0)}
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
    
    
}
