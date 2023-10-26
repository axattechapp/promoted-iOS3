//
//  CandidateListVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 13/12/22.
//

import UIKit
//import Kingfisher
import TinderSwipeView
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

var names = ["Adam Gontier","Matt Walst","Brad Walst","Neil Sanderson","Barry Stock","Nicky Patson"]

class CandidateListVC: BaseViewController {
    
    //var userModels = [UserModel]()
    var finialHeight = Float()
    var matchedArr = [homeScreenModal]()
    var userModels = [UserModel]()
    var jobid = Int()
    
    private var swipeView: TinderSwipeView<UserModel>!{
        didSet{
            self.swipeView.delegate = self
        }
    }
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var emojiView: EmojiRateView!
    
    
//    let userModels : [UserModel] =  {
//            var model : [UserModel] = []
//            for n in 1...30 {
//                model.append(UserModel(name: names[Int(arc4random_uniform(UInt32(names.count)))], img:"http://13.58.154.146/promoted/public/storage/profile/6.jpg",id:n ,match:"",job:"Assistant Manager",company:"",contact:"",address:""))
//            }
//            return model
//        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            cardDataReload()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    }
    
    func cardDataReload(){
        self.userModels =  {
               var model : [UserModel] = []
            if self.matchedArr.count == 0 {
                Toast(text:"No candidates found", duration: Delay.long).show()
            }else{
                for n in self.matchedArr {
                    let position = n.position
                    let positionArr = position?.components(separatedBy: ",")
                    var firstposition = String()
                    if positionArr!.count > 1 {
                        firstposition = position ?? "Position"
                    }else{
                    firstposition = positionArr?[0] ?? "Position"
                    }
                    let jobType = n.job_type
                    let jobTypeArr = jobType!.components(separatedBy: ",")
                    let firstjob: String = jobTypeArr[0]
                    if firstjob == "1"{
                        if n.company_name == ""{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"Part-Time",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }else{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"\(n.company_name ?? "Company Name") | Part-Time",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }
                        
                    }else if firstjob == "2"{
                        if n.company_name == ""{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"Full-Time",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }else{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"\(n.company_name ?? "Company Name") | Full-Time",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }
                        
                    }else if firstjob == "3"{
                        if n.company_name == ""{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"Contract",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }else{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"\(n.company_name ?? "Company Name") | Contract",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }
                        
                    }else if firstjob == "4"{
                        if n.company_name == ""{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"Casual",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }else{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"\(n.company_name ?? "Company Name") | Casual",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }
                        
                    }else if firstjob == "5"{
                        if n.company_name == ""{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"Temporary",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }else{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"\(n.company_name ?? "Company Name") | Temporary",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }
                    }else{
                        if n.company_name == ""{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }else{
                            model.append(UserModel(name: n.first_name ?? "Name", img: n.profile_image,id:n.id ,match:"Profile match \(n.profile_matched_percentage ?? 0)%",job:firstposition,company:"\(n.company_name ?? "Company Name")",contact:"\(n.email ?? "Email") | \(n.phone ?? 1234556)",address:n.city ?? "city", percentage: "\(n.profile_matched_percentage ?? 0)"))
                            
                        }
                    }
                }
            }
               return model
           }()
        CardVC()
    }
    
    // Add New CardView Code
    func CardVC()
    {
        // Dynamically create view for each tinder card
        let contentView: (Int, CGRect, UserModel) -> (UIView) = { (index: Int ,frame: CGRect , userModel: UserModel) -> (UIView) in
            
                let customView = CustomView(frame: frame)
                customView.userModel = userModel
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
            customView.lblName.isUserInteractionEnabled = true
            customView.lblName.addGestureRecognizer(tap)
            customView.lblName.tag = index
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
            customView.profileImg.isUserInteractionEnabled = true
            customView.profileImg.addGestureRecognizer(tap2)
            customView.profileImg.tag = index
            
                return customView
           // }
        }
        
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height

        switch height {
        case 480.0:
            print("iPhone 3,4")
        case 568.0:
            print("iPhone 5")
        case 667.0:
            print("iPhone 6")
            finialHeight = Float(667 - 190)
            //200
        case 736.0:
            print("iPhone 6+")
            finialHeight = Float(667 - 215)
            //225
        case 812.0:
            print("iPhone X")
            print("iPhone XS")
            finialHeight = Float(812.0 - 225)
            //235
            break
        case 896.0:
            print("iPhone XR")
            print("iPhone XS Max")
            finialHeight = Float(896.0 - 220)
            //230
            break
        default:
            print("not an iPhone")
            let heightRatio = UIScreen.main.bounds.height - 225
            //235
            print("Height.....",UIScreen.main.bounds.height)
            finialHeight = Float(heightRatio)
        }
        
       //self.viewContainer.frame.size.width
        swipeView = TinderSwipeView<UserModel>(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: CGFloat(finialHeight)), contentView: contentView)
        //CGFloat(finialHeight))
        viewContainer.addSubview(swipeView)
        swipeView.showTinderCards(with: userModels ,isDummyShow: false)
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {

        print("tap working",sender.view?.tag ?? 0)
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateDetailVC") as? CandidateDetailVC
        let obj = matchedArr[sender.view!.tag]
        vc?.jobid = jobid
        vc?.userId = obj.id!
        vc?.percent = obj.profile_matched_percentage!
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
        
    }
    
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
}

extension CandidateListVC : TinderSwipeViewDelegate{
    
    func dummyAnimationDone() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveLinear, animations: { }, completion: nil)
        print("Watch out shake action")
    }
    
    func didSelectCard(model: Any) {
        
        
        print("Selected card")
    }
    
    func fallbackCard(model: Any) {
        //emojiView.rateValue =  2.5
        let userModel = model as! UserModel
        print("Cancelling \(userModel.name!)")
    }
    
    func cardGoesLeft(model: Any) {
        //emojiView.rateValue =  2.5
        let userModel = model as! UserModel
        print("Watchout Left \(userModel.name!)")
    }
    
    func cardGoesRight(model : Any) {
        //emojiView.rateValue =  2.5
        let userModel = model as! UserModel
        print("Watchout Right \(userModel.name!)")
        
        rightSwipeAPi(id: "\(userModel.id!)", percent: "\(userModel.percentage!)")
    }
    
    
    //http://13.58.154.146/promoted/public/api/auth/shortlist-a-candidate
    
    func rightSwipeAPi(id:String, percent:String){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["candidate_id":"\(id)","job_listing_id":"\(jobid)","percentage":"\(percent)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.shortListACandidate, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                let status = String.getString(dictResult["status"])
                
                if status == "SUCCESS"{
                    
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
    
    func undoCardsDone(model: Any) {
       //emojiView.rateValue =  2.5
        let userModel = model as! UserModel
        print("Reverting done \(userModel.name!)")
    }
    
    func endOfCardsReached() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: { }, completion: nil)
         print("End of all cards")
        Toast(text: "There are no candidates left to shortlist. Please check later.", duration: Delay.long).show()
        matchedArr.removeAll()
        
        
    }
    
    func currentCardStatus(card object: Any, distance: CGFloat) {
        if distance == 0 {
           // emojiView.rateValue =  2.5
        }else{
//            let value = Float(min(abs(distance/100), 1.0) * 5)
//            let sorted = distance > 0  ? 2.5 + (value * 5) / 10  : 2.5 - (value * 5) / 10
//            emojiView.rateValue =  sorted
        }
        print(distance)
    }
}

extension UIView {
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.map { $0.superview(of: type)! }
    }
    
    func subview<T>(of type: T.Type) -> T? {
        return subviews.compactMap { $0 as? T ?? $0.subview(of: type) }.first
    }
}
