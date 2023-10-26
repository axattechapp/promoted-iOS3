//
//  CreateProfileVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 09/12/22.
//

import UIKit

class CreateProfileVC: UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var recruiterView: UIView!
    @IBOutlet weak var lblRecruiter: UILabel!
    
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var lblCompany: UILabel!
    
    
    
    var UserType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        nextBtn.layer.cornerRadius = 10.0
        recruiterView.layer.cornerRadius = 10.0
        companyView.layer.cornerRadius = 10.0
        let role = UserDefaults.standard.value(forKey:"urole")
        if role as? String == "company" {
            UserType = 1
            recruiterView.backgroundColor = UIColor(hexString: "#EBEBEB")
            lblRecruiter.textColor = UIColor(hexString: "#898989")
            companyView.backgroundColor = UIColor(hexString: "#0E7280")
            lblCompany.textColor = UIColor(hexString: "#FFFFFF")
        }else if role as? String == "recruiter" {
            UserType = 2
            companyView.backgroundColor = UIColor(hexString: "#EBEBEB")
            lblCompany.textColor = UIColor(hexString: "#898989")
            recruiterView.backgroundColor = UIColor(hexString: "#0E7280")
            lblRecruiter.textColor = UIColor(hexString: "#FFFFFF")
        }else{
            UserType = 0
            companyView.backgroundColor = UIColor(hexString: "#EBEBEB")
            lblCompany.textColor = UIColor(hexString: "#898989")
            recruiterView.backgroundColor = UIColor(hexString: "#EBEBEB")
            lblRecruiter.textColor = UIColor(hexString: "#898989")
        }
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        
        if UserType == 1 {
            UserDefaults.standard.set("company", forKey: "urole")
            UserDefaults.standard.synchronize()
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreateProfileVC1") as? CreateProfileVC1
            vc?.role = "company"
            self.navigationController?.pushViewController(vc!, animated: false)
            
        }else if UserType == 2 {
            UserDefaults.standard.set("recruiter", forKey: "urole")
            UserDefaults.standard.synchronize()
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CreateProfileVC1") as? CreateProfileVC1
            vc?.role = "recruiter"
            self.navigationController?.pushViewController(vc!, animated: false)
            
        }else{
            let alert = UIAlertController(title: "Procruited", message: "Please Select User Type", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func recruitClicked(_ sender: UIButton) {
        UserType = 2
        companyView.backgroundColor = UIColor(hexString: "#EBEBEB")
        lblCompany.textColor = UIColor(hexString: "#898989")
        recruiterView.backgroundColor = UIColor(hexString: "#0E7280")
        lblRecruiter.textColor = UIColor(hexString: "#FFFFFF")
    }
    
    @IBAction func companyClicked(_ sender: UIButton) {
        UserType = 1
        recruiterView.backgroundColor = UIColor(hexString: "#EBEBEB")
        lblRecruiter.textColor = UIColor(hexString: "#898989")
        companyView.backgroundColor = UIColor(hexString: "#0E7280")
        lblCompany.textColor = UIColor(hexString: "#FFFFFF")
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
