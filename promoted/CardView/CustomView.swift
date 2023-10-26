//
//  CustomView.swift
//  TinderSwipeView_Example
//
//  Created by Nick on 29/05/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Kingfisher

class CustomView: UIView {
        
    @IBOutlet var contentView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMatch: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    
    @IBOutlet weak var lblCompany: UILabel!
    
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    var userModel : UserModel! {
        didSet{
            self.lblName.attributedText = self.attributeStringForModel(userModel: userModel)
//            self.labelLocation.text = "\(userModel.location ?? "")"
            let url = URL(string: "\(userModel.img.removeWhitespace())")
            self.profileImg.kf.setImage(with: url)
            //let imageurl =  String.getString(userModel.img)
            //self.profileImg.downlodeImage(serviceurl: imageurl, placeHolder: nil)
            self.lblMatch.text = "\(userModel.match!)"
            self.lblJob.text = "\(userModel.job!)"
            self.lblCompany.text = "\(userModel.company!)"
            self.lblContact.text = "\(userModel.contact!)"
            self.lblAddress.text = "\(userModel.address!)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(CustomView.className, owner: self, options: nil)
        contentView.fixInView(self)
        
        profileImg.contentMode = .scaleAspectFill
        profileImg.layer.cornerRadius = 30
        profileImg.clipsToBounds = true
    }
    
    private func attributeStringForModel(userModel:UserModel) -> NSAttributedString{
        
        let attributedText = NSMutableAttributedString(string: userModel.name, attributes: [.foregroundColor: UIColor.white,.font:UIFont.boldSystemFont(ofSize: 25)])
        
        return attributedText
    }

}

extension UIView{
    
    func fixInView(_ container: UIView!) -> Void{
        
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
