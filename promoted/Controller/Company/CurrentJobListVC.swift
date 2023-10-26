//
//  CurrentJobListVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 03/05/23.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD


class CurrentJobListVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var listTbl: UITableView!
    
    var type = String()
    var jobListArr = [jobListingModal]()
    var jobId =  String()
    var matchedArr = [homeScreenModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        listTbl.delegate = self
        listTbl.dataSource = self
        
        jobId = ""
        jobListingAPI()
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listTbl.dequeueReusableCell(withIdentifier: "IdealCandidateCell", for: indexPath) as! IdealCandidateCell
        let obj = jobListArr[indexPath.row]
        cell.name!.text = obj.role
        let imageurl =  String.getString(obj.profile_image)
        //let url = URL(string: "\(imageurl)")

        //cell.userImg.kf.setImage(with: url)
        cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
        cell.detail.text = "\(obj.company_name!),\(obj.city_state_postcode!)"
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let start = formatter.string(from: date as Date)
           //let start = Date.getCurrentDate()
        let end = obj.created_at
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
           let startDate:Date = dateFormatter.date(from: start)! as Date
           let dateFormatter2 = DateFormatter()
        dateFormatter2.timeZone = TimeZone(secondsFromGMT: 0)
           dateFormatter2.dateFormat = "yyyy-MM-dd HH:mm:ss"
           let endDate:Date = dateFormatter2.date(from: end!)! as Date
           
        let NumOfDays: Int = daysBetweenDates(startDate: endDate as Date, endDate: startDate as Date)
//           NumOfDays += 1
        cell.date.text = "Posted \(NumOfDays) days ago"
        
            cell.mainView.backgroundColor = .white
            cell.name.textColor = UIColor(hexString: "484848")
            cell.detail.textColor = UIColor(hexString: "6C6C6C")
            cell.date.textColor = UIColor(hexString: "6C6C6C")

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = jobListArr[indexPath.row]
        jobId = "\(obj.job_listing_id!)"
        //self.listTbl.reloadData()
        if type == "Search"{
            matchingScreenwithJobIDAPI()
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchingLoadVC") as? MatchingLoadVC
//            vc?.jobid = Int.getInt(jobId)
//            vc?.signupFlag = false
//            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "candidateShortlistVC") as? candidateShortlistVC
            vc?.jobid = Int.getInt(jobId)
            vc?.JobTitle = obj.role ?? ""
            vc?.jobProfile = obj.profile_image ?? ""
            self.navigationController?.pushViewController(vc!, animated: false)
        }
        
    }
    
    func matchingScreenwithJobIDAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: false)
        let params:[String:Any] = ["job_listing_id":"\(jobId)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.candidateMatchingAlgobasedonjobid, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        self.matchedArr.removeAll()
                        self.matchedArr = datashow.map{homeScreenModal(data: $0)}
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateListVC") as? CandidateListVC
                        vc?.matchedArr = self.matchedArr
                        vc?.jobid = Int.getInt(self.jobId)
                        self.navigationController?.pushViewController(vc!, animated: false)
                        
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
    
    
    
    
    func jobListingAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getJobListing, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        
                        self.jobListArr.removeAll()
                        self.jobListArr = datashow.map{jobListingModal(data: $0)}
                        
                        self.listTbl.reloadData()
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
    
    func daysBetweenDates(startDate: Date, endDate: Date) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day!
    }
    
}
