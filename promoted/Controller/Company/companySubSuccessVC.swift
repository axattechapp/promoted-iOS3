//
//  companySubSuccessVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 20/12/22.
//

import UIKit

class companySubSuccessVC: BaseViewController{
    
    @IBOutlet weak var btnOk: UIButton!
    
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var img3: UIImageView!
    
    
    var count = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img2.isHidden = true
        img3.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnOk.layer.cornerRadius = 10.0
        updateView()
        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    @objc func updateCounting(){
       // NSLog("counting..")
        count += 1
        updateView()
    }
    
    func updateView(){
        if count == 0{
            img2.isHidden = true
            img3.isHidden = true
            img1.isHidden = false
        }else if count == 1 {
            img1.isHidden = true
            img2.isHidden = false
            img3.isHidden = true
        }else{
            timer.invalidate()
            img1.isHidden = false
            img2.isHidden = true
            img3.isHidden = false
        }
    }
    
    
    @IBAction func menuClicked(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func homeClicked(_ sender: UIButton){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func selectClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CompanyProfileVC") as? CompanyProfileVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
}
