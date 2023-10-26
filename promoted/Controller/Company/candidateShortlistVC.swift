//
//  candidateShortlistVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 14/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD


class candidateShortlistVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var listTbl: UITableView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var btnSelect: UIButton!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var imgJobProfile: UIImageView!
    
    
    @IBOutlet weak var lblJob: UILabel!
    
    @IBOutlet weak var lblCompany: UILabel!
    
    
    var ShortListArr = [ShortlistScreenModal]()
    var Id =  String()
    var jobid = Int()
    var JobTitle = String()
    var jobProfile = String()
    var percent = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        cardView.layer.cornerRadius = 10.0
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
        listTbl.delegate = self
        listTbl.dataSource = self
        btnSelect.layer.cornerRadius = 10.0
        btnBack.layer.cornerRadius = 10.0
        Id = ""
        lblJob.text = self.JobTitle
        //let url = URL(string: "\(jobProfile)")

        //imgJobProfile.kf.setImage(with: url)
        imgJobProfile.downlodeImage(serviceurl: jobProfile, placeHolder: nil)
        lblCompany.text = UserDefaults.standard.string(forKey: "compnayName")
        
        getShortListedCandidateAPI()
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    
    @IBAction func backiConClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func selectClicked(_ sender: UIButton) {
        if Id == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select A Candidate", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MatchesCandidatesprofileVC") as? MatchesCandidatesprofileVC
            vc?.Id = Id
            vc?.jobid = jobid
            vc?.percent = percent
            self.navigationController?.pushViewController(vc!, animated: false)
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
        let position = obj.position
        let positionArr = position!.components(separatedBy: ",")

        let firstposition: String = positionArr[0]
        
        cell.position.text = firstposition
        cell.contact.text = "\(obj.email!) | \(obj.phone!)"
        
        if Id == "\(obj.id!)"{
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
        Id = "\(obj.id!)"
        percent = "\(obj.percentage!)"
        self.listTbl.reloadData()
     
    }
    
    func getShortListedCandidateAPI(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["job_listing_id":"\(jobid)"]
        
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
