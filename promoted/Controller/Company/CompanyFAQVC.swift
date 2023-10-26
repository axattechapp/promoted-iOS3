//
//  CompanyFAQVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 20/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class CompanyFAQVC: BaseViewController{
    
    @IBOutlet weak var btnsupport: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view1Qus: UILabel!
    @IBOutlet weak var view1Ans: UILabel!
    @IBOutlet weak var view1Img: UIImageView!
    @IBOutlet weak var view1Height: NSLayoutConstraint!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view2Qus: UILabel!
    @IBOutlet weak var view2Ans: UILabel!
    @IBOutlet weak var view2Img: UIImageView!
    @IBOutlet weak var view2Height: NSLayoutConstraint!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view3Qus: UILabel!
    @IBOutlet weak var view3Ans: UILabel!
    @IBOutlet weak var view3Img: UIImageView!
    @IBOutlet weak var view3Height: NSLayoutConstraint!
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view4Qus: UILabel!
    @IBOutlet weak var view4Ans: UILabel!
    @IBOutlet weak var view4Img: UIImageView!
    @IBOutlet weak var view4Height: NSLayoutConstraint!
    
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view5Qus: UILabel!
    @IBOutlet weak var view5Ans: UILabel!
    @IBOutlet weak var view5Img: UIImageView!
    @IBOutlet weak var view5Height: NSLayoutConstraint!
    
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view6Qus: UILabel!
    @IBOutlet weak var view6Ans: UILabel!
    @IBOutlet weak var view6Img: UIImageView!
    @IBOutlet weak var view6Height: NSLayoutConstraint!
    
    
    var view1Flag = 0
    var view2Flag = 0
    var view3Flag = 0
    var view4Flag = 0
    var view5Flag = 0
    var view6Flag = 0
    var faqArr = [faqScreenModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnsupport.layer.cornerRadius = 10.0
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        faqScreenAPI()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(view1Select))
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(view2Select))
        view2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(view3Select))
        view3.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(view4Select))
        view4.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(view5Select))
        view5.addGestureRecognizer(tapGesture5)
        
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(view6Select))
        view6.addGestureRecognizer(tapGesture6)
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func supportClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanySupportVC") as? CompanySupportVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    
    @objc func view1Select() {
        if view1Flag == 0 {
            view1Flag = 1
            view1Height.constant = 250.0
        }else{
            view1Flag = 0
            view1Height.constant = 13.0
        }
    }
    
    @objc func view2Select() {
        if view2Flag == 0 {
            view2Flag = 1
            view2Height.constant = 250.0
        }else{
            view2Flag = 0
            view2Height.constant = 13.0
        }
    }
    
    @objc func view3Select() {
        if view3Flag == 0 {
            view3Flag = 1
            view3Height.constant = 250.0
        }else{
            view3Flag = 0
            view3Height.constant = 13.0
        }
    }
    
    @objc func view4Select() {
        if view4Flag == 0 {
            view4Flag = 1
            view4Height.constant = 250.0
        }else{
            view4Flag = 0
            view4Height.constant = 13.0
        }
    }
    
    @objc func view5Select() {
        if view5Flag == 0 {
            view5Flag = 1
            view5Height.constant = 250.0
        }else{
            view5Flag = 0
            view5Height.constant = 13.0
        }
    }
    
    @objc func view6Select() {
        if view6Flag == 0 {
            view6Flag = 1
            view6Height.constant = 250.0
        }else{
            view6Flag = 0
            view6Height.constant = 13.0
        }
    }
    
    func faqScreenAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.companyFAQ, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                    print(datashow)
                    self.faqArr = datashow.map{faqScreenModal(data: $0)}
                    
                    if self.faqArr.count == 0 {
                        self.view1.isUserInteractionEnabled = false
                        self.view1.isHidden = true
                        self.view2.isUserInteractionEnabled = false
                        self.view2.isHidden = true
                        self.view3.isUserInteractionEnabled = false
                        self.view3.isHidden = true
                        self.view4.isUserInteractionEnabled = false
                        self.view4.isHidden = true
                        self.view5.isUserInteractionEnabled = false
                        self.view5.isHidden = true
                        self.view6.isUserInteractionEnabled = false
                        self.view6.isHidden = true
                    }
                    else {
                        if self.faqArr.count == 1
                        {
                            self.view1.isUserInteractionEnabled = true
                            self.view1.isHidden = false
                            self.view1Qus.text = self.faqArr[0].question
                            self.view1Ans.text = self.faqArr[0].answer
                            self.view2.isUserInteractionEnabled = false
                            self.view2.isHidden = true
                            self.view3.isUserInteractionEnabled = false
                            self.view3.isHidden = true
                            self.view4.isUserInteractionEnabled = false
                            self.view4.isHidden = true
                            self.view5.isUserInteractionEnabled = false
                            self.view5.isHidden = true
                            self.view6.isUserInteractionEnabled = false
                            self.view6.isHidden = true
                            
                        }
                        if self.faqArr.count == 2
                        {
                            self.view1.isUserInteractionEnabled = true
                            self.view1.isHidden = false
                            self.view1Qus.text = self.faqArr[0].question
                            self.view1Ans.text = self.faqArr[0].answer
                            self.view2.isUserInteractionEnabled = true
                            self.view2.isHidden = false
                            self.view2Qus.text = self.faqArr[1].question
                            self.view2Ans.text = self.faqArr[1].answer
                            self.view3.isUserInteractionEnabled = false
                            self.view3.isHidden = true
                            self.view4.isUserInteractionEnabled = false
                            self.view4.isHidden = true
                            self.view5.isUserInteractionEnabled = false
                            self.view5.isHidden = true
                            self.view6.isUserInteractionEnabled = false
                            self.view6.isHidden = true
                            
                        }
                        if self.faqArr.count == 3
                        {
                            self.view1.isUserInteractionEnabled = true
                            self.view1.isHidden = false
                            self.view1Qus.text = self.faqArr[0].question
                            self.view1Ans.text = self.faqArr[0].answer
                            self.view2.isUserInteractionEnabled = true
                            self.view2.isHidden = false
                            self.view2Qus.text = self.faqArr[1].question
                            self.view2Ans.text = self.faqArr[1].answer
                            self.view3.isUserInteractionEnabled = true
                            self.view3.isHidden = false
                            self.view3Qus.text = self.faqArr[2].question
                            self.view3Ans.text = self.faqArr[2].answer
                            self.view4.isUserInteractionEnabled = false
                            self.view4.isHidden = true
                            self.view5.isUserInteractionEnabled = false
                            self.view5.isHidden = true
                            self.view6.isUserInteractionEnabled = false
                            self.view6.isHidden = true
                            
                        }
                        if self.faqArr.count == 4
                        {
                            self.view1.isUserInteractionEnabled = true
                            self.view1.isHidden = false
                            self.view1Qus.text = self.faqArr[0].question
                            self.view1Ans.text = self.faqArr[0].answer
                            self.view2.isUserInteractionEnabled = true
                            self.view2.isHidden = false
                            self.view2Qus.text = self.faqArr[1].question
                            self.view2Ans.text = self.faqArr[1].answer
                            self.view3.isUserInteractionEnabled = true
                            self.view3.isHidden = false
                            self.view3Qus.text = self.faqArr[2].question
                            self.view3Ans.text = self.faqArr[2].answer
                            self.view4.isUserInteractionEnabled = true
                            self.view4.isHidden = false
                            self.view4Qus.text = self.faqArr[3].question
                            self.view4Ans.text = self.faqArr[3].answer
                            self.view5.isUserInteractionEnabled = false
                            self.view5.isHidden = true
                            self.view6.isUserInteractionEnabled = false
                            self.view6.isHidden = true
                            
                        }
                        if self.faqArr.count == 5
                        {
                            self.view1.isUserInteractionEnabled = true
                            self.view1.isHidden = false
                            self.view1Qus.text = self.faqArr[0].question
                            self.view1Ans.text = self.faqArr[0].answer
                            self.view2.isUserInteractionEnabled = true
                            self.view2.isHidden = false
                            self.view2Qus.text = self.faqArr[1].question
                            self.view2Ans.text = self.faqArr[1].answer
                            self.view3.isUserInteractionEnabled = true
                            self.view3.isHidden = false
                            self.view3Qus.text = self.faqArr[2].question
                            self.view3Ans.text = self.faqArr[2].answer
                            self.view4.isUserInteractionEnabled = true
                            self.view4.isHidden = false
                            self.view4Qus.text = self.faqArr[3].question
                            self.view4Ans.text = self.faqArr[3].answer
                            self.view5.isUserInteractionEnabled = true
                            self.view5.isHidden = false
                            self.view5Qus.text = self.faqArr[4].question
                            self.view5Ans.text = self.faqArr[4].answer
                            self.view6.isUserInteractionEnabled = false
                            self.view6.isHidden = true
                            
                        }
                        if self.faqArr.count >= 6
                        {
                            self.view1.isUserInteractionEnabled = true
                            self.view1.isHidden = false
                            self.view1Qus.text = self.faqArr[0].question
                            self.view1Ans.text = self.faqArr[0].answer
                            self.view2.isUserInteractionEnabled = true
                            self.view2.isHidden = false
                            self.view2Qus.text = self.faqArr[1].question
                            self.view2Ans.text = self.faqArr[1].answer
                            self.view3.isUserInteractionEnabled = true
                            self.view3.isHidden = false
                            self.view3Qus.text = self.faqArr[2].question
                            self.view3Ans.text = self.faqArr[2].answer
                            self.view4.isUserInteractionEnabled = true
                            self.view4.isHidden = false
                            self.view4Qus.text = self.faqArr[3].question
                            self.view4Ans.text = self.faqArr[3].answer
                            self.view5.isUserInteractionEnabled = true
                            self.view5.isHidden = true
                            self.view5Qus.text = self.faqArr[4].question
                            self.view5Ans.text = self.faqArr[4].answer
                            self.view6.isUserInteractionEnabled = true
                            self.view6.isHidden = false
                            self.view6Qus.text = self.faqArr[5].question
                            self.view6Ans.text = self.faqArr[5].answer
                            
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
