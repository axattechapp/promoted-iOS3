//
//  BaseViewController.swift
//  promoted
//
//  Created by Vikram Sindhu on 16/12/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import Toaster

class BaseViewController: UIViewController, SlideMenuDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        //  let topViewController : UIViewController = self.navigationController!.topViewController!
        //  print("View Controller is : \(topViewController) \n", terminator: "")
        
        switch(index){
        case 0:
              self.openViewControllerBasedOnIdentifier("CompanyProfileVC")
            
            break
        case 1:
            self.openViewControllerBasedOnIdentifier("IdealCandidateVC")
            
            break
        case 2:
            self.openViewControllerBasedOnIdentifier("CurrentJobListVC")
            
            break
        case 3:
            self.openViewControllerBasedOnIdentifier("CompanyinfoVC")
            
            break
        case 4:
            self.openViewControllerBasedOnIdentifier("NotificationMenuVC")
            
            break
        case 5:
            self.openViewControllerBasedOnIdentifier("ChatJobListVC")
            
            break

//        case 6:
//            self.openViewControllerBasedOnIdentifier("MySubscriptionVC")
//
//            break
        case 6:
            self.openViewControllerBasedOnIdentifier("CompanyFAQVC")
            
            break
            
        default:
            print("\n", terminator: "")
        }
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            self.navigationController!.pushViewController(destViewController, animated: true)
        }
    }
    
//    func logout(){
//        UserDefaults.standard.setValue(false, forKey: kIsLogin)
//        UserDefaults.standard.synchronize()
//        self.navigationController?.popToRootViewController(animated: true)
//    }
    

    
    
    
    func onSlideMenuButtonPressed(_ sender : UIButton) {
        
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : MenuController = self.storyboard!.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
}

