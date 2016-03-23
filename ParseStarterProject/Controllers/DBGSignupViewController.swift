//
//  MARLoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by miguelicious on 2/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class DBGSignupViewController: UIViewController {

   
    @IBOutlet weak var marEmail: UITextField!
    @IBOutlet weak var marPassword: UITextField!
    @IBOutlet weak var marSignUp: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.view.backgroundColor = UIColor.danyBaseColor()
        marSignUp.layer.backgroundColor = UIColor.danyContrastColor().CGColor
        marEmail.layer.borderWidth = 2
        marPassword.layer.borderWidth = 2
        marEmail.layer.borderColor = UIColor.danyContrastColor().CGColor
        marPassword.layer.borderColor = UIColor.danyContrastColor().CGColor
        marEmail.text = "someone@gmail.com"
        marPassword.text = "Password123"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func loginAfterSignup(){
        PFUser.logInWithUsernameInBackground(marEmail.text!, password: marPassword.text!, block: { (user: PFUser?, error: NSError?) -> Void in
            if error == nil {
                print("user logged in successfully")
                self.presentController("Bienvenido")
            } else {
                print(error)
            }
        })
    }
    
    @IBAction func SignUpWasPressed(sender: AnyObject) {
        if marEmail.text != "" && marPassword.text != "" {
            let user = PFUser()
            user.username = marEmail.text
            user.email = marEmail.text
            user.password = marPassword.text
            
            user.signUpInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if success {
                    print("User signed up successfully")
                } else {
                    print(error)
                }
            })
            
            loginAfterSignup()
            
            
        }
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }

}

extension DBGSignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == marEmail {
            marPassword.becomeFirstResponder()
        } else {
            SignUpWasPressed(self)
        }
        return true
    }
}
