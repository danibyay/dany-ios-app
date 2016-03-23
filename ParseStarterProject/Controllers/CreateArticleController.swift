//
//  CreateArticleController.swift
//  iOSitesm2016
//
//  Created by miguelicious on 2/8/16.
//  Copyright © 2016 Parse. All rights reserved.
//  URL: http://ios-class-itesm-2016a.s3.amazonaws.com/iOS-itesm-Feb15-starter.zip
//

import UIKit
import Parse
import GradientCircularProgress


class CreateArticleController: UIViewController {
    
    @IBOutlet weak var marDescription: UITextField!
    @IBOutlet weak var marImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cameraWasPressed(sender: AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: "Choose an option", preferredStyle: .ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Use camera", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
          
                let alertController = UIAlertController(title: "Oops!", message: "No camera found", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            
        })
        
        let picturesAction = UIAlertAction(title: "Use your photos", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.pickMediaFromSource(UIImagePickerControllerSourceType.PhotoLibrary)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(picturesAction)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveWasPressed(sender: AnyObject) {
        if marImage.image != nil && marDescription.text != "" {
            let imageData = UIImageJPEGRepresentation(self.marImage.image!, 1.0)
            let imageFile = PFFile(name: "DinningTable", data: imageData!)
            
            let object = PFObject(className: "Articles")
            object["owner"] = PFUser.currentUser()
            object["image"] = imageFile
            object["description"] = self.marDescription.text
            

            /*
            public func showAtRatio(display display: Bool = true, style: StyleProperty = Style()) -> Void
            
            public func updateRatio(ratio: CGFloat)
            
            public func show(style style: StyleProperty = Style()) -> Void
            
            public func show(message message: String, style: StyleProperty = Style()) -> Void
            
            public func dismiss() -> Void
            
            public func dismiss(completionHandler: () -> Void) -> ()
            */
            // Start KVNProgress here
            
            let progress = GradientCircularProgress()
            
            progress.show(message: "Saving...", style: MyStyle())
            
            object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                print(success)
                if success == true {
                    
                    let alertController = UIAlertController(title: "Success!", message: "Your article has been saved successfully!", preferredStyle: .Alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        
                    }
                    alertController.addAction(OKAction)
                    
                    progress.dismiss()
                    self.presentViewController(alertController, animated: true, completion: nil)
                    self.marDescription.text=""
                    self.marImage.image = nil
                    
                    
                } else {
                    
                    
                    let alertController = UIAlertController(title: "No! :(", message: "There was a problem, please try again!", preferredStyle: .Alert)
                    
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        
                    }
                    alertController.addAction(OKAction)
                    
                    progress.dismiss()
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                }
                
            }
        } else {
            let alertController = UIAlertController(title: "Oops!", message: "You need to select an image and put a description for an article.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
}

extension CreateArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickMediaFromSource(source: UIImagePickerControllerSourceType) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = source
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.marImage.image = image
    }
    
}




















