//
//  webViewController.swift
//  promoted
//
//  Created by Vikram Sindhu on 09/12/22.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    
    @IBOutlet  weak var closeBtn: UIButton!
    
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlStr = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                // Do any additional setup after loading the view.
                //let urlString = "http://www.youtube.com";
                let request = URLRequest(url:URL(string: urlStr)!)
                self.webView.load(request)
    }
    
    
    
    @IBAction func closeClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

