//
//  keybaord.swift
//  procruited
//
//  Created by Vikram Sindhu on 21/07/23.
//

import Foundation
import UIKit

extension UIViewController{
    func toolBar() -> UIToolbar{
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        return doneToolbar
        
    }

    @objc func onClickDoneButton(){
        view.endEditing(true)
    }

    @objc func onClickCancelButton(){
        view.endEditing(true)
    }
}
