//
//  ChatListVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 19/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class ChatListVC: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var listTbl: UITableView!

    var ShortListArr = [ShortlistScreenModal]()
    var jobId =  Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            
        cell.mainView.backgroundColor = .white
            
        cell.name.textColor = UIColor(hexString: "484848")
            
        cell.match.textColor = UIColor(hexString: "484848")
            
        cell.position.textColor = UIColor(hexString: "6C6C6C")
            
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
        
        let obj = ShortListArr[indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatScreenVC") as? ChatScreenVC
        vc?.receiver_id = "\(obj.id!)"
        vc?.unread = "\(obj.unread_messages_ids!)"

        self.navigationController?.pushViewController(vc!, animated: false)
     
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
