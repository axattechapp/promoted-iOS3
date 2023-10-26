//
//  userPortfolioUpgradeVC.swift
//  Promoted
//
//  Created by Vikram Sindhu on 09/03/23.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class userPortfolioUpgradeVC: BaseViewController2{
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    @IBOutlet weak var portView:UIView!
    @IBOutlet weak var lblPortfolio: UILabel!
    @IBOutlet weak var imgPortfolio: UIImageView!
    @IBOutlet weak var lblUpgrade: UILabel!
    @IBOutlet weak var btnPortUpload: UIButton!
    @IBOutlet weak var portPriceLbl:UILabel!
    
    @IBOutlet weak var videoView:UIView!
    @IBOutlet weak var lblVideo: UILabel!
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblUpgrade2: UILabel!
    @IBOutlet weak var btnVideoUpload: UIButton!
    @IBOutlet weak var videoPriceLbl:UILabel!
    
    
    var videoFlag = Int()
    var PortFlag = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveBtn.layer.cornerRadius = 10.0
        
        portView.layer.cornerRadius = 10.0
        // shadow
        portView.layer.shadowColor = UIColor.lightGray.cgColor
        portView.layer.shadowOffset = CGSize(width: 3, height: 3)
        portView.layer.shadowOpacity = 0.3
        portView.layer.shadowRadius = 4.0
        
        videoView.layer.cornerRadius = 10.0
        videoView.layer.shadowColor = UIColor.lightGray.cgColor
        videoView.layer.shadowOffset = CGSize(width: 3, height: 3)
        videoView.layer.shadowOpacity = 0.3
        videoView.layer.shadowRadius = 4.0
        videoFlag = 0
        PortFlag = 0
        
        portView.isUserInteractionEnabled = true
        videoView.isUserInteractionEnabled = true
        let tap1: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(didTapsetPass))
        videoView.addGestureRecognizer(tap1)
        let tap2: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(didTapresetPass))
        portView.addGestureRecognizer(tap2)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let portFlag = UserDefaults.standard.bool(forKey: "portfolio")
        if portFlag == true
        {
            imgPortfolio.isHidden = true
        }else{
            imgPortfolio.isHidden = false
        }
        let VideoFlag = UserDefaults.standard.bool(forKey: "video")
        if VideoFlag == true
        {
            imgVideo.isHidden = true
        }else{
            imgVideo.isHidden = false
        }
        getUserProfileAPI()
        
    }
    
    @objc func didTapresetPass(sender: UITapGestureRecognizer)
    {
        let portFlag = UserDefaults.standard.bool(forKey: "portfolio")
        if portFlag == true
        {
            self.showSimpleAlert(message: "Portfolio unlocked already!")
            return
        }else{
            videoFlag = 0
            PortFlag = 1
            portView.layer.backgroundColor = UIColor.init(hexString: "#0D7280").cgColor
            imgPortfolio.image = UIImage(named: "lockWhite")
            lblPortfolio.textColor = UIColor.init(hexString: "#FFFFFF")
            lblUpgrade.textColor = UIColor.init(hexString: "#FFFFFF")
            portPriceLbl.textColor = UIColor.init(hexString: "#FFFFFF")
            btnPortUpload.setImage(UIImage(named: "uploadWhite"), for: .normal)
            
            
            videoView.layer.backgroundColor = UIColor.init(hexString: "#EDEDED").cgColor
            imgVideo.image = UIImage(named: "lock")
            lblVideo.textColor = UIColor.init(hexString: "#6C6C6C")
            lblUpgrade2.textColor = UIColor.init(hexString: "#6C6C6C")
            videoPriceLbl.textColor = UIColor.init(hexString: "#6C6C6C")
            btnVideoUpload.setImage(UIImage(named: "upload"), for: .normal)
        }
    }
    
    @objc func didTapsetPass(sender: UITapGestureRecognizer)
    {
        let VideoFlag = UserDefaults.standard.bool(forKey: "video")
        if VideoFlag == true
        {
            self.showSimpleAlert(message: "Video unlocked already!")
            return
        }else{
            videoFlag = 1
            PortFlag = 0
            portView.layer.backgroundColor = UIColor.init(hexString: "#EDEDED").cgColor
            imgPortfolio.image = UIImage(named: "lock")
            lblPortfolio.textColor = UIColor.init(hexString: "#6C6C6C")
            lblUpgrade.textColor = UIColor.init(hexString: "#6C6C6C")
            portPriceLbl.textColor = UIColor.init(hexString: "#6C6C6C")
            btnPortUpload.setImage(UIImage(named: "upload"), for: .normal)
            
            
            videoView.layer.backgroundColor = UIColor.init(hexString: "#0D7280").cgColor
            imgVideo.image = UIImage(named: "lockWhite")
            lblVideo.textColor = UIColor.init(hexString: "#FFFFFF")
            lblUpgrade2.textColor = UIColor.init(hexString: "#FFFFFF")
            videoPriceLbl.textColor = UIColor.init(hexString: "#FFFFFF")
            btnVideoUpload.setImage(UIImage(named: "uploadWhite"), for: .normal)
        }
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        if videoFlag == 0 && PortFlag == 0 {
            self.showSimpleAlert(message: "Please Select One Plan")
            return
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPaymentVC") as? userPaymentVC
            vc?.videoFlag = videoFlag
            vc?.PortFlag = PortFlag
            self.navigationController?.pushViewController(vc!, animated: false)
        }
        
        
    }
    
    @IBAction func portUploadClicked(_ sender: UIButton) {
        let portFlag = UserDefaults.standard.bool(forKey: "portfolio")
        if portFlag == true
        {
            self.showSimpleAlert(message: "Portfolio unlocked already!")
            return
        }else{
            videoFlag = 0
            PortFlag = 1
            portView.layer.backgroundColor = UIColor.init(hexString: "#0D7280").cgColor
            imgPortfolio.image = UIImage(named: "lockWhite")
            lblPortfolio.textColor = UIColor.init(hexString: "#FFFFFF")
            lblUpgrade.textColor = UIColor.init(hexString: "#FFFFFF")
            portPriceLbl.textColor = UIColor.init(hexString: "#FFFFFF")
            btnPortUpload.setImage(UIImage(named: "uploadWhite"), for: .normal)
            
            
            videoView.layer.backgroundColor = UIColor.init(hexString: "#EDEDED").cgColor
            imgVideo.image = UIImage(named: "lock")
            lblVideo.textColor = UIColor.init(hexString: "#6C6C6C")
            lblUpgrade2.textColor = UIColor.init(hexString: "#6C6C6C")
            videoPriceLbl.textColor = UIColor.init(hexString: "#6C6C6C")
            btnVideoUpload.setImage(UIImage(named: "upload"), for: .normal)
        }
        
    }
    
    @IBAction func videoUploadClicked(_ sender: UIButton) {
        let VideoFlag = UserDefaults.standard.bool(forKey: "video")
        if VideoFlag == true
        {
            self.showSimpleAlert(message: "Video unlocked already!")
            return
        }else{
            videoFlag = 1
            PortFlag = 0
            portView.layer.backgroundColor = UIColor.init(hexString: "#EDEDED").cgColor
            imgPortfolio.image = UIImage(named: "lock")
            lblPortfolio.textColor = UIColor.init(hexString: "#6C6C6C")
            lblUpgrade.textColor = UIColor.init(hexString: "#6C6C6C")
            portPriceLbl.textColor = UIColor.init(hexString: "#6C6C6C")
            btnPortUpload.setImage(UIImage(named: "upload"), for: .normal)
            
            
            videoView.layer.backgroundColor = UIColor.init(hexString: "#0D7280").cgColor
            imgVideo.image = UIImage(named: "lockWhite")
            lblVideo.textColor = UIColor.init(hexString: "#FFFFFF")
            lblUpgrade2.textColor = UIColor.init(hexString: "#FFFFFF")
            videoPriceLbl.textColor = UIColor.init(hexString: "#FFFFFF")
            btnVideoUpload.setImage(UIImage(named: "uploadWhite"), for: .normal)
            
        }
    }
    
    
    func getUserProfileAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.userProfile, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    if dictResult["status"] as! String == "FAIL"{
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    }else{
                        let data = kSharedInstance.getDictionary(dictResult["data"])
                        print(data)
                        
                        
                        if String.getString(data["portfolio"]) != ""{
                            UserDefaults.standard.setValue(true, forKey: "portfolio")
                            UserDefaults.standard.synchronize()
                            
                        }else{
                            if Int.getInt(data["portfolio_unlocked"]) == 1{
                                UserDefaults.standard.setValue(true, forKey: "portfolio")
                                UserDefaults.standard.synchronize()
                                
                            }else{
                                UserDefaults.standard.setValue(false, forKey: "portfolio")
                                UserDefaults.standard.synchronize()
                            }
                        }
                        
                        if String.getString(data["video"]) != ""{
                            UserDefaults.standard.setValue(true, forKey: "video")
                            UserDefaults.standard.synchronize()
                        }else{
                            
                            if Int.getInt(data["video_unlocked"]) == 1{
                                UserDefaults.standard.setValue(true, forKey: "video")
                                UserDefaults.standard.synchronize()
                                
                            }else{
                                UserDefaults.standard.setValue(false, forKey: "video")
                                UserDefaults.standard.synchronize()
                            }
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
