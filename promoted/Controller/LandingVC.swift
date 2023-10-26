//
//  LandingVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 09/12/22.
//

import UIKit

class LandingVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var lblLogin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataUser = UserDefaults.standard.bool(forKey: kIsLogin)
        if dataUser == true
        {
            let role = UserDefaults.standard.value(forKey: "role")
            //UserDefaults.standard.set(role, forKey: "role")
            if role as! String == "job_seeker"{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userProfileVC") as? userProfileVC
                self.navigationController?.pushViewController(vc!, animated: false)
            }else{
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        }
        else
        {
            
        }
        
        
        userImg.isUserInteractionEnabled = true
        companyImg.isUserInteractionEnabled = true
        let tap2: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(didTapresetPass))
        companyImg.addGestureRecognizer(tap2)
        let tap3: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(didTapPass))
        userImg.addGestureRecognizer(tap3)
        tap2.delegate = self
        tap3.delegate = self
        
        
        
        //UIColor(hexString: "#3A3280")
        let yourAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#3A3280"), NSAttributedString.Key.font:UIFont.init(name: "Poppins-Regular", size: 14)]
        let yourOtherAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#0E7280"), NSAttributedString.Key.font: UIFont.init(name: "Poppins-Bold", size: 14)]
        
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: "Already have an account? ", attributes:yourAttributes as [NSAttributedString.Key : Any]));
        text.append(NSAttributedString(string: "LOGIN HERE", attributes: yourOtherAttributes as [NSAttributedString.Key : Any]))
        lblLogin.attributedText = text
        
        
        //Already have an account? LOGIN HERE
        lblLogin.isUserInteractionEnabled = true
        lblLogin.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    
    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        
//        let text = "Already have an account? LOGIN HERE"
//        let termsRange = (text as NSString).range(of: "LOGIN HERE")
//
//        if gesture.didTapAttributedTextInLabel(label: lblLogin, inRange: termsRange) {
//            print("Tapped Login")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            self.navigationController?.pushViewController(vc!, animated: false)
            
//        } else {
//            print("Tapped none")
//        }
    }
    
    
    @objc func didTapresetPass(sender: UITapGestureRecognizer)
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: false)

    }
    
    @objc func didTapPass(sender: UITapGestureRecognizer)
    {
        UserDefaults.standard.set(nil, forKey: "candidateExpArray")
        UserDefaults.standard.set(nil, forKey: "videoFlag")
        UserDefaults.standard.set(nil, forKey: "JobTypeItems")
        UserDefaults.standard.set(nil, forKey: "IndustryValue")
        UserDefaults.standard.set(nil, forKey: "industryid")
        UserDefaults.standard.set(nil, forKey: "RoleValue")
        UserDefaults.standard.set(nil, forKey: "salaryValue")
        UserDefaults.standard.set(nil, forKey: "lengthValue")
        UserDefaults.standard.set(nil, forKey: "expFlag")
        UserDefaults.standard.set(nil, forKey: "EduFlag")
        UserDefaults.standard.set(nil, forKey: "ProFlag")
        UserDefaults.standard.set(nil, forKey: "certFlag")
        UserDefaults.standard.set(nil, forKey: "doc1")
        UserDefaults.standard.set(nil, forKey: "preferTitle1")
        UserDefaults.standard.set(nil, forKey: "preferIssuer1")
        UserDefaults.standard.set(nil, forKey: "doc2")
        UserDefaults.standard.set(nil, forKey: "preferTitle2")
        UserDefaults.standard.set(nil, forKey: "preferIssuer2")
        UserDefaults.standard.set(nil, forKey: "doc3")
        UserDefaults.standard.set(nil, forKey: "preferTitle3")
        UserDefaults.standard.set(nil, forKey: "preferIssuer3")
        UserDefaults.standard.set(nil, forKey: "doc4")
        UserDefaults.standard.set(nil, forKey: "preferTitle4")
        UserDefaults.standard.set(nil, forKey: "preferIssuer4")
        UserDefaults.standard.set(nil, forKey: "doc5")
        UserDefaults.standard.set(nil, forKey: "preferTitle5")
        UserDefaults.standard.set(nil, forKey: "preferIssuer5")
        UserDefaults.standard.synchronize()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "userSignupVC") as? userSignupVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
}

extension UITapGestureRecognizer {

    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
        //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
        // locationOfTouchInLabel.y - textContainerOffset.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
