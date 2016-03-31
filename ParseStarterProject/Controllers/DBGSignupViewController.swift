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

    
    @IBOutlet weak var marEmail: DBGSimpleTextField!
    @IBOutlet weak var marPassword: DBGSimpleTextField!
    @IBOutlet weak var marSignUp: DBGSimplebutton!
    @IBOutlet weak var dbgExit: DBGCrossButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self.view.backgroundColor = UIColor.danyBaseColor()
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
    @IBAction func exitWasPressed(sender: AnyObject) {
        print("cross was pressed")
        self.dismissViewControllerAnimated(true, completion: nil)
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
