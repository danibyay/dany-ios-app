//
//  EditArticleViewController.swift
//  iOSitesm2016
//
//  Created by Daniela Becerra on 25/02/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse
import GradientCircularProgress

class EditArticleViewController: UIViewController {
   
    @IBOutlet weak var dbgImage: UIImageView!
    @IBOutlet weak var dbgDescription: UITextView!
    var initialDescription : String!
    var currentId : String!
    
    var articleDescription : String?
    var imagedata : NSData?
    
    var objectIds : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let d = articleDescription {
            dbgDescription.text = d
            initialDescription = d
        }
        if let i = imagedata{
            dbgImage.image = UIImage(data: i)
        }
    }
    
    
    @IBAction func changePictureWasPressed(sender: AnyObject) {
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
    
    //doesn't work if the description is repeated
    @IBAction func saveWasPressed(sender: AnyObject) {
        //progress spinner show
        let progress = GradientCircularProgress()
        progress.show(message: "Saving...", style: MyStyle())
        
        let query = PFQuery(className: "Anuncios")
        query.whereKey("Colonia", equalTo: initialDescription)
        
        //get id of current article object ASYNC
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                // Save id
                if let objects = objects {
                    for object in objects {
                        self.currentId = object.objectId!
                        print(self.currentId)
                    }
                }
                //update object
                query.getObjectInBackgroundWithId(self.currentId) {
                    (anuncio: PFObject?, error: NSError?) -> Void in
                    if error != nil {
                        print(error)
                    } else if let anuncio = anuncio {
                        anuncio["Colonia"] = self.dbgDescription.text
                        self.saveToParse(anuncio, progress: progress)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
        
    }
    
    func saveToParse(object: PFObject, progress: GradientCircularProgress){
        object.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print(success)
            if success == true {
                
                let alertController = UIAlertController(title: "Success!", message: "Your article has been saved successfully!", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    
                }
                alertController.addAction(OKAction)
                
                progress.dismiss()
                self.presentViewController(alertController, animated: true, completion: nil)
               
                
                
            } else {
                
                
                let alertController = UIAlertController(title: "No! :(", message: "There was a problem, please try again!", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    
                }
                alertController.addAction(OKAction)
                
                progress.dismiss()
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
        }
    }
    
    
    
    
}
extension EditArticleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        self.dbgImage.image = image
    }
    
}

