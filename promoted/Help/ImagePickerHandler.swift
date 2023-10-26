//
//  ImagePickerHandler.swift
//  promoted
//
//  Created by Vikram Sindhu on 20/01/23.
//

import Foundation
import CropViewController
class ImagePickerHandler: NSObject{
    static let shared = ImagePickerHandler()
    
    fileprivate var currentVC: UIViewController!
    
    //MARK: Internal Properties
    var imagePickedBlock: ((UIImage, Data) -> Void)?
    
    func camera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            myPickerController.modalPresentationStyle = .fullScreen
            currentVC.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func photoLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            myPickerController.modalPresentationStyle = .fullScreen
            currentVC.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func showActionSheet(vc: UIViewController, view: UIView) {
        currentVC = vc
        let actionSheet = UIAlertController(title: "Choose Source", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.popoverPresentationController?.sourceView = view
        //        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }
    
}


extension ImagePickerHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //let vc = CropViewController(image: image)
            let vc = CropViewController(croppingStyle: .circular, image: image)
            vc.delegate = self
            picker.present(vc, animated: true, completion: nil)
        } else {
            print("Something went wrong")
            currentVC.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ImagePickerHandler : CropViewControllerDelegate {
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        currentVC.dismiss(animated: true) {
            if let data = image.pngData() {
                self.imagePickedBlock?(image, data)
            }
        }
    }
}
