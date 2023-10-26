//
//  NotificationMenuVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 19/12/22.
//

import UIKit

class NotificationMenuVC: BaseViewController {
    
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view1img: UIView!
    @IBOutlet weak var view1lbl1: UILabel!
    @IBOutlet weak var view1lbl2: UILabel!
    @IBOutlet weak var imgView1: UIImageView!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view2img: UIView!
    @IBOutlet weak var view2lbl1: UILabel!
    @IBOutlet weak var view2lbl2: UILabel!
    @IBOutlet weak var imgView2: UIImageView!
    

    
    var NotificationType =  String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnSend.layer.cornerRadius = 10.0
        view1.layer.cornerRadius = 10.0
        view1img.layer.cornerRadius = 10.0
        
        view2.layer.cornerRadius = 10.0
        view2img.layer.cornerRadius = 10.0
        
        
        // shadow
        view1.layer.shadowColor = UIColor.black.cgColor
        view1.layer.shadowOffset = CGSize(width: 3, height: 3)
        view1.layer.shadowOpacity = 0.7
        view1.layer.shadowRadius = 4.0
        
        // shadow
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOffset = CGSize(width: 3, height: 3)
        view2.layer.shadowOpacity = 0.7
        view2.layer.shadowRadius = 4.0
        
        
        view1.isUserInteractionEnabled = true
        view2.isUserInteractionEnabled = true
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(view1Select))
        view1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(view2Select))
        view2.addGestureRecognizer(tapGesture2)
        
        
        
        
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    
    @IBAction func sendNotificationClicked(_ sender: UIButton) {
        if NotificationType == ""{
            let alert = UIAlertController(title: "Procruited", message: "Please Select A Notification Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "NotificationDetailVC") as? NotificationDetailVC
            vc!.NotificationType = NotificationType
            self.navigationController?.pushViewController(vc!, animated: false)
        }
        
    }
    
    
    @objc func view1Select() {
        NotificationType = view1lbl1.text!
        view1.layer.backgroundColor = UIColor(hexString: "#0E7280").cgColor
        view1lbl1.textColor = UIColor.white
        view1lbl2.textColor = UIColor.white
        imgView1.image = UIImage(named: "arrowWhite")
        //arrowWhite
        
        view2.layer.backgroundColor = UIColor.white.cgColor
        view2lbl1.textColor = UIColor(hexString: "#484848")
        view2lbl2.textColor = UIColor(hexString: "#484848")
        imgView2.image = UIImage(named: "arrow2")
        //arrow2
        
       
        
    }
    
    @objc func view2Select() {
        NotificationType = view2lbl1.text!
        view2.layer.backgroundColor = UIColor(hexString: "#0E7280").cgColor
        view2lbl1.textColor = UIColor.white
        view2lbl2.textColor = UIColor.white
        imgView2.image = UIImage(named: "arrowWhite")
        
        view1.layer.backgroundColor = UIColor.white.cgColor
        view1lbl1.textColor = UIColor(hexString: "#484848")
        view1lbl2.textColor = UIColor(hexString: "#484848")
        imgView1.image = UIImage(named: "arrow2")
        
        
        
    }
    
}
