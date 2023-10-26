//
//  MatchingDoneVC.swift
//  promoted
//
//  Created by Vikram Sindhu on 13/12/22.
//

import UIKit

class MatchingDoneVC: UIViewController {
    
    var timer = Timer()
    var jobid = Int()
    var matchedArr = [homeScreenModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: false)
    }

    @objc func updateCounting(){
        timer.invalidate()
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateListVC") as? CandidateListVC
        vc?.matchedArr = self.matchedArr
        vc?.jobid = self.jobid
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    
    @IBAction func doneClicked(_ sender: UIButton) {
        //CandidateListVC
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CandidateListVC") as? CandidateListVC
        vc?.jobid = self.jobid
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
}
