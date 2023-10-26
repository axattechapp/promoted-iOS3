//
//  userMenuViewController.swift
//  promoted
//
//  Created by Vikram Sindhu on 23/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

protocol SlideMenuDelegate2 {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class userMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var tblMenuOptions: UITableView!
    
    
    @IBOutlet weak var crossBtn: UIButton!
    
    
    //Array containing menu options
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    //Menu button which was tapped to display the menu
    var btnMenu : UIButton!
    
    //Delegate of the MenuVC
    var delegate : SlideMenuDelegate2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
        tblMenuOptions.backgroundView = nil
        tblMenuOptions.backgroundColor = UIColor.clear
        //        imgUserProfile.layer.cornerRadius = imgUserProfile.frame.size.width / 2
        //        imgUserProfile.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"My Account", "icon":"Group 339"])
        arrayMenuOptions.append(["title":"My Details", "icon":"detail2"])
        arrayMenuOptions.append(["title":"Work Experience", "icon":"work2"])
        arrayMenuOptions.append(["title":"My Interviews", "icon":"menu4"])
        arrayMenuOptions.append(["title":"Job Interest Settings", "icon":"job2"])
        arrayMenuOptions.append(["title":"Follow Up", "icon":"menu5"])
        arrayMenuOptions.append(["title":"Live Chat", "icon":"menu6"])
        //arrayMenuOptions.append(["title":"Subscription", "icon":"menu7"])
        arrayMenuOptions.append(["title":"Help / FAQ", "icon":"menu8"])
        
        arrayMenuOptions = arrayMenuOptions.filterDuplicate{ $1["title"] }
        tblMenuOptions.reloadData()
    }
    
    
    @IBAction func closeScreenClicked(_ sender: UIButton) {
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            let index = -1
            
            delegate?.slideMenuItemSelectedAtIndex(Int32(index))
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            //      self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
        
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            let index = -1
            delegate?.slideMenuItemSelectedAtIndex(Int32(index))
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            //      self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
        
    }
    
    
    
    @IBAction func logoClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    
    @IBAction func logOutClicked(_ sender: UIButton) {
        
        logout()
    }
    
    func logout(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.logout, requestMethod: .POST, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
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
                        Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        UserDefaults.standard.setValue(false, forKey: kIsLogin)
                        UserDefaults.standard.synchronize()
                        self.navigationController?.popToRootViewController(animated: true)
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
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell
        
            cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
            
            let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
            let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
            
            imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
            lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let btn = UIButton(type: UIButton.ButtonType.custom)
            btn.tag = indexPath.row
            self.onCloseMenuClick(btn)
    }
    
    func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            let index = Int32(button.tag)
            
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            //      self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 60
    }
    
}
