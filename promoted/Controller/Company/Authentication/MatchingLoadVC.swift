//
//  MatchingLoadVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 13/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MatchingLoadVC: UIViewController {
    
    @IBOutlet weak var imgMatch: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    var count = 0
    var timer = Timer()
    var jobid = Int()
    var signupFlag = Bool()
    var matchedArr = [homeScreenModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 12.0
        view2.layer.cornerRadius = 12.0
        view3.layer.cornerRadius = 12.0
        view4.layer.cornerRadius = 12.0
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        imgMatch.image = UIImage(named: "matching")
        updateView()
        scheduledTimerWithTimeInterval()
//        if signupFlag == true{
//            matchingScreenAPI()
//        }else{
            matchingScreenwithJobIDAPI()
//        }
        
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }

    @objc func updateCounting(){
       // NSLog("counting..")
        count += 1
        updateView()
    }
    
    func updateView(){
        
        if count == 0 || count == 4 {
            imgMatch.image = UIImage(named: "matching")
            view1.backgroundColor = UIColor(white: 1, alpha: 1.0)
            view2.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view3.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view4.backgroundColor = UIColor(white: 1, alpha: 0.2)
        }
        else if count == 1 || count == 5 {
            imgMatch.image = UIImage(named: "matching2")
            view1.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view2.backgroundColor = UIColor(white: 1, alpha: 1.0)
            view3.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view4.backgroundColor = UIColor(white: 1, alpha: 0.2)
        }
        else if count == 2 || count == 6 {
            imgMatch.image = UIImage(named: "matching3")
            view1.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view2.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view3.backgroundColor = UIColor(white: 1, alpha: 1.0)
            view4.backgroundColor = UIColor(white: 1, alpha: 0.2)
        }
        else if count == 3 || count == 7 {
            imgMatch.image = UIImage(named: "matching4")
            view1.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view2.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view3.backgroundColor = UIColor(white: 1, alpha: 0.2)
            view4.backgroundColor = UIColor(white: 1, alpha: 1.0)
        }
        else{
            timer.invalidate()
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchingDoneVC") as? MatchingDoneVC
//            self.navigationController?.pushViewController(vc!, animated: false)
            
        }
    }
    
    //candidateMatchingAlgo
    func matchingScreenAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: false)
        let params:[String:Any] = ["":""]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.candidateMatchingAlgo, requestMethod: .GET, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    //let data = kSharedInstance.getDictionary(dictResult["data"])
                    //let datashow = kSharedInstance.getArray(withDictionary: data["details"])
                    let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                    print(datashow)
                    self.matchedArr.removeAll()
                    self.matchedArr = datashow.map{homeScreenModal(data: $0)}
                    self.timer.invalidate()
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchingDoneVC") as? MatchingDoneVC
                    vc?.matchedArr = self.matchedArr
                    vc?.jobid = self.jobid
                    self.navigationController?.pushViewController(vc!, animated: false)

        
                default:
                
                    print("")
                    //Toast(text:String.getString(dictResult["message"])).show()
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
    
    
    func matchingScreenwithJobIDAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: false)
        let params:[String:Any] = ["job_listing_id":"\(jobid)"]
        
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
                        self.timer.invalidate()
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchingDoneVC") as? MatchingDoneVC
                        vc?.matchedArr = self.matchedArr
                        vc?.jobid = self.jobid
                        self.navigationController?.pushViewController(vc!, animated: false)
                    }
        
                default:
                    print("")
                    //Toast(text:String.getString(dictResult["message"])).show()
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
