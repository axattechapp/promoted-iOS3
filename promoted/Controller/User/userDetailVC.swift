//
//  userDetailVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 23/12/22.
//

import UIKit
import AVKit
import AVFoundation
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD
import MobileCoreServices
import UniformTypeIdentifiers
import WebKit
import YPImagePicker

class userDetailVC: BaseViewController2, UITextFieldDelegate, UIDocumentPickerDelegate, WKNavigationDelegate,YPImagePickerDelegate{
    
    @IBOutlet weak var upgradeBtn: UIButton!
    
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var btnView1Edit: UIButton!
    
    @IBOutlet weak var view5: UIView!
    
    @IBOutlet weak var tfLastName: UITextField!
    
    @IBOutlet weak var btnView5Edit: UIButton!
    
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var tfemail: UITextField!
    @IBOutlet weak var btnView2Edit: UIButton!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var tfcontact: UITextField!
    @IBOutlet weak var btnView3Edit: UIButton!
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var tflocation: UITextField!
    @IBOutlet weak var btnView4Edit: UIButton!
    
    
    @IBOutlet weak var portLock: UIImageView!
    @IBOutlet weak var portView:UIView!
    @IBOutlet weak var portLbl:UILabel!
    
    
    @IBOutlet weak var videoLock: UIImageView!
    @IBOutlet weak var videoView:UIView!
    @IBOutlet weak var videoLbl:UILabel!
    
    
    @IBOutlet weak var btnUploadPortfolio: UIButton!
    
    
    @IBOutlet weak var btnUploadVideo: UIButton!
    
    @IBOutlet weak var btnviewvideo: UIButton!
    @IBOutlet weak var btnviewPostfolio: UIButton!
    
    var imagePicker = UIImagePickerController()
    var profile:UIImage?
    
    var picker = YPImagePicker()
    var config = YPImagePickerConfiguration()
    var items = [YPMediaItem]()
    
    var doc1 = NSURL()
    var videodoc = NSURL()
    var videolink = String()
    var portfoliolink = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upgradeBtn.layer.cornerRadius = 10.0
        saveBtn.layer.cornerRadius = 10.0
        view1.layer.cornerRadius = 10.0
        view5.layer.cornerRadius = 10.0
        view2.layer.cornerRadius = 10.0
        view3.layer.cornerRadius = 10.0
        view4.layer.cornerRadius = 10.0
        
        view1.layer.borderWidth = 1.0
        view1.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view5.layer.borderWidth = 1.0
        view5.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view2.layer.borderWidth = 1.0
        view2.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view3.layer.borderWidth = 1.0
        view3.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view4.layer.borderWidth = 1.0
        view4.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        portView.layer.cornerRadius = 10.0
        portView.layer.borderWidth = 1.0
        portView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        videoView.layer.cornerRadius = 10.0
        videoView.layer.borderWidth = 1.0
        videoView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        
        
        tfname.delegate = self
        tfLastName.delegate = self
        tfemail.delegate = self
        tfcontact.delegate = self
        tflocation.delegate = self
        let color = UIColor.init(hexString: "#4E4E4E")
        let placeholder = tfname.placeholder ?? ""
        tfname.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder5 = tfLastName.placeholder ?? ""
        tfLastName.attributedPlaceholder = NSAttributedString(string: placeholder5, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder2 = tfemail.placeholder ?? ""
        tfemail.attributedPlaceholder = NSAttributedString(string: placeholder2, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder3 = tfcontact.placeholder ?? ""
        tfcontact.attributedPlaceholder = NSAttributedString(string: placeholder3, attributes: [NSAttributedString.Key.foregroundColor : color])
        let placeholder4 = tflocation.placeholder ?? ""
        tflocation.attributedPlaceholder = NSAttributedString(string: placeholder4, attributes: [NSAttributedString.Key.foregroundColor : color])
        getUserProfileAPI()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tfname.isUserInteractionEnabled = false
        tfLastName.isUserInteractionEnabled = false
        tfemail.isUserInteractionEnabled = false
        tfcontact.isUserInteractionEnabled = false
        tflocation.isUserInteractionEnabled = false
        tfname.text = ""
        tfLastName.text = ""
        tfemail.text = ""
        tfcontact.text = ""
        tflocation.text = ""
        initGallery()
        
    }
    
    
    func initGallery()
    {
        self.picker = YPImagePicker(configuration: config)
        self.picker.imagePickerDelegate = self
        //config.video.compression = AVAssetExportPresetHighestQuality
        config.video.compression = AVAssetExportPreset1920x1080
        config.video.fileType = .mp4
        config.usesFrontCamera = true
        //config.showsCrop = .rectangle(ratio: (1/1))
        config.library.mediaType = .photoAndVideo
        config.video.recordingTimeLimit = 60.0
        config.video.libraryTimeLimit = 60.0
        config.video.minimumTimeLimit = 0.0
        config.video.trimmerMaxDuration = 60.0
        config.video.trimmerMinDuration = 0.0
        config.library.maxNumberOfItems = 1
        config.startOnScreen = YPPickerScreen.library
        config.screens = [.library,.video]
        let overlayView = UIView()
        overlayView.backgroundColor = .red
        overlayView.alpha = 0.3
        config.overlayView = overlayView
        config.showsVideoTrimmer = true
        config.onlySquareImagesFromCamera  = false
        config.library.onlySquare = false
        config.isScrollToChangeModesEnabled  = false
    }
    
    func selectVideo()
    {
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            
            self.picker = YPImagePicker(configuration: config)
            self.picker.imagePickerDelegate = self
            //config.video.compression = AVAssetExportPresetHighestQuality
            config.video.compression = AVAssetExportPreset1920x1080
            config.video.fileType = .mp4
            config.usesFrontCamera = true
            //config.showsCrop = .rectangle(ratio: (1/1))
            config.library.mediaType = .photoAndVideo
            config.video.recordingTimeLimit = 60.0
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 0.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 0.0
            config.library.maxNumberOfItems = 1
            config.startOnScreen = YPPickerScreen.library
            config.screens = [.library,.video]
            let overlayView = UIView()
            overlayView.backgroundColor = .red
            overlayView.alpha = 0.3
            config.overlayView = overlayView
            config.showsVideoTrimmer = true
            config.onlySquareImagesFromCamera  = false
            config.library.onlySquare = false
            config.isScrollToChangeModesEnabled  = false
            
                        
        }
        picker.modalPresentationStyle = .overFullScreen
        picker.navigationBar.backgroundColor = .white
            if #available(iOS 13.0, *) {
                UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black ] // Title color
                     UINavigationBar.appearance().tintColor = .systemBlue // Left. bar buttons
                     config.colors.tintColor = .black // Right bar buttons (actions)
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    print("Dark mode")
                    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white] // Title color
                         UINavigationBar.appearance().tintColor = .white // Left. bar buttons
                    config.colors.tintColor = .white // Right bar buttons (actions)
                }
                else {
                    print("Light mode")
                    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black ] // Title color
                         UINavigationBar.appearance().tintColor = .black // Left. bar buttons
                    config.colors.tintColor = .black // Right bar buttons (actions)
                }
            }
            items.removeAll()
             present(picker, animated: true, completion: {
                 self.picker.navigationBar.topItem?.rightBarButtonItem?.isEnabled = true
                if #available(iOS 13.0, *) {
                    if UITraitCollection.current.userInterfaceStyle == .dark {
                        print("Dark mode")
                        self.picker.navigationBar.topItem?.rightBarButtonItem?.tintColor = .white

                    }
                    else {
                        print("Light mode")
                        self.picker.navigationBar.topItem?.rightBarButtonItem?.tintColor = .black
                    }
                }
                
             })
                   // present(picker, animated: true, completion: nil)
            picker.didFinishPicking { [self, unowned picker] items, cancelled in
                         if cancelled {
                             print("Picker was canceled")
                             picker.dismiss(animated: true, completion: nil)
                         } else {
                             for item in items {
                                 switch item {
                                 case .photo(p: _):
                                    print("images..")
                                     Toast(text:"Please select Video", duration: Delay.long).show()
                                    break

                                 case .video(v: let video):
                                    print("Video..")
                                     
                                     let theFileName = ("\(video.url)" as NSString).lastPathComponent
                                     self.videoLbl.text = "\(theFileName)"
                                     videodoc = video.url as NSURL
                                     
                                     break
                                 }
                             }

                             picker.dismiss(animated: true, completion: {
                                self.items += items
                                
                                 })
             
                             }
                         }
    }
    
    
    
    @IBAction func deleteAccountClicked(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Procruited",
                                                message: "Are you sure you want to delete your Account?",
                                                preferredStyle: .alert)
        let alertActionYes = UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.DeleteAccount()
        })
        let alertActionNO = UIAlertAction(title: "No", style: .default, handler: { _ in
        })
        alertController.addAction(alertActionYes)
        alertController.addAction(alertActionNO)
        self.present(alertController, animated: true)
    }
    
    func DeleteAccount(){
        
        CommonUtils.showHudWithNoInteraction(show: true)
        
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.deleteAccount, requestMethod: .GET, requestParameters: [:], withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let data = kSharedInstance.getDictionary(dictResult["data"])
                    print(data)
                    Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                    UserDefaults.standard.setValue(false, forKey: kIsLogin)
                    UserDefaults.standard.synchronize()
                    self.navigationController?.popToRootViewController(animated: true)
                    
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
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func profileClicked(_ sender: UIButton) {
        imageUpload()
    }
    
    
    func imageUpload(){
        
        let imagePickerController = UIImagePickerController()
            imagePickerController.allowsEditing = true //If you want edit option set "true"
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
        
            present(imagePickerController, animated: true, completion: nil)
        
//        ImagePickerHandler.shared.showActionSheet(vc: self, view: self.view)
//        ImagePickerHandler.shared.imagePickedBlock = { (img, data) in
//            self.imgProfile.image = img
//            self.profile = img
//            self.imgProfile.contentMode = .scaleAspectFill
//            self.imgProfile.isHidden=false
//        }
        
        
        
    }
    
    @IBAction func UpgradeClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPortfolioUpgradeVC") as? userPortfolioUpgradeVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        tfname.isUserInteractionEnabled = false
        tfLastName.isUserInteractionEnabled = false
        tfemail.isUserInteractionEnabled = false
        tfcontact.isUserInteractionEnabled = false
        tflocation.isUserInteractionEnabled = false
        
        updateCandidateProfileAPI()
    }
    
    
    
    @IBAction func view1EditClicked(_ sender: UIButton) {
        tfname.isUserInteractionEnabled = true
        btnView1Edit.isHidden = true
    }
    
    
    @IBAction func view5EditClicked(_ sender: UIButton) {
        tfLastName.isUserInteractionEnabled = true
        btnView5Edit.isHidden = true
    }
    
    
    @IBAction func view2EditClicked(_ sender: UIButton) {
        tfemail.isUserInteractionEnabled = true
        btnView2Edit.isHidden = true
    }
    
    @IBAction func view3EditClicked(_ sender: UIButton) {
        tfcontact.isUserInteractionEnabled = true
        btnView3Edit.isHidden = true
    }
    
    @IBAction func view4EditClicked(_ sender: UIButton) {
        tflocation.isUserInteractionEnabled = true
        btnView4Edit.isHidden = true
    }
    
    @IBAction func portUploadClicked(_ sender: UIButton) {
        let portfolioFlag1 = UserDefaults.standard.bool(forKey:"portfolio")
        if portfolioFlag1 == false{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPortfolioUpgradeVC") as? userPortfolioUpgradeVC
            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
                importMenu.delegate = self
                importMenu.modalPresentationStyle = .formSheet
                self.present(importMenu, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func viewPortfolioClicked(_ sender: UIButton){
        let portfolioFlag1 = UserDefaults.standard.bool(forKey:"portfolio")
        if (portfolioFlag1 != nil) == false{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPortfolioUpgradeVC") as? userPortfolioUpgradeVC
            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            if portfoliolink != "" {

                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "webViewController") as? webViewController
                vc?.urlStr = portfoliolink
                self.navigationController?.pushViewController(vc!, animated: false)
                
            }
        }
        
    }
    
    @IBAction func videoUploadClicked(_ sender: UIButton) {
        let videoFlag1 = UserDefaults.standard.bool(forKey:"video")
        if videoFlag1 == false{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPortfolioUpgradeVC") as? userPortfolioUpgradeVC
            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            selectVideo()
        }
        
    }
    
    @IBAction func viewVideoClicked(_ sender: UIButton){
        let videoFlag1 = UserDefaults.standard.bool(forKey:"video")
        if videoFlag1 == false{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userPortfolioUpgradeVC") as? userPortfolioUpgradeVC
            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            if videolink != ""{
                guard let videoURL = URL(string: videolink ) else { return  }
                let player = AVPlayer(url: videoURL)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.present(playerViewController, animated: true) {
                    playerViewController.player!.play()
                }
            }
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
                        let imageurl =  String.getString(data["profile_image"])
                        let url = URL(string: "\(imageurl.removeWhitespace())")
                        
                        self.imgProfile.kf.setImage(with: url)
                        //self.imgProfile.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                        self.tfname.text = String.getString(data["first_name"])
                        self.tfLastName.text = String.getString(data["last_name"])
                        self.tfemail.text = String.getString(data["email"])
                        self.tfcontact.text = String.getString(data["phone"])
                        self.tflocation.text = String.getString(data["city"])
                        
                        if String.getString(data["portfolio"]) != ""{
                            UserDefaults.standard.setValue(true, forKey: "portfolio")
                            UserDefaults.standard.synchronize()
                            self.btnviewPostfolio.isHidden = false
                            self.portLbl.text = "Add Portfolio"
                            self.portLock.isHidden = true
                            self.btnviewPostfolio.isUserInteractionEnabled = true
                            self.btnUploadPortfolio.isUserInteractionEnabled = false
                            self.portfoliolink = String.getString(data["portfolio"])
                        }else{
                            self.portfoliolink = ""
                            if Int.getInt(data["portfolio_unlocked"]) == 1{
                                UserDefaults.standard.setValue(true, forKey: "portfolio")
                                UserDefaults.standard.synchronize()
                                self.portLbl.text = "Add Portfolio"
                                self.btnviewPostfolio.isHidden = true
                                self.portLock.isHidden = true
                                self.btnviewPostfolio.isUserInteractionEnabled = false
                                self.btnUploadPortfolio.isUserInteractionEnabled = true
                                
                            }else{
                                UserDefaults.standard.setValue(false, forKey: "portfolio")
                                UserDefaults.standard.synchronize()
                                self.portLbl.text = "Unlock To Add Portfolio"
                                self.btnviewPostfolio.isHidden = true
                                self.portLock.isHidden = false
                                self.btnviewPostfolio.isUserInteractionEnabled = true
                                self.btnUploadPortfolio.isUserInteractionEnabled = true
                            }
                        }
                        
                        if String.getString(data["video"]) != ""{
                            UserDefaults.standard.setValue(true, forKey: "video")
                            UserDefaults.standard.synchronize()
                            self.btnviewvideo.isHidden = false
                            self.videoLbl.text = "Add Video"
                            self.videoLock.isHidden = true
                            self.btnviewvideo.isUserInteractionEnabled = true
                            self.btnUploadVideo.isUserInteractionEnabled = false
                            self.videolink = String.getString(data["video"])
                        }else{
                            self.videolink = ""
                            if Int.getInt(data["video_unlocked"]) == 1{
                                UserDefaults.standard.setValue(true, forKey: "video")
                                UserDefaults.standard.synchronize()
                                self.videoLbl.text = "Add Video"
                                self.btnviewvideo.isHidden = true
                                self.videoLock.isHidden = true
                                self.btnviewvideo.isUserInteractionEnabled = false
                                self.btnUploadVideo.isUserInteractionEnabled = true
                                
                            }else{
                                UserDefaults.standard.setValue(false, forKey: "video")
                                UserDefaults.standard.synchronize()
                                self.videoLbl.text = "Unlock To Add Video"
                                self.videoLock.isHidden = false
                                self.btnviewvideo.isHidden = true
                                self.btnviewvideo.isUserInteractionEnabled = true
                                self.btnUploadVideo.isUserInteractionEnabled = true
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
    
    // MARK:- Update Candidate Profile API
    func updateCandidateProfileAPI() {
        CommonUtils.showHudWithNoInteraction(show: true)
        let url: String = kBASEURL + ServiceName.updateUserProfile
             print(url)
         var header = [String: String]()
         if let token = UserDefaults.standard.value(forKey:"token"){
         header = ["Content-Type" : "application/json","Authorization": "Bearer \(token)"]
         } else {
                     header = [:]
                 }
         print(header)
        let params = ["phone": "\(tfcontact.text!)", "email": "\(tfemail.text!)", "city":"\(tflocation.text!)", "first_name":"\(tfname.text!)","last_name":"\(tfLastName.text!)"] as [String : String]
         
             print("paramstes \(params)")
        
             Alamofire.upload(
                multipartFormData: { multipartFormData in
                    for (key, value) in params {
                            multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                    }
                    if self.profile != nil {
                        let imgData = self.profile!.jpegData(compressionQuality: 1)
                        let currentDateTime = Date()
                        let formatter = DateFormatter()
                        formatter.dateFormat = "ddMMMMyyyyhhmma"
                        let someDateTime = formatter.string(from: currentDateTime)
                        multipartFormData.append(imgData!, withName: "profile_image", fileName: "Profile\(someDateTime).jpg", mimeType:"image/jpeg")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "profile_image")
                    }
                    
                    if ("\(self.doc1)" as NSString) != ""{
                        let data1 = try! Data(contentsOf: self.doc1 as URL)
                        let theFileName = ("\(self.doc1)" as NSString).lastPathComponent
                                multipartFormData.append(data1, withName: "portfolio", fileName: "\(theFileName)", mimeType:"application/pdf")
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "portfolio")
                    }
                    
                    //videodoc
                    
                    if ("\(self.videodoc)" as NSString) != ""{
                        let data1 = try! Data(contentsOf: self.videodoc as URL)
                        let theFileName = ("\(self.videodoc)" as NSString).lastPathComponent
                                multipartFormData.append(data1, withName: "video", fileName: "\(theFileName)", mimeType:".mp4")
                        multipartFormData.append(".mp4".data(using: String.Encoding.utf8)!, withName: "content_type")
                        
                    }else{
                        multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "video")
                    }
                    
                    },
                    to: url, method: .post, headers: header) { (result) in
                        
                        switch result{
                        case .success(let upload, _, _):
                            upload.uploadProgress(closure: { (progress) in
                                let progressVal = String(format: "%.2f%%", progress.fractionCompleted * 100)
                                print("\(progressVal)")
                            })
                            
                            upload.responseJSON{ response in
                                print(response)
                                CommonUtils.showHudWithNoInteraction(show: false)
                                if response.result.isSuccess {
                                    let data = JSON(response.result.value!)
                                    print(data)
                                    print(data["message"])
                                    
                                    if "\(data["status"])" == "FAIL"{
                                        Toast(text:"\(data["message"])", duration: Delay.long).show()
                                    }else{
                                        Toast(text:"\(data["message"])", duration: Delay.long).show()
                                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
                                    self.navigationController?.pushViewController(vc!, animated: false)
                                    }
                                    
                                    
    
                                  } else {
                                      //print(response.result.value!)
                                      print(response.result.isFailure)
                                      let data = JSON(response.result.value!)
                                      print(data)

                                      Toast(text:"\(data["message"])", duration: Delay.long).show()
                                }
                                
                            }
                        case .failure(let error):
                            CommonUtils.showHudWithNoInteraction(show: false)
                            print("Error in upload: \(error.localizedDescription)")
                           
                        }
                    }
         }
    
    
    // Document Picker delegates Metohds
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        let theFileName = ("\(myURL)" as NSString).lastPathComponent
        portLbl.text = "\(theFileName)"
            doc1 = myURL as NSURL
    }
          

    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerHasNoItemsInLibrary(_ picker: YPImagePicker) {
        
    }
    
    func noPhotos() {}

    func shouldAddToSelection(indexPath: IndexPath, numSelections: Int) -> Bool {
        return true// indexPath.row != 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == tfemail
        {
            if (tfemail.text?.isValidEmail())!
            {
                print("valid email")
                GetEmailExitorNot(email:tfemail.text!)
            }
            else
            {
                print("invalid email")
                Toast(text:"Please enter valid email address",duration:Delay.long).show()
                self.tfemail.text = ""
                
                view.endEditing(true)
            }
            
        }
        else if textField == tfcontact {
            if tfcontact.text!.count > 8 {
                GetnumberValid(number:tfcontact.text!)
            }else{
                print("invalid email")
                Toast(text:"Please enter valid phone number",duration:Delay.long).show()
                self.tfcontact.text = ""
                
                view.endEditing(true)
            }
        }
    }
    
    // MARK: - mobile number valid or not
    func GetnumberValid(number:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["phone":"\(number)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.checknumber, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = "\(dictResult["status"]!)"
                    if status == "FAIL"{
                        //Toast(text:"\(dictResult["message"]!)").show()
                        self.showSimpleAlert(message: String.getString(dictResult["message"]))
                        //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
                        self.tfcontact.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        
                    }
        
                default:
                    print("")
                    //Toast(text:String.getString(dictResult["message"]), duration: Delay.long).show()
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
    
    // MARK: - EmailAlready exit or not
    func GetEmailExitorNot(email:String)  {
        CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["email":"\(email)"]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.checkUserAvil, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let status = "\(dictResult["status"]!)"
                    if status == "FAIL"{
                        Toast(text:"\(dictResult["message"]!)", duration: Delay.long).show()
                        self.tfemail.text = ""
                        self.view.endEditing(true)
                    }
                    else{
                        
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = true
        if(textField == tfcontact) {
            
            let maxLength = 11
            let currentString: NSString = tfcontact.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return result
    }
    
    
}

extension userDetailVC:UINavigationControllerDelegate, UIImagePickerControllerDelegate{
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    var image : UIImage!

    if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            {
                image = img

            }
    else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                image = img
            }
    
    //let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    
    
    self.imgProfile.image = image
                self.profile = image
                self.imgProfile.contentMode = .scaleAspectFill
                self.imgProfile.isHidden=false
    self.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
}
