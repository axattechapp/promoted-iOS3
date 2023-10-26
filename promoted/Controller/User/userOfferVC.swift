//
//  userOfferVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit
import DropDown
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class userOfferVC: BaseViewController2, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var listTbl: UITableView!
    
    var jobListArr = [userInterViewModal]()
    var userId =  String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        listTbl.delegate = self
        listTbl.dataSource = self
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
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "IdealCandidateCell", for: indexPath) as! IdealCandidateCell
        let obj = jobListArr[indexPath.row]
        cell.name!.text = obj.position
        let imageurl =  String.getString(obj.profile_image)
        //let url = URL(string: "\(imageurl)")

        //cell.userImg.kf.setImage(with: url)
        cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
        cell.detail.text = "\(obj.company_name!), \(obj.city_state_postcode!)"
        if obj.company_email! == ""{
            
            if obj.phone! == ""{
                cell.date.text = ""
            }else{
                cell.date.text = "\(obj.phone!)"
            }
        }else{
            
            if obj.phone! == ""{
                cell.date.text = "\(obj.company_email!)"
            }else{
                cell.date.text = "\(obj.company_email!) | \(obj.phone!)"
            }
        }
        
        
        cell.mainView.backgroundColor = .white
        cell.name.textColor = UIColor(hexString: "484848")
        cell.detail.textColor = UIColor(hexString: "6C6C6C")
        cell.date.textColor = UIColor(hexString: "6C6C6C")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = jobListArr[indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OfferDetailVC") as? OfferDetailVC
        vc?.interview_id = "\(obj.interview_id!)"
        self.navigationController?.pushViewController(vc!, animated: false)
     
    }
    
//http://18.218.201.50/promoted/public/api/auth/jobseeker-shcheduled-interview
    
    func companyListingAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.interviewCompanyList, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        self.jobListArr = datashow.map{userInterViewModal(data: $0)}
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
