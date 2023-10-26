//
//  NotificationDetailVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 19/12/22.
//

import UIKit

class NotificationDetailVC: BaseViewController,UITextViewDelegate {
    
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardViewImg: UIView!
    @IBOutlet weak var cardViewLbl1: UILabel!
    @IBOutlet weak var cardViewLbl2: UILabel!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view1Lbl: UILabel!
    @IBOutlet weak var view1img: UIImageView!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view2Lbl: UILabel!
    @IBOutlet weak var view2img: UIImageView!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view3Lbl: UILabel!
    @IBOutlet weak var view3img: UIImageView!
    
    
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var tvNote: UITextView!
    
    
    var NotificationType =  String()
    var NotificationStatus = String()
    var Note = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvNote.inputAccessoryView = toolBar()
        
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnSelect.layer.cornerRadius = 10.0
        cardView.layer.cornerRadius = 10.0
        cardViewImg.layer.cornerRadius = 10.0
        
        
        // shadow
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 4.0
        
        view1.layer.cornerRadius = 10.0
        view1.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view1.layer.borderWidth = 1.0
        view2.layer.cornerRadius = 10.0
        view2.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view2.layer.borderWidth = 1.0
        view3.layer.cornerRadius = 10.0
        view3.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        view3.layer.borderWidth = 1.0
        noteView.layer.cornerRadius = 10.0
        noteView.layer.borderColor = UIColor(hexString: "#DDDDDD").cgColor
        noteView.layer.borderWidth = 1.0
        
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        view3.isUserInteractionEnabled = true
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(view1Select))
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(view2Select))
        view2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(view3Select))
        view3.addGestureRecognizer(tapGesture3)
        
        cardViewLbl1.text = NotificationType
        
    }
    
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func selectCandidateClicked(_ sender: UIButton) {
        Note = tvNote.text
        if NotificationStatus == "" && Note == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please select a notification status or add note", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationJobListVC") as? NotificationJobListVC
            vc!.NotificationType =  NotificationType
            vc!.NotificationStatus = NotificationStatus
            vc!.Note = Note
            self.navigationController?.pushViewController(vc!, animated: false)
        }
    }
    
    @objc func view1Select() {
        if tvNote.text.count != 0 {
            
        }else{
            tvNote.isUserInteractionEnabled = false
            NotificationStatus = view1Lbl.text!
            view1.layer.backgroundColor = UIColor(hexString: "#0E7280").cgColor
            view1Lbl.textColor = UIColor.white
            view1img.image = UIImage(named: "check")
            
            view2.layer.backgroundColor = UIColor.white.cgColor
            view2Lbl.textColor = UIColor(hexString: "#484848")
            view2img.image = UIImage(named: "circle")
            
            view3.layer.backgroundColor = UIColor.white.cgColor
            view3Lbl.textColor = UIColor(hexString: "#484848")
            view3img.image = UIImage(named: "circle")
        }
        
        
    }
    
    @objc func view2Select() {
        if tvNote.text.count != 0 {
            
        }else{
            tvNote.isUserInteractionEnabled = false
            NotificationStatus = view2Lbl.text!
            view2.layer.backgroundColor = UIColor(hexString: "#0E7280").cgColor
            view2Lbl.textColor = UIColor.white
            view2img.image = UIImage(named: "check")
            
            view1.layer.backgroundColor = UIColor.white.cgColor
            view1Lbl.textColor = UIColor(hexString: "#484848")
            view1img.image = UIImage(named: "circle")
            
            view3.layer.backgroundColor = UIColor.white.cgColor
            view3Lbl.textColor = UIColor(hexString: "#484848")
            view3img.image = UIImage(named: "circle")
        }
    }
    
    @objc func view3Select() {
        if tvNote.text.count != 0 {
            
        }else{
            tvNote.isUserInteractionEnabled = false
            NotificationStatus = view3Lbl.text!
            view3.layer.backgroundColor = UIColor(hexString: "#0E7280").cgColor
            view3Lbl.textColor = UIColor.white
            view3img.image = UIImage(named: "check")
            
            view2.layer.backgroundColor = UIColor.white.cgColor
            view2Lbl.textColor = UIColor(hexString: "#484848")
            view2img.image = UIImage(named: "circle")
            
            view1.layer.backgroundColor = UIColor.white.cgColor
            view1Lbl.textColor = UIColor(hexString: "#484848")
            view1img.image = UIImage(named: "circle")
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
                tvNote.endEditing(true)
                let alert = UIAlertController(title: "Procruited", message: "Max 200 words Reached!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            return true
        }
    
    
}
