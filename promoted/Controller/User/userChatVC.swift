//
//  userChatVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 26/12/22.
//

import UIKit
import Toaster
import Alamofire
import SwiftyJSON
import MBProgressHUD
import MobileCoreServices
import UniformTypeIdentifiers

class userChatVC: BaseViewController2,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIImagePickerControllerDelegate,UIDocumentPickerDelegate{
    
    @IBOutlet weak var listTbl: UITableView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    var receiver_id = String()
    var unread = String()
    var timer: Timer?
    var new = Bool()
    var messageArr = [ChatScreenModal]()
    var uploadFlag = 0
    var doc1 = NSURL()
    var profile:UIImage?
    var unreadArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpObserver()
        unreadArr = unread.components(separatedBy: ",")
    }
    
    private func setUpObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc func keyboardWillChange(notification: Notification) {

            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }

            if notification.name == UIResponder.keyboardWillShowNotification {
                //view.frame.origin.y = -keyboardSize.height
                viewBottom.constant = keyboardSize.height
            } else {
                //view.frame.origin.y = 13
                viewBottom.constant = 13
            }
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listTbl.rowHeight = UITableView.automaticDimension
        listTbl.delegate = self
        listTbl.dataSource = self
        btnSend.layer.cornerRadius = 10.0
        editView.layer.cornerRadius = 10.0
        
        addDoneButtonOnKeyboard()
        new = true
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy,hh:mma"
        let someDateTime = formatter.string(from: currentDateTime)
        lblDate.text = "Today, \(someDateTime)"
        getAllMessageAPI()
    }
    
    func schedule() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 15, target: self,
                                       selector: #selector(self.timerDidFire(timer:)), userInfo: nil, repeats: true)
        }
      }

      @objc private func timerDidFire(timer: Timer) {
          new = false
          let currentDateTime = Date()
          let formatter = DateFormatter()
          formatter.dateFormat = "dd MMMM yyyy,hh:mma"
          let someDateTime = formatter.string(from: currentDateTime)
          lblDate.text = "Today, \(someDateTime)"
          unreadArr.removeAll()
          getAllMessageAPI()
      }
    
    func addDoneButtonOnKeyboard(){
          let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
          doneToolbar.barStyle = .default

          let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

          let items = [flexSpace, done]
          doneToolbar.items = items
          doneToolbar.sizeToFit()
          textview.inputAccessoryView = doneToolbar
      }
       
       @objc func doneButtonAction(){
           //textview.text = "Write your message"
        textview.resignFirstResponder()
           
       }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func attachmentClicked(_ sender: UIButton) {
        
        
        let actionSheet = UIAlertController(title: "Choose Source", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.popoverPresentationController?.sourceView = view
        //        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        actionSheet.addAction(UIAlertAction(title: "Image", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.imageUpload()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Document", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.docUpload()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imageUpload(){
        
        let imagePickerController = UIImagePickerController()
            imagePickerController.allowsEditing = true //If you want edit option set "true"
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
        
            present(imagePickerController, animated: true, completion: nil)
        
//        ImagePickerHandler.shared.showActionSheet(vc: self, view: self.view)
//        ImagePickerHandler.shared.imagePickedBlock = { (img, data) in
//            self.profile = img
//            self.uploadImgAPI()
//        }
    }
    
    func docUpload(){
        uploadFlag = 1
        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
    }
    
    // Document Picker delegates Metohds
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        //let theFileName = ("\(myURL)" as NSString).lastPathComponent
        if uploadFlag == 0 {
            print("import result : \(myURL)")
        }else if uploadFlag == 1{
            doc1 = myURL as NSURL
            self.uploadDocAPI()
        }else{
            
        }
        
    }
          

    public func documentMenu(_ documentMenu:UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        uploadFlag = 0
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func sendClicked(_ sender: UIButton) {
        viewHeight.constant = 40.0
        //textViewDidEndEditing(textview)
        if textview.text! == "" {
            Toast(text:"Write Something!", duration: Delay.long).show()
        }else if textview.text == "Write your message"{
            
        }
        else{
            SendMessageAPI(msg: textview.text!)
            textview.text = "Write your message"
            //textview.resignFirstResponder()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj = messageArr[indexPath.row]
        
        if receiver_id == obj.receiver_id {
            if obj.is_file == 0 {
                let cell = listTbl.dequeueReusableCell(withIdentifier: "rightViewCell", for: indexPath) as! rightViewCell
                cell.msg.text = obj.message
                let imageurl =  String.getString(obj.profile_image)
                let url = URL(string: "\(imageurl.removeWhitespace())")

                cell.userImg.kf.setImage(with: url)
                //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                cell.time.text = "\(obj.date!) \(obj.time!)"
                
                return cell
                
            }else{
                if obj.file_type == "image"{
                    let cell = listTbl.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as! rightImageCell
                    let offerurl = String.getString(obj.document)
                    let url2 = URL(string: "\(offerurl.removeWhitespace())")

                    cell.msg.kf.setImage(with: url2)
                    //cell.msg.downlodeImage(serviceurl: offerurl, placeHolder: nil)
                    let imageurl =  String.getString(obj.profile_image)
                    let url = URL(string: "\(imageurl.removeWhitespace())")

                    cell.userImg.kf.setImage(with: url)
                    //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                    cell.time.text = "\(obj.date!) \(obj.time!)"
                    
                    return cell
                }else{
                    let cell = listTbl.dequeueReusableCell(withIdentifier: "rightDocCell", for: indexPath) as! rightDocCell
                    let offerurl = String.getString(obj.document)
                    if offerurl != ""{
                        let url = URL(string: offerurl.removeWhitespace())
                        let filename = url?.lastPathComponent ?? "file.pdf"
                        cell.msg.text = filename
                    }
                    let imageurl =  String.getString(obj.profile_image)
                    let url = URL(string: "\(imageurl.removeWhitespace())")

                    cell.userImg.kf.setImage(with: url)
                    //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                    cell.time.text = "\(obj.date!) \(obj.time!)"
                    
                    return cell
                }
            }
        }else{
            if obj.is_file == 0 {
                let cell = listTbl.dequeueReusableCell(withIdentifier: "leftViewCell", for: indexPath) as! leftViewCell
                cell.msg.text = obj.message
                if unreadArr.contains("\(obj.id!)"){
                    cell.msg.font = UIFont(name: "Poppins-Bold", size: 12.0)
                    
                }else{
                    cell.msg.font = UIFont(name: "Poppins-Regular", size: 12.0)
                }
                let imageurl =  String.getString(obj.profile_image)
                let url = URL(string: "\(imageurl.removeWhitespace())")

                cell.userImg.kf.setImage(with: url)
                //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                cell.time.text = "\(obj.date!) \(obj.time!)"
                return cell
                
            }else{
                if obj.file_type == "image"{
                    let cell = listTbl.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as! leftImageCell
                    let offerurl = String.getString(obj.document)
                    let url2 = URL(string: "\(offerurl)")

                    cell.msg.kf.setImage(with: url2)
                    //cell.msg.downlodeImage(serviceurl: offerurl, placeHolder: nil)
                    let imageurl =  String.getString(obj.profile_image)
                    let url = URL(string: "\(imageurl.removeWhitespace())")

                    cell.userImg.kf.setImage(with: url)
                    //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                    cell.time.text = "\(obj.date!) \(obj.time!)"
                    
                    return cell
                }else{
                    let cell = listTbl.dequeueReusableCell(withIdentifier: "leftDocCell", for: indexPath) as! leftDocCell
                    let offerurl = String.getString(obj.document)
                    if offerurl != ""{
                        let url = URL(string:"\(offerurl.removeWhitespace())")
                        let filename = url?.lastPathComponent ?? "file.pdf"
                        cell.msg.text = filename
                    }
                    if unreadArr.contains("\(obj.id!)"){
                        cell.msg.font = UIFont(name: "Poppins-Bold", size: 12.0)
                        
                    }else{
                        cell.msg.font = UIFont(name: "Poppins-Regular", size: 12.0)
                    }
                    let imageurl =  String.getString(obj.profile_image)
                    let url = URL(string: "\(imageurl.removeWhitespace())")

                    cell.userImg.kf.setImage(with: url)
                    //cell.userImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
                    cell.time.text = "\(obj.date!) \(obj.time!)"
                    
                    return cell
                    
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let obj = messageArr[indexPath.row]
        if obj.message?.count == 0 {
            let offerurl = String.getString(obj.document)
            if offerurl != ""{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "webViewController") as? webViewController
                vc?.urlStr = offerurl
                self.navigationController?.pushViewController(vc!, animated: false)
             
                //guard let pdfURL = URL(string: offerurl) else { return  }
                
                //UIApplication.shared.open(pdfURL)
            }
        }
     
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {

      // Run code here for when user begins type into the text view
        
        if textview == textview {
            //animateViewMoving(up: true, moveValue: 380)
        }
        textview.text = ""
        //viewHeight.constant = 215.0
        //editView.layer.backgroundColor = UIColor.clear.cgColor
        

    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height > 40.0
        {
            viewHeight.constant = 150.0
        }
        else
        {
            viewHeight.constant = 40.0
            
        }
//          let fixedWidth = textView.frame.size.width
//          textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//          let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//          var newFrame = textView.frame
//          newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//          textView.frame = newFrame
    }

    func textViewDidEndEditing(_ textView: UITextView) {

      // Run code here for when user ends editing text view
        
        if textview == textview {
            //animateViewMoving(up: false, moveValue: 380)
        }
        //viewHeight.constant = 65.0
        //editView.layer.backgroundColor = UIColor(hexString: "#F6F6F6").cgColor

    }
    
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func getAllMessageAPI(){
        
        //CommonUtils.showHudWithNoInteraction(show: true)
        let params:[String:Any] = ["receiver_id":"\(receiver_id)"]
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.getCompanyAllMessage, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            //CommonUtils.showHudWithNoInteraction(show: false)
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
                        
                        
                        
                        self.messageArr.removeAll()
                        self.messageArr = datashow.map{ChatScreenModal(data: $0)}

                        self.listTbl.reloadData()
                        if self.messageArr.count != 0 {
                            if self.new == true{
                                let topRow = IndexPath(row: self.messageArr.count - 1,
                                                           section: 0)
                                self.listTbl.scrollToRow(at: topRow, at: .bottom, animated: true)
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
    
    func SendMessageAPI(msg:String){
        
        CommonUtils.showHudWithNoInteraction(show: false)
        let params:[String:Any] = ["receiver_id":"\(receiver_id)", "message": msg]
        
        ONetworkManager.sharedInstance.requestApi(withServiceName: ServiceName.sendCompanyMessage, requestMethod: .POST, requestParameters: params, withProgressHUD: false) { (result:Any?, error:Error?, errorType:ErrorType?,statusCode:Int?) in
            CommonUtils.showHudWithNoInteraction(show: false)
            if errorType == .requestSuccess {
                let dictResult = kSharedInstance.getDictionary(result)
                
                switch Int.getInt(statusCode) {
                case 200:
                    let datashow = kSharedInstance.getArray(withDictionary: dictResult["data"])
                    print(datashow)
                    self.new = true
                    self.unreadArr.removeAll()
                    self.getAllMessageAPI()
        
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
    
    // MARK:- Upload Doc API
    func uploadDocAPI() {
        CommonUtils.showHudWithNoInteraction(show: true)
        let url: String = kBASEURL + ServiceName.uploadDoc
        print(url)
        var header = [String: String]()
        if let token = UserDefaults.standard.value(forKey:"token"){
            header = ["Content-Type" : "application/json","Authorization": "Bearer \(token)"]
        } else {
            header = [:]
        }
        print(header)
        let params = ["receiver_id": "\(receiver_id)"] as [String : String]
        
        print("paramstes \(params)")
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in params {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }
                
                if ("\(self.doc1)" as NSString) != ""{
                    let data1 = try! Data(contentsOf: self.doc1 as URL)
                    let theFileName = ("\(self.doc1)" as NSString).lastPathComponent
                    multipartFormData.append(data1, withName: "document", fileName: "\(theFileName)", mimeType:"application/pdf")
                }else{
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "document")
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
                            self.new = true
                            self.unreadArr.removeAll()
                            self.getAllMessageAPI()
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
    
    
    
    // MARK:- Upload Img API
    func uploadImgAPI() {
        CommonUtils.showHudWithNoInteraction(show: true)
        let url: String = kBASEURL + ServiceName.uploadDoc
        print(url)
        var header = [String: String]()
        if let token = UserDefaults.standard.value(forKey:"token"){
            header = ["Content-Type" : "application/json","Authorization": "Bearer \(token)"]
        } else {
            header = [:]
        }
        print(header)
        let params = ["receiver_id": "\(receiver_id)"] as [String : String]
        
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
                    multipartFormData.append(imgData!, withName: "document", fileName: "image\(someDateTime).jpg", mimeType:"image/jpeg")
                }else{
                    multipartFormData.append("".data(using: String.Encoding.utf8)!, withName: "document")
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
                            self.new = true
                            self.unreadArr.removeAll()
                            self.getAllMessageAPI()
                            
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
    
}

extension userChatVC:UINavigationControllerDelegate{
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
    
    self.profile = image
                self.uploadImgAPI()
    self.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
}
