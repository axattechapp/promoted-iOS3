//
//  MatchCandidateScheduleVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 15/12/22.
//

import UIKit
import VACalendar
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD

class MatchCandidateScheduleVC: BaseViewController, UITextViewDelegate, VAMonthHeaderViewDelegate{
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblVideo: UILabel!
    
    @IBOutlet weak var calenderView: UIView!
    
    let defaultCalendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
    
    
    @IBOutlet weak var monthHeaderView: VAMonthHeaderView! {
        didSet {
            let appereance = VAMonthHeaderViewAppearance(previousButtonImage: #imageLiteral(resourceName: "calBack"), nextButtonImage: #imageLiteral(resourceName: "calBack2"))
            monthHeaderView.delegate = self
            //            monthHeaderView.monthDateCountDelegate = self //Preet create
            monthHeaderView.appearance = appereance
        }
    }
    
    @IBOutlet weak var weekDaysView: VAWeekDaysView! {
        didSet {
            
            let appereance = VAWeekDaysViewAppearance(symbolsType: .short, calendar: defaultCalendar)
            weekDaysView.appearance = appereance
        }
    }
    
    
    @IBOutlet weak var viewDates: UIView!
    
    
    @IBOutlet weak var btnTime1: UIButton!
    @IBOutlet weak var btnTime2: UIButton!
    @IBOutlet weak var btnTime3: UIButton!
    @IBOutlet weak var btnTime4: UIButton!
    @IBOutlet weak var btnTime5: UIButton!
    @IBOutlet weak var btnTime6: UIButton!
    @IBOutlet weak var btnTime7: UIButton!
    @IBOutlet weak var btnTime8: UIButton!
    @IBOutlet weak var btnTime9: UIButton!
    @IBOutlet weak var btnTime10: UIButton!
    
    @IBOutlet weak var imgCustom: UIImageView!
    @IBOutlet weak var lblCustom: UILabel!
    
    
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var tvNote: UITextView!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSchedule: UIButton!
    
    
    var calendarVi: VACalendarView!
    var Id = String()
    
    var videoFlag = 1
    var customFlag = 0
    var dateFlag = ""
    var scheduledate = ""
    
    var profile = String()
    var name = String()
    var jobTitle = String()
    var contact = String()
    var jobid = Int()
    var percent = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        dateFlag = ""
        scheduledate = ""
        
        cardView.layer.cornerRadius = 10.0
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
        calenderView.layer.cornerRadius = 10.0
//        monthHeaderView.layer.cornerRadius = 10.0
//        viewDates.layer.cornerRadius = 10.0
        
        // shadow
        calenderView.layer.shadowColor = UIColor.black.cgColor
        calenderView.layer.shadowOffset = CGSize(width: 3, height: 3)
        calenderView.layer.shadowOpacity = 0.7
        calenderView.layer.shadowRadius = 4.0
        
        
        profImg.layer.cornerRadius = 10.0
        noteView.layer.cornerRadius = 10.0
        noteView.layer.borderWidth = 1.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        tvNote.inputAccessoryView = toolBar()

        btnSchedule.layer.cornerRadius = 10.0
        btnCancel.layer.cornerRadius = 10.0
        
        btnTime1.layer.cornerRadius = 10.0
        btnTime2.layer.cornerRadius = 10.0
        btnTime3.layer.cornerRadius = 10.0
        btnTime4.layer.cornerRadius = 10.0
        btnTime5.layer.cornerRadius = 10.0
        btnTime6.layer.cornerRadius = 10.0
        btnTime7.layer.cornerRadius = 10.0
        btnTime8.layer.cornerRadius = 10.0
        btnTime9.layer.cornerRadius = 10.0
        btnTime10.layer.cornerRadius = 10.0
        
        imgVideo.image = UIImage(named: "yes")
        lblVideo.text = "Yes"
        
        imgCustom.image = UIImage(named: "no")
        lblCustom.text = "No"
        let url = URL(string: "\(profile.removeWhitespace())")

        self.profImg.kf.setImage(with: url)
        //self.profImg.downlodeImage(serviceurl: profile, placeHolder: nil)
                
        self.lblName.text = name
        self.lblJob.text = jobTitle
        self.lblContact.text = contact
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let calendar = VACalendar(calendar: self.defaultCalendar)
            self.calendarVi = VACalendarView(frame: self.viewDates.bounds, calendar: calendar)
            self.calendarVi.showDaysOut = true
            self.calendarVi.selectionStyle = .single
            self.calendarVi.scrollDirection = .horizontal
            self.calendarVi.monthDelegate = self.monthHeaderView
            self.calendarVi.dayViewAppearanceDelegate = self
            self.calendarVi.monthViewAppearanceDelegate = self
            self.calendarVi.calendarDelegate = self
            self.calendarVi.setup()
            self.viewDates.addSubview(self.calendarVi)
        }
        
        
    }
    
    @IBAction func menuClicked(_ sender: UIButton) {
        
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func scheduleClicked(_ sender: UIButton) {
        if dateFlag == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select Time", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if scheduledate == "" {
            let alert = UIAlertController(title: "Procruited", message: "Please Select Date", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            ScheduleInterviewAPi()
        }
    }
    
    @IBAction func videoToggleClicked(_ sender: UIButton) {
        if videoFlag == 0 {
            imgVideo.image = UIImage(named: "yes")
            lblVideo.text = "Yes"
            videoFlag = 1
        }else{
            imgVideo.image = UIImage(named: "no")
            lblVideo.text = "No"
            videoFlag = 0
        }
    }
    
    @IBAction func customiseToggleClicked(_ sender: UIButton) {
        if customFlag == 0{
            imgCustom.image = UIImage(named: "yes")
            lblCustom.text = "Yes"
            customFlag = 1
        }else{
            imgCustom.image = UIImage(named: "no")
            lblCustom.text = "No"
            customFlag = 0
        }
    }
    
    @IBAction func time1Clicked(_ sender: UIButton) {
        dateFlag = "09:00"
        
        btnTime1.setTitleColor(.white, for: .normal)
        btnTime1.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func time2Clicked(_ sender: UIButton) {
        dateFlag = "10:00"
        
        btnTime2.setTitleColor(.white, for: .normal)
        btnTime2.backgroundColor = UIColor(hexString: "#E87070")
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    
    @IBAction func time3Clicked(_ sender: UIButton) {
        dateFlag = "11:00"
        
        btnTime3.setTitleColor(.white, for: .normal)
        btnTime3.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time4Clicked(_ sender: UIButton) {
        dateFlag = "12:00"
        
        btnTime4.setTitleColor(.white, for: .normal)
        btnTime4.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time5Clicked(_ sender: UIButton) {
        dateFlag = "13:00"
        
        btnTime5.setTitleColor(.white, for: .normal)
        btnTime5.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time6Clicked(_ sender: UIButton) {
        dateFlag = "14:00"
        
        btnTime6.setTitleColor(.white, for: .normal)
        btnTime6.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time7Clicked(_ sender: UIButton) {
        dateFlag = "15:00"
        
        btnTime7.setTitleColor(.white, for: .normal)
        btnTime7.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time8Clicked(_ sender: UIButton) {
        dateFlag = "16:00"
        
        btnTime8.setTitleColor(.white, for: .normal)
        btnTime8.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time9Clicked(_ sender: UIButton) {
        dateFlag = "17:00"
        
        btnTime9.setTitleColor(.white, for: .normal)
        btnTime9.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
        btnTime10.titleLabel?.textColor = UIColor.black
        btnTime10.backgroundColor = UIColor.clear
    }
    @IBAction func time10Clicked(_ sender: UIButton) {
        dateFlag = "18:00"
        
        btnTime10.setTitleColor(.white, for: .normal)
        btnTime10.backgroundColor = UIColor(hexString: "#E87070")
        btnTime2.titleLabel?.textColor = UIColor.black
        btnTime2.backgroundColor = UIColor.clear
        btnTime3.titleLabel?.textColor = UIColor.black
        btnTime3.backgroundColor = UIColor.clear
        btnTime4.titleLabel?.textColor = UIColor.black
        btnTime4.backgroundColor = UIColor.clear
        btnTime5.titleLabel?.textColor = UIColor.black
        btnTime5.backgroundColor = UIColor.clear
        btnTime6.titleLabel?.textColor = UIColor.black
        btnTime6.backgroundColor = UIColor.clear
        btnTime7.titleLabel?.textColor = UIColor.black
        btnTime7.backgroundColor = UIColor.clear
        btnTime8.titleLabel?.textColor = UIColor.black
        btnTime8.backgroundColor = UIColor.clear
        btnTime9.titleLabel?.textColor = UIColor.black
        btnTime9.backgroundColor = UIColor.clear
        btnTime1.titleLabel?.textColor = UIColor.black
        btnTime1.backgroundColor = UIColor.clear
    }
    
    
    func ScheduleInterviewAPi(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        //type_of_notification,to,notes
        //var jobid, percent
        let params:[String:Any] = ["user_id":Id, "video_call":videoFlag,"note":tvNote.text!, "customise_time_with_candidate":customFlag,"date":scheduledate,"time_available":dateFlag,"job_listing_id":"\(jobid)","percentage":"\(percent)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.sendInterviewRequest, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                let status = String.getString(dictResult["status"])
                
                if status == "SUCCESS"{
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SendOfferVC") as? SendOfferVC
                    self.navigationController?.pushViewController(vc!, animated: false)
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
    
    
    
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if tvNote.text.count <= 200
            {
                // Code here
            }
            else
            {
                //Code Here
//                tvNote.endEditing(true)
//                let alert = UIAlertController(title: "Procruited", message: "Max 200 words Reached!", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
            }
            return true
        }
    
}

extension MatchCandidateScheduleVC  {
    
    func didTapNextMonth() {
        calendarVi.nextMonth()
    }
    
    func didTapPreviousMonth() {
        calendarVi.previousMonth()
    }
}

extension MatchCandidateScheduleVC: VAMonthViewAppearanceDelegate {
    
    func leftInset() -> CGFloat {
        return 10.0
    }
    
    func rightInset() -> CGFloat {
        return 10.0
    }
    
    func verticalMonthTitleFont() -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: 15)!
    }
    
    func verticalMonthTitleColor() -> UIColor {
        return .black
    }
    
    func verticalCurrentMonthTitleColor() -> UIColor {
        return UIColor(hexString: "#E87070")
    }
}

extension MatchCandidateScheduleVC: VADayViewAppearanceDelegate {
    
    func selectedArea() -> CGFloat {
        return 10
    }
    func textColor(for state: VADayState) -> UIColor {
        switch state {
        case .out:
            return UIColor(red: 214 / 255, green: 214 / 255, blue: 219 / 255, alpha: 1.0)
        case .selected:
            return .white
        case .unavailable:
            return .lightGray
        default:
            return .black
        }
    }
    
    func backgroundColor(for state: VADayState) -> UIColor {
        switch state {
        case .selected:
            return UIColor(hexString: "#E87070")
        default:
            return .clear
        }
    }
    
    func shape() -> VADayShape {
        return .circle
    }
    
    func dotBottomVerticalOffset(for state: VADayState) -> CGFloat {
        switch state {
        case .selected:
            return 2
        default:
            return -7
        }
    }
    
}
extension MatchCandidateScheduleVC: VACalendarViewDelegate {
    func selectedDate(_ date: Date) {
        
        print(date)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        scheduledate = dateFormatterPrint.string(from: date as Date)
        print(scheduledate)
    }
}
